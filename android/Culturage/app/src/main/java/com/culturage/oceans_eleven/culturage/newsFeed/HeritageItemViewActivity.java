package com.culturage.oceans_eleven.culturage.newsFeed;


import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.culturage.oceans_eleven.culturage.R;
import com.culturage.oceans_eleven.culturage.adapters.HorizontalRecyclerViewAdapter;
import com.culturage.oceans_eleven.culturage.adapters.TagsViewAdapter;
import com.culturage.oceans_eleven.culturage.baseClasses.CustomDialogClass;
import com.culturage.oceans_eleven.culturage.baseClasses.HeritageItem;
import com.culturage.oceans_eleven.culturage.baseClasses.Tag;
import com.culturage.oceans_eleven.culturage.network.Fetcher;
import com.culturage.oceans_eleven.culturage.network.PostJSON;
import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;

public class HeritageItemViewActivity extends AppCompatActivity {

    /**
     * Tag for the log messages
     */
    private static final String LOG_TAG = Fetcher.class.getSimpleName();


    private RecyclerView mRecyclerView;
    private ArrayList<HeritageItem> recommendations = new ArrayList<>();
    private HorizontalRecyclerViewAdapter recommendationAdapter;

    private RecyclerView tagsView;
    private ArrayList<Tag> tagsList = new ArrayList<>();
    private TagsViewAdapter tagsAdapter;

    private String profileURL = "http://18.220.108.135/api/profile/";
    private String recommendationsUrl = "http://18.220.108.135/api/recommendation/item/";
    private static String itemUrl = "http://18.220.108.135/api/items/";

    private int heritageItemPostID;
    private boolean isRated;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_heritage_item_view);

        // First get necessary values from the incoming intent and place them.
        Intent incomingIntent = getIntent();
        heritageItemPostID = incomingIntent.getIntExtra("postId", -1);

        new getLikeStatus().execute();


        ImageView iw = (ImageView) findViewById(R.id.her_item_photo);
        final String imageUri = incomingIntent.getStringExtra("imageUrl");
        // 400 looks cool
        Picasso.with(this).load(imageUri).resize(400, 0).into(iw);

        TextView title = (TextView) findViewById(R.id.her_item_Title);
        title.setText(incomingIntent.getStringExtra("title"));

        TextView desc_view = (TextView) findViewById(R.id.her_item_description);
        desc_view.setText(incomingIntent.getStringExtra("description"));

        // Secondly get necessary fields from the backend.
        //TODO: implement API code here.
//        TextView date = (TextView) findViewById(R.id.her_item_date);
//
//        TextView loc = (TextView) findViewById(R.id.her_item_location);
//
//        TextView tags = (TextView) findViewById(R.id.her_item_tags);
//
        LinearLayout likeCommentFrame = (LinearLayout) findViewById(R.id.item_like_comment_buttons_container);
        LinearLayout commentContainer = (LinearLayout) likeCommentFrame.findViewById(R.id.comment_container);
        TextView commentCount = (TextView) commentContainer.findViewById(R.id.comment_count);

        LinearLayout likeContainer = (LinearLayout) likeCommentFrame.findViewById(R.id.like_container);
        TextView likeCount = (TextView) likeContainer.findViewById(R.id.like_count);
//
//        TextView guest = (TextView) findViewById(R.id.guest_profile);
//        ImageView guestPic = (ImageView) findViewById(R.id.guest_profile_pict);
//
        // Now implement listeners.
        iw.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                final AlertDialog.Builder imageDialog = new AlertDialog.Builder(HeritageItemViewActivity.this, R.style.BlackDialogTheme);
//                imageDialog.create().getWindow().setLayout(600, 1200);
                View view = LayoutInflater.from(HeritageItemViewActivity.this).inflate(R.layout.image_dialog, null);
                ImageView image = (ImageView) view.findViewById(R.id.alertedImage);
                Picasso.with(HeritageItemViewActivity.this).load(imageUri).resize(0, 1500).into(image);
                imageDialog.setView(view);
                imageDialog.setNegativeButton("Close", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.dismiss();
                    }
                });
                imageDialog.show();
            }
        });

        commentContainer.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                CustomDialogClass cdd = new CustomDialogClass(HeritageItemViewActivity.this, heritageItemPostID);
                cdd.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                cdd.show();
            }
        });

        likeContainer.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                new likeAction(HeritageItemViewActivity.this).execute();
                new likeCommentCountLoader().execute();
                //Toast.makeText(HeritageItemViewActivity.this, "Will like soon", Toast.LENGTH_SHORT).show();
            }
        });

