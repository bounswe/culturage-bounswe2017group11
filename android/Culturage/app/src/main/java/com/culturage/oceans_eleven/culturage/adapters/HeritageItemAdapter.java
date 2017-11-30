package com.culturage.oceans_eleven.culturage.adapters;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.AsyncTask;
import android.preference.PreferenceManager;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.culturage.oceans_eleven.culturage.R;
import com.culturage.oceans_eleven.culturage.baseClasses.CustomDialogClass;
import com.culturage.oceans_eleven.culturage.baseClasses.CustomLikeClass;
import com.culturage.oceans_eleven.culturage.baseClasses.HeritageItem;
import com.culturage.oceans_eleven.culturage.network.PostJSON;
import com.squareup.picasso.Picasso;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;


public class HeritageItemAdapter extends ArrayAdapter {

    private Activity context;
    public HeritageItemAdapter(Activity context, ArrayList<HeritageItem> items) {
        super(context, 0, items);
        this.context = context;
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        // Check if the existing view is being reused, otherwise inflate the view
        View listItemView = convertView;
        if (listItemView == null) {
            listItemView = LayoutInflater.from(getContext()).inflate(
                    R.layout.list_item_news_feed, parent, false);
        }

        final HeritageItem currentItem = (HeritageItem) getItem(position);

        TextView titleView = (TextView) listItemView.findViewById(R.id.title);
        titleView.setText(currentItem.getmTitle());

        TextView descriptionView = (TextView) listItemView.findViewById(R.id.description);
        descriptionView.setText(currentItem.getmDescription());

        ImageView imageView = (ImageView) listItemView.findViewById(R.id.image);

//        imageView.setImageResource(R.drawable.sample_0);

        String imageUri = currentItem.getmImageUrl();
        // 400 looks cool
        Picasso.with(this.getContext()).load(imageUri).resize(400, 0).into(imageView);

        LinearLayout frame = (LinearLayout) listItemView.findViewById(R.id.nf_like_comment_buttons_container);
        LinearLayout commentContainer = (LinearLayout) frame.findViewById(R.id.comment_container);
        commentContainer.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                CustomDialogClass cdd = new CustomDialogClass(context, currentItem.getmPostId(), currentItem);
                cdd.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                cdd.show();
            }
        });

        LinearLayout likeContainer = (LinearLayout) frame.findViewById(R.id.like_container);
        final View finalListItemView = listItemView; //to be able to pass it to likeAction
        likeContainer.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                new likeAction(getContext(), currentItem, finalListItemView).execute();

            }
        });

        LinearLayout like_number_container = (LinearLayout) frame.findViewById(R.id.like_number_container);
        like_number_container.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                CustomLikeClass cdd = new CustomLikeClass(context, currentItem.getmPostId());
                cdd.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                cdd.show();
            }
        });

        ImageButton likeButton_ = (ImageButton) listItemView.findViewById(R.id.like_btn);
        if (currentItem.isRated()) {
            likeButton_.setImageResource(R.drawable.ic_like);
        } else {
            likeButton_.setImageResource(R.drawable.ic_notlike);
        }

        TextView commentCount = (TextView) listItemView.findViewById(R.id.comment_count);
        commentCount.setText(currentItem.getmCommentCount() + "");

        TextView likeCount = (TextView) listItemView.findViewById(R.id.like_count);
        likeCount.setText(currentItem.getmLikeCount() + "");

        TextView show_likes = (TextView) listItemView.findViewById(R.id.show_likes);
        show_likes.setText("  Liked by " + currentItem.getmLikeCount() + " people");

        return listItemView;
    }

    private class likeAction extends AsyncTask<String, String, Boolean> {

        private Context mContext;
        private boolean isLiked;
        private int heritageItemPostID;
        HeritageItem currentItem;
        View listItemView;


        private likeAction(Context context, HeritageItem currentItem, View listItemView) {
            mContext = context;
            this.heritageItemPostID = currentItem.getmPostId();
            this.isLiked = currentItem.isRated();
            this.currentItem = currentItem;
            this.listItemView = listItemView;
        }

        @Override
        protected Boolean doInBackground(String... params) {
            try {
                SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(mContext);
                String token = preferences.getString("token", "null");

                uploadLikeCount(token);

            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
            return true;
        }

        @Override
        protected void onPostExecute(Boolean result) {

            if (result != true) { //if the action could not be performed then just report and quit
                if (isLiked) {
                    Toast.makeText(context, "uppss could not un-like", Toast.LENGTH_SHORT).show();

                } else {
                    Toast.makeText(context, "uppss could not like", Toast.LENGTH_SHORT).show();

                }

                return;
            }

            ImageButton likeButton_ = (ImageButton) listItemView.findViewById(R.id.like_btn);


            TextView likeCount = (TextView) listItemView.findViewById(R.id.like_count);

            TextView show_likes = (TextView) listItemView.findViewById(R.id.show_likes);


            if (isLiked) { //meaning that we will unlike it
                likeButton_.setImageResource(R.drawable.ic_notlike);
                currentItem.setmLikeCount(currentItem.getmLikeCount() - 1);
                currentItem.setRated(false);


            } else { //THEN WE LIKE IT
                likeButton_.setImageResource(R.drawable.ic_like);
                currentItem.setmLikeCount(currentItem.getmLikeCount() + 1);
                currentItem.setRated(true);


            }

            this.isLiked = !this.isLiked; //we toggle it
            /*update views accordingly*/
            likeCount.setText(currentItem.getmLikeCount() + "");
            show_likes.setText("  Liked by " + currentItem.getmLikeCount() + " people");

        }

        private boolean uploadLikeCount(String token) {
            String result;
            String ratesUrl = "http://18.220.108.135/api/items/" + heritageItemPostID + "/rates";
            try {
                result = PostJSON.postToApi(constructTheJSONLikeCount(), ratesUrl, token);
            } catch (IOException e) {
                e.printStackTrace();
                return false;

            }
            return !(result == null || result.equals("400"));

        }

        private JSONObject constructTheJSONLikeCount() {

            JSONObject json = new JSONObject();
            try {

                if (isLiked) {
                    //then unlike
                    json.put("rate", 0);
                } else {
                    //like it
                    json.put("rate", 1);
                }

                Log.v("RATEImplemented", "" + json.getInt("rate"));


                return json;
            } catch (JSONException e) {
                Log.v("like", "Error in json construction");
            }
            return json;
        }
    }

}
