package com.culturage.oceans_eleven.culturage.baseClasses;

import android.app.Activity;
import android.app.Dialog;
import android.graphics.Rect;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.Window;
import android.widget.ImageButton;
import android.widget.ListView;
import android.widget.ScrollView;

import com.culturage.oceans_eleven.culturage.R;
import com.culturage.oceans_eleven.culturage.adapters.LikeAdapter;
import com.culturage.oceans_eleven.culturage.network.Fetcher;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;

/**
 * Class that handles all `like` related operations
 * such as liking an item or un-liking it
 */
public class CustomLikeClass extends Dialog implements
        android.view.View.OnClickListener {

    private Activity activity;
    private int postId;

    /**
     * @param activity the activity that this instance of this CustomLike object belongs to
     * @param postId   the id of the item which's likes currently being dealt with
     */
    public CustomLikeClass(Activity activity, int postId) {
        super(activity);
        this.activity = activity;
        this.postId = postId;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(R.layout.custom_show_like);

        ImageButton backBtn = (ImageButton) findViewById(R.id.like_back);


        backBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dismiss();
            }
        });


        new likeLoader().execute();

    }

    @Override
    public void onClick(View v) {
    }

    /**
     * private class that extends AsyncTask to handle network operations, this one handles
     * downloading likes and then setting the corresponding views
     */
    private class likeLoader extends AsyncTask<String, String, String> {

        private String itemUrl = "http://52.90.34.144:85/api/items/" + postId;
        private ArrayList<Comment> comments = new ArrayList<>();

        private likeLoader() {
        }

        @Override
        protected String doInBackground(String... params) {
            Log.v("likeLoader", "resulting json before likeUrl " + itemUrl);
            String result = null;
            try {
                result = Fetcher.getJSON(Fetcher.createUrl(itemUrl), getContext());
                Log.v("LikeLoader", "resulting json for commentsUrl " + result);
            } catch (Exception e) {
                Log.v("LikeLoader", "exception" + Log.getStackTraceString(e));
                Log.v("LikeLoader", "invalid url: " + itemUrl);
            }
            try {
                Log.v("CommentLoader", "resulting json after likeURL: " + result);
                JSONObject values_ = new JSONObject(result);
                JSONArray raters = values_.getJSONArray("raters");
                for (int i = 0; i < raters.length(); i++) {
                    JSONObject values = raters.getJSONObject(i);
                    comments.add(new Comment("", values.getString("username"), values.getString("photo"), -1));
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
            ScrollView container = (ScrollView) findViewById(R.id.like_count_container);
//        container.getLayoutParams().height = (int)(displayRectangle.height() * 0.9f);
            container.getLayoutParams().width = (int) (displayRectangle.width() * 0.98f);
            container.getLayoutParams().height = (int) (displayRectangle.height() * 0.98f);
            container.requestLayout();
        /* Set the size of the list view */
            final ListView likeLV = (ListView) findViewById(R.id.like_list);
            likeLV.getLayoutParams().height = displayRectangle.width();
            likeLV.requestLayout();
        /* These lines are to handle scrolling of list view inside the scroll view */
            likeLV.setScrollingCacheEnabled(false);

            likeLV.setOnTouchListener(new View.OnTouchListener() {
                // Setting on Touch Listener for handling the touch inside ScrollView
                @Override
                public boolean onTouch(View v, MotionEvent event) {
                    // Disallow the touch request for parent scroll on touch of child view
                    v.getParent().requestDisallowInterceptTouchEvent(true);
                    return false;
                }

            });

            LikeAdapter likeAdapter = new LikeAdapter(activity, comments);
            likeLV.setAdapter(likeAdapter);

        }

    }
}