//        new FullItemLoader().execute(heritageItemPostID);

        new likeCommentCountLoader().execute();
        new profileLoader(false).execute();
        //Will be implemented soon!!
        itemUrl = "http://18.220.108.135/api/items/" + heritageItemPostID;

        TextView guest = (TextView) findViewById(R.id.guest_profile);
        guest.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                new profileLoader(true).execute();
            }
        });
        ImageView guestPic = (ImageView) findViewById(R.id.guest_profile_pict);
        guestPic.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                new profileLoader(true).execute();
            }
        });


        //TODO do thiss down
        tagsView = (RecyclerView) findViewById(R.id.tagsRecycleView);
        RecyclerView.LayoutManager tagsLayoutManager = new LinearLayoutManager(this, LinearLayoutManager.HORIZONTAL, false);
        tagsView.setLayoutManager(tagsLayoutManager);
//
        new FullItemLoader().execute(heritageItemPostID);
//
        tagsAdapter = new TagsViewAdapter(HeritageItemViewActivity.this, tagsList);
        tagsView.setAdapter(tagsAdapter);
        //TODO do thiss up




        // Lastly, populate recommendations
        mRecyclerView = (RecyclerView) findViewById(R.id.recommendation_view);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(this, LinearLayoutManager.HORIZONTAL, false);
        mRecyclerView.setLayoutManager(mLayoutManager);
//        ArrayList<HeritageItem> recommendations = new ArrayList<HeritageItem>();
//        recommendations.add(new HeritageItem(1, "", "", "", true));
//        recommendations.add(new HeritageItem(1, "", "", "", true));
//        recommendations.add(new HeritageItem(1, "", "", "", true));
//        recommendations.add(new HeritageItem(1, "", "", "", true));
//        recommendations.add(new HeritageItem(1, "", "", "", true));
//        recommendations.add(new HeritageItem(1, "", "", "", true));
        new RecommendationRequest(HeritageItemViewActivity.this, recommendationsUrl + heritageItemPostID).execute();
        recommendationAdapter = new HorizontalRecyclerViewAdapter(HeritageItemViewActivity.this, recommendations);
        mRecyclerView.setAdapter(recommendationAdapter);

    }

    private class FullItemLoader extends AsyncTask<Integer, Void, String> {

        @Override
        protected String doInBackground(Integer... itemID) {
            try {
                return Fetcher.getJSON(Fetcher.createUrl(getResources().getString(R.string.itemsEndPoint) + itemID[0]), HeritageItemViewActivity.this);
            } catch (IOException e) {
                e.printStackTrace();
            }
            //if can't return Fetcher.getJSON because of exception
            return null;
        }

        @Override
        protected void onPostExecute(String jsonStr) {
            try {

                JSONObject itemJson = new JSONObject(jsonStr);

                JSONArray timelines = itemJson.getJSONArray("timelines");
                JSONObject timeLine0 = timelines.getJSONObject(0);
                JSONObject loc0 = timeLine0.getJSONObject("location");
                //JSONObject likeTotalCount = itemJson.getJSONObject("rate");

                JSONArray tags = itemJson.getJSONArray("tags");

                JSONArray comments = itemJson.getJSONArray("comments");


                TextView date = (TextView) findViewById(R.id.her_item_date);
                date.setText(timeLine0.getString("startDate"));

                TextView loc = (TextView) findViewById(R.id.her_item_location);
                loc.setText(loc0.getString("name"));

                tagsList.clear();


//                TextView tagsView_old = (TextView) findViewById(R.id.her_item_tags);
//                String tagsConcat = "";
                for (int i = 0; i < tags.length(); i++) {
                    String tempTag = tags.getJSONObject(i).getString("name");
//                    tagsConcat += tempTag + " ";
                    if (tempTag.startsWith("#")) {
                        tagsList.add(new Tag(tempTag));
                    } else {
                        tagsList.add(new Tag("#" + tempTag));
                    }

                }
//                tagsView_old.setText(tagsConcat);


                //tagsList is already set to the adaper so these two below are not needed
                // tagsAdapter.clear();
                // tagsAdapter.addAll(tagsList);
                if (tagsList.isEmpty()) {
                    tagsList.add(new Tag("#beFirstOneToTag"));

                }
                tagsView.setAdapter(tagsAdapter);

                LinearLayout likeCommentFrame = (LinearLayout) findViewById(R.id.item_like_comment_buttons_container);
                LinearLayout commentContainer = (LinearLayout) likeCommentFrame.findViewById(R.id.comment_container);
                TextView commentCount = (TextView) commentContainer.findViewById(R.id.comment_count);
                commentCount.setText(comments.length() + "");

                LinearLayout likeContainer = (LinearLayout) likeCommentFrame.findViewById(R.id.like_container);
                TextView likeCount = (TextView) likeContainer.findViewById(R.id.like_count);
                //FIXME change the default 0
                //likeCount.setText(likeTotalCount + "");

                // Now implement listeners.
                commentContainer.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View view) {
                        CustomDialogClass cdd = new CustomDialogClass(HeritageItemViewActivity.this, heritageItemPostID);
                        cdd.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                        cdd.show();
                    }
                });

                /*likeContainer.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View view) {
                        new likeAction(HeritageItemViewActivity.this).execute();
                        //Toast.makeText(HeritageItemViewActivity.this, "Will like soon", Toast.LENGTH_SHORT).show();
                    }
                });*/


            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
    }

    private class profileLoader extends AsyncTask<String, String, String> {

        private String creator_username;
        private String creator_photo;
        private String creator_id;
        private boolean onclick;

        private profileLoader(boolean onclick) {
            this.onclick = onclick;
        }

        @Override
        protected String doInBackground(String... params) {
            Log.v("LoaderProfilePage", "hello");
            Log.v(LOG_TAG, "resulting json before itemUrl " + itemUrl);
            String result = null;
            try {
                result = Fetcher.getJSON(Fetcher.createUrl(itemUrl), HeritageItemViewActivity.this);
                Log.v(LOG_TAG, "resulting json for itemUrl " + result);
            } catch (Exception e) {
                Log.v(LOG_TAG, "exception" + Log.getStackTraceString(e));
                Log.v("heritageItem", "invalid url: " + itemUrl);
                Log.v("heritageItem", "result: " + result);
            }
            this.creator_id = "-1";
            try {
                Log.v(LOG_TAG, "resulting json " + result);
                JSONObject values = new JSONObject(result);
                this.creator_id = "" + values.getJSONObject("created_by").getInt("id");

            } catch (Exception e) {
                Log.v("heritageItem", "error parsing guestProfile:" + creator_id);
            }
            profileURL = "http://18.220.108.135/api/profile/" + creator_id;

            ViewGuestProfie(profileURL);

            return null;

        }

        @Override
        protected void onPostExecute(String result) {

            if (creator_photo != null && !creator_photo.equals("-1")) {
                ImageView photo = (ImageView) findViewById(R.id.guest_profile_pict);
                String imageUri = "http://" + creator_photo;
                Log.v("Uploadtag", imageUri);
                Picasso.with(getBaseContext()).load(imageUri).into(photo);
                // String imageUri = baseURL + profilePages.get(0).getPhoto();
            }
            TextView guest = (TextView) findViewById(R.id.guest_profile);
            guest.setText(" " + creator_username);

            if (onclick) {
                Log.v("creatoridtag", creator_id);
                startActivity(new Intent(HeritageItemViewActivity.this, ProfileGuestActivity.class));
                Intent intent = new Intent(HeritageItemViewActivity.this, ProfileGuestActivity.class);
                intent.putExtra("creator_id", creator_id); //New
                startActivity(intent);
            }
        }

        private void ViewGuestProfie(String profileUrl) {
            String result = "";
            try {
                result = Fetcher.getJSON(Fetcher.createUrl(profileUrl), HeritageItemViewActivity.this);
                Log.v(LOG_TAG, "resulting json for profileUrl " + result);
            } catch (Exception e) {
                Log.v(LOG_TAG, "exception" + Log.getStackTraceString(e));
                Log.v("heritageItem", "invalid url: " + profileUrl);
                Log.v("heritageItem", "result: " + result);
            }
            try {
                Log.v(LOG_TAG, "resulting json " + result);
                JSONObject values = new JSONObject(result);
                creator_username = values.getString("username");
                creator_photo = values.getString("photo");

            } catch (Exception e) {
                Log.v("heritageItem", "error parsing guestProfile:" + creator_username);
            }
        }
    }

    private class RecommendationRequest extends AsyncTask<Void, Void, Void> {
        private String url;
        private Activity context;
        private ArrayList<HeritageItem> tempRecommendations;

        RecommendationRequest(Activity context, String url) {
            this.context = context;
            this.url = url;
        }

        @Override
        protected Void doInBackground(Void... voids) {
            getRecommendations(this.url);
            return null;
        }

        @Override
        protected void onPostExecute(Void voids) {
            recommendations = tempRecommendations;
            recommendationAdapter.clear();
            recommendationAdapter.addAll(recommendations);
            mRecyclerView.setAdapter(recommendationAdapter);
        }

        private void getRecommendations(String url) {
            tempRecommendations = new ArrayList<>();
            String result = null;
            try {
                result = Fetcher.getJSON(Fetcher.createUrl(url), context);
                Log.v(LOG_TAG, "resulting json " + result);
            } catch (Exception e) {
                Log.v(LOG_TAG, "exception" + Log.getStackTraceString(e));
                Log.v("heritageItem", "invalid url: " + url);
            }
            try {
                Log.v(LOG_TAG, "resulting json " + result);
                JSONArray json_result = new JSONArray(result);
                for (int i = 0; i < json_result.length(); i++) {
                    JSONObject values = json_result.getJSONObject(i);
                    String title = values.getString("name");
                    String imageURL = values.getString("featured_img");
                    String description = values.getString("description");
                    int postID = values.getInt("id");
                    tempRecommendations.add(new HeritageItem(postID, title.trim(), description.trim(), imageURL));
                }
            } catch (Exception e) {
                Log.v("heritageItem", "error parsing recomm:");
            }

        }

    }
    /*
    public void updateUi(ArrayList<HeritageItem> heritageItems) {
        itemAdapter.clear();
        if (heritageItems != null || heritageItems.size() > 0) {
            itemAdapter.addAll(heritageItems);
        }
    }

    //WILL BE IMPLEMENT SOON
    private LoaderManager.LoaderCallbacks<ArrayList<HeritageItem>> heritageItemLoader
            = new LoaderManager.LoaderCallbacks<ArrayList<HeritageItem>>() {

    /*
    Will be implemented soon Send token of the user to like or not.
     */
    private class likeAction extends AsyncTask<String, String, String> {

        private Context mContext;
        private boolean LikeSuccessful;
        private boolean isLiked;

        private likeAction(Context context) {
            mContext = context;
        }

        @Override
        protected String doInBackground(String... params) {
            try {
                SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(mContext);
                String token = preferences.getString("token", "null");
                LikeSuccessful = uploadLikePic();
                if (LikeSuccessful) {
                    try {
                        LikeSuccessful = uploadLikeCount(token);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "";
        }

        @Override
        protected void onPostExecute(String result) {
            if (LikeSuccessful) {
                //Post Execute
                ImageButton likeButton = (ImageButton) findViewById(R.id.like_btn);
                if (isLiked) {
                    likeButton.setImageResource(R.drawable.ic_like);
                } else {
                    likeButton.setImageResource(R.drawable.ic_notlike);
                }

            } else {
                Toast.makeText(mContext, "Like unsuccessful", Toast.LENGTH_LONG).show();
            }
        }

        private boolean uploadLikePic() {
            String result;
            itemUrl = "http://18.220.108.135/api/items/" + heritageItemPostID;
            try {
                result = Fetcher.getJSON(Fetcher.createUrl(itemUrl), HeritageItemViewActivity.this);
            } catch (IOException e) {
                e.printStackTrace();
                return false;
            }
            try {
                Log.v(LOG_TAG, "resulting json on like button " + result);
                JSONObject values = new JSONObject(result);
                isLiked = values.getBoolean("is_rated");
                isLiked = getIsLikedTemp();     //Needs to be removed!!
                if (isLiked) {
                    isLiked = false;
                    Log.v("ISLIKED", "is rated :  Dislikinng now");
                } else {
                    isLiked = true;
                    Log.v("ISLIKED", "is rated :  Liking now");
                }

            } catch (Exception e) {
                Log.v("likeItem", "error parsing like:");
            }
            return !(result == null || result.equals("400"));

        }

        //NEeds to be removed when item is returned is_liked true...
        private boolean getIsLikedTemp() {
            String tempResult;
            boolean isLiked;
            String newsUrl = "http://18.220.108.135/api/newsfeed";
            try {
                tempResult = Fetcher.getJSON(Fetcher.createUrl(newsUrl), HeritageItemViewActivity.this); //temporary result
            } catch (IOException e) {
                e.printStackTrace();
                return false;
            }
            try {
                JSONArray values_array = new JSONArray(tempResult); //temporary
                // Temporary loop
                for (int i = 0; i < values_array.length(); i++) {
                    JSONObject tempValues = values_array.getJSONObject(i);
                    if (tempValues.getInt("id") == heritageItemPostID) {
                        isLiked = tempValues.getBoolean("is_rated");
                        return isLiked;
                    }
                }
            } catch (Exception e) {
                Log.v("likeItem", "error parsing like:");
            }
            return false;
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

                if (!isLiked) {
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

    private class getLikeStatus extends AsyncTask<String, String, String> {

        private boolean isLiked;
        private String result;
        private String newsUrl = "http://18.220.108.135/api/newsfeed";  // Temporary url

        private getLikeStatus() {
            this.isLiked = false;
        }

        protected String doInBackground(String... params) {
            try {
                result = Fetcher.getJSON(Fetcher.createUrl(newsUrl), HeritageItemViewActivity.this); //temporary result
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                JSONArray values_array = new JSONArray(result); //temporary
                // Temporary loop
                for (int i = 0; i < values_array.length(); i++) {
                    JSONObject tempValues = values_array.getJSONObject(i);
                    if (tempValues.getInt("id") == heritageItemPostID) {
                        isLiked = tempValues.getBoolean("is_rated");
                    }
                }
            } catch (Exception e) {
                Log.v("likeItem", "error parsing like:");
            }
            return null;
        }

        protected void onPostExecute(String result) {
            ImageButton likeButton_ = (ImageButton) findViewById(R.id.like_btn);
            if (isLiked) {
                likeButton_.setImageResource(R.drawable.ic_like);
            } else {
                likeButton_.setImageResource(R.drawable.ic_notlike);
            }
        }
    }

    private class likeCommentCountLoader extends AsyncTask<String, String, String> {

        private String ratesUrl = "http://18.220.108.135/api/items/" + heritageItemPostID;
        private int totalLikeCount;
        private int totalCommentCount;

        private likeCommentCountLoader() {
        }

        @Override
        protected String doInBackground(String... params) {
            Log.v("LoaderLikeCommentCount", "hello");
            Log.v(LOG_TAG, "resulting json before itemsUrl " + ratesUrl);
            String result = null;
            totalLikeCount = 0;
            totalCommentCount = 0;
            try {
                result = Fetcher.getJSON(Fetcher.createUrl(ratesUrl), HeritageItemViewActivity.this);
                Log.v(LOG_TAG, "resulting json for ratesUrl " + result);
            } catch (Exception e) {
                Log.v(LOG_TAG, "exception" + Log.getStackTraceString(e));
                Log.v("heritageItem", "invalid url: " + ratesUrl);
            }
            try {
                Log.v(LOG_TAG, "resulting json after likeCount: " + result);
                JSONObject values = new JSONObject(result);

                if (!values.isNull("rate")) {
                    totalLikeCount = values.getInt("rate");
                }
                JSONArray comment_ = values.getJSONArray("comments");
                totalCommentCount = comment_.length();


                Log.v("heritageItem", "success parsing totalCommentCount:" + totalCommentCount);

            } catch (Exception e) {
                Log.v("heritageItem", "error parsing totalLikeCount:" + totalLikeCount);
            }

            return null;

        }

        @Override
        protected void onPostExecute(String result) {
            try {
                LinearLayout likeCommentFrame = (LinearLayout) findViewById(R.id.item_like_comment_buttons_container);
                LinearLayout likeContainer = (LinearLayout) likeCommentFrame.findViewById(R.id.like_container);
                LinearLayout commentContainer = (LinearLayout) likeCommentFrame.findViewById(R.id.comment_container);
                TextView likeCount = (TextView) likeContainer.findViewById(R.id.like_count);
                likeCount.setText("" + totalLikeCount);
                TextView commentCount = (TextView) commentContainer.findViewById(R.id.comment_count);
                commentCount.setText("" + totalCommentCount);
            } catch (Exception e) {
                Log.v("heritageItem", "error setting totalLikeCount:" + totalLikeCount);
            }


        }

    }


}
