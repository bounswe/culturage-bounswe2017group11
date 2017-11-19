package com.culturage.oceans_eleven.culturage.newsFeed;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;

import com.culturage.oceans_eleven.culturage.network.PostJSON;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;

/**
 * Created by BARIN on 19.11.2017.
 */

public class LikeActivity extends AppCompatActivity {

    private int heritageItemPostID;
    private boolean isLiked;

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Intent incomingIntent = getIntent();
        heritageItemPostID = incomingIntent.getIntExtra("postId", -1);
        isLiked = incomingIntent.getBooleanExtra("is_rated", false);

        new likeAction(LikeActivity.this, heritageItemPostID, isLiked).execute();

    }

    private class likeAction extends AsyncTask<String, String, String> {

        private Context mContext;
        private boolean isLiked;
        private int heritageItemPostID;

        private likeAction(Context context, int heritageItemPostID, boolean isLiked) {
            mContext = context;
            this.heritageItemPostID = heritageItemPostID;
            this.isLiked = isLiked;
        }

        @Override
        protected String doInBackground(String... params) {
            try {
                SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(mContext);
                String token = preferences.getString("token", "null");

                uploadLikeCount(token);

            } catch (Exception e) {
                e.printStackTrace();
            }
            return "";
        }

        @Override
        protected void onPostExecute(String result) {

            startActivity(new Intent(getBaseContext(), NewsFeedActivity.class));
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
                    json.put("rate", 0);
                } else {
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
