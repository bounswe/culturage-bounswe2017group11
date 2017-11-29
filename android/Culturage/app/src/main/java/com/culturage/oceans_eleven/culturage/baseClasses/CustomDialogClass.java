package com.culturage.oceans_eleven.culturage.baseClasses;

import android.app.Activity;
import android.app.Dialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Rect;
import android.os.AsyncTask;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.Window;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.Toast;

import com.culturage.oceans_eleven.culturage.R;
import com.culturage.oceans_eleven.culturage.adapters.CommentAdapter;
import com.culturage.oceans_eleven.culturage.network.Fetcher;
import com.culturage.oceans_eleven.culturage.network.PostJSON;
import com.culturage.oceans_eleven.culturage.newsFeed.HeritageItemViewActivity;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;

public class CustomDialogClass extends Dialog implements
        android.view.View.OnClickListener {

    //    private final String LOG_TAG = "dialog_tag";
    private Activity activity;
    private int postId;
    private HeritageItem currentItem;
    private CommentAdapter commentAdapter;

    public CustomDialogClass(Activity activity, int postId, HeritageItem currentItem) {
        super(activity);
        this.activity = activity;
        this.postId = postId;
        this.currentItem = currentItem;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(R.layout.custom_dialog);

        ImageButton uploadCommentBtn = (ImageButton) findViewById(R.id.upload_comment);
        ImageButton cancelCommentBtn = (ImageButton) findViewById(R.id.cancel_comment);
        ImageButton backBtn = (ImageButton) findViewById(R.id.comment_back);


        uploadCommentBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                EditText edit_comment = (EditText) findViewById(R.id.edit_comment);
                String text = edit_comment.getText().toString();
                if (!text.equals("")) {
                    new postComment(text).execute();
                    Toast.makeText(activity, "Commented Successfuly", Toast.LENGTH_SHORT).show();
                } else {
                    Toast.makeText(activity, "Comment is not allowed", Toast.LENGTH_SHORT).show();
                }
                dismiss();
                if (currentItem != null) {
                    currentItem.setmCommentCount(currentItem.getmCommentCount() + 1);
                    Intent intent = new Intent(getContext(), HeritageItemViewActivity.class);
                    intent.putExtra("postId", currentItem.getmPostId());
                    intent.putExtra("title", currentItem.getmTitle());
                    intent.putExtra("description", currentItem.getmDescription());
                    intent.putExtra("imageUrl", currentItem.getmImageUrl());
                    intent.putExtra("israted", currentItem.isRated());
                    getContext().startActivity(intent);
                }
            }
        });

        cancelCommentBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                activity.finish();
                activity.startActivity(activity.getIntent());
                dismiss();
            }
        });

        backBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                activity.finish();
                activity.startActivity(activity.getIntent());
                dismiss();
            }
        });


        new commentLoader().execute();

    }

    @Override
    public void onBackPressed() {
        //refresh previous intend
        dismiss();
        activity.finish();
        activity.startActivity(activity.getIntent());
        //activity.startActivity(activity.getIntent());
    }

    @Override
    public void onClick(View v) {
    }

    private class commentLoader extends AsyncTask<String, String, String> {

        private String commentsUrl = "http://18.220.108.135/api/items/" + postId + "/comments";
        private ArrayList<Comment> comments = new ArrayList<>();

        private commentLoader() {
        }

        @Override
        protected String doInBackground(String... params) {
            Log.v("commentLoader", "resulting json before commentUrl " + commentsUrl);
            String result = null;
            try {
                result = Fetcher.getJSON(Fetcher.createUrl(commentsUrl), getContext());
                Log.v("CommentLoader", "resulting json for commentsUrl " + result);
            } catch (Exception e) {
                Log.v("ComentLoader", "exception" + Log.getStackTraceString(e));
                Log.v("commentsUrl", "invalid url: " + commentsUrl);
            }
            try {
                Log.v("CommentLoader", "resulting json after commentsUrl: " + result);
                JSONArray valuesArray = new JSONArray(result);
                for (int i = valuesArray.length() - 1; i >= 0; i--) {
                    JSONObject values = valuesArray.getJSONObject(i);
                    JSONObject user = values.getJSONObject("written_by");
                    comments.add(new Comment(values.getString("text"), user.getString("username"), user.getString("photo"), values.getInt("id")));
                }

            } catch (Exception e) {
                Log.v("CommentLoader", "error parsing commentLoader:");
            }

            return null;

        }

        @Override
        protected void onPostExecute(String result) {

            Rect displayRectangle = new Rect();
            Window window = activity.getWindow();
            window.getDecorView().getWindowVisibleDisplayFrame(displayRectangle);
    /* Set the size of the dialog */
            ScrollView container = (ScrollView) findViewById(R.id.comment_container);
//        container.getLayoutParams().height = (int)(displayRectangle.height() * 0.9f);
            container.getLayoutParams().width = (int) (displayRectangle.width() * 0.98f);
            container.getLayoutParams().height = (int) (displayRectangle.height() * 0.98f);
            container.requestLayout();
        /* Set the size of the list view */
            final ListView commentLV = (ListView) findViewById(R.id.comment_list);
            commentLV.getLayoutParams().height = displayRectangle.width();
            commentLV.requestLayout();
        /* These lines are to handle scrolling of list view inside the scroll view */
            commentLV.setScrollingCacheEnabled(false);

            commentLV.setOnTouchListener(new View.OnTouchListener() {
                // Setting on Touch Listener for handling the touch inside ScrollView
                @Override
                public boolean onTouch(View v, MotionEvent event) {
                    // Disallow the touch request for parent scroll on touch of child view
                    v.getParent().requestDisallowInterceptTouchEvent(true);
                    return false;
                }

            });

            commentAdapter = new CommentAdapter(activity, comments);
            commentLV.setAdapter(commentAdapter);

        }

    }


    private class postComment extends AsyncTask<String, String, Boolean> {

        private String commentsUrl = "http://18.220.108.135/api/items/" + postId + "/comments";
        private String text;

        private postComment(String text) {
            this.text = text;
        }

        @Override
        protected Boolean doInBackground(String... params) {
            Log.v("postComment", "resulting json before postComment " + commentsUrl);
            SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(getContext());
            String token = preferences.getString("token", "null");
            try {
                PostJSON.postToApi(constructTheJSONLikeComment(), commentsUrl, token);
            } catch (IOException e) {
                e.printStackTrace();
                return false;
            }
            return true;

        }

        @Override
        protected void onPostExecute(Boolean result) {

            if (result == true) {
                //TODO refresh dialog here

            }
        }

        private JSONObject constructTheJSONLikeComment() {

            JSONObject json = new JSONObject();
            try {
                json.put("text", text);

                return json;
            } catch (JSONException e) {
                Log.v("postComment", "Error in json construction");
            }
            return json;
        }


    }
}