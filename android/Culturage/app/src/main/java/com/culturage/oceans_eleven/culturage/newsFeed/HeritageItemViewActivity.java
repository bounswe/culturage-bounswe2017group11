package com.culturage.oceans_eleven.culturage.newsFeed;


import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Environment;
import android.preference.PreferenceManager;
import android.provider.MediaStore;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.View;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.culturage.oceans_eleven.culturage.R;
import com.culturage.oceans_eleven.culturage.adapters.HeritageMediaAdapter;
import com.culturage.oceans_eleven.culturage.adapters.RecommendationRecyclerViewAdapter;
import com.culturage.oceans_eleven.culturage.adapters.TagsViewAdapter;
import com.culturage.oceans_eleven.culturage.baseClasses.CustomDialogClass;
import com.culturage.oceans_eleven.culturage.baseClasses.CustomLikeClass;
import com.culturage.oceans_eleven.culturage.baseClasses.HeritageItem;
import com.culturage.oceans_eleven.culturage.baseClasses.HeritageMedia;
import com.culturage.oceans_eleven.culturage.baseClasses.Tag;
import com.culturage.oceans_eleven.culturage.network.Fetcher;
import com.culturage.oceans_eleven.culturage.network.PostJSON;
import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

public class HeritageItemViewActivity extends AppCompatActivity {

    /**
     * Tag for the log messages
     */
    private static final String LOG_TAG = HeritageItemViewActivity.class.getSimpleName();

    private RecyclerView mRecommendationView;
    private ArrayList<HeritageItem> recommendations = new ArrayList<>();
    private RecommendationRecyclerViewAdapter recommendationAdapter;
    private RecyclerView imageList;

    private RecyclerView tagsView;
    private ArrayList<Tag> tagsList = new ArrayList<>();
    private TagsViewAdapter tagsAdapter;

    private static String itemUrl = "http://52.90.34.144:85/api/items/";

    private int heritageItemPostID;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_heritage_item_view);

        // First get necessary values from the incoming intent and place them.
        Intent incomingIntent = getIntent();
        heritageItemPostID = incomingIntent.getIntExtra("postId", -1);
        new getLikeStatus().execute();
        new getReportStatus().execute();
//        ImageView iw = (ImageView) findViewById(R.id.her_item_photo);
        final String imageUri = incomingIntent.getStringExtra("imageUrl");
        // 400 looks cool
//        Picasso.with(this).load(imageUri).resize(400, 0).into(iw);

        TextView title = (TextView) findViewById(R.id.her_item_Title);
        title.setText(incomingIntent.getStringExtra("title"));

        TextView desc_view = (TextView) findViewById(R.id.her_item_description);
        desc_view.setText(incomingIntent.getStringExtra("description"));

        tagsView = (RecyclerView) findViewById(R.id.tagsRecycleView);
        // Secondly get necessary fields from the backend.
//
        imageList = (RecyclerView) findViewById(R.id.her_item_image_list);
        RecyclerView.LayoutManager mLayoutManager2 = new LinearLayoutManager(this, LinearLayoutManager.HORIZONTAL, false);
        imageList.setLayoutManager(mLayoutManager2);
        new AllMediasReceiver(HeritageItemViewActivity.this, heritageItemPostID, imageUri).execute();

        LinearLayout likeCommentFrame = (LinearLayout) findViewById(R.id.item_like_comment_buttons_container);
        LinearLayout commentContainer = (LinearLayout) likeCommentFrame.findViewById(R.id.comment_container);
//        TextView commentCount = (TextView) commentContainer.findViewById(R.id.comment_count);

        LinearLayout likeContainer = (LinearLayout) likeCommentFrame.findViewById(R.id.like_container);
//        TextView likeCount = (TextView) likeContainer.findViewById(R.id.like_count);
//
//        TextView guest = (TextView) findViewById(R.id.guest_profile);
//        ImageView guestPic = (ImageView) findViewById(R.id.guest_profile_pict);
//
        // Now implement listeners.
//        iw.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//                final AlertDialog.Builder imageDialog = new AlertDialog.Builder(HeritageItemViewActivity.this, R.style.BlackDialogTheme);
////                imageDialog.create().getWindow().setLayout(600, 1200);
//                View view = LayoutInflater.from(HeritageItemViewActivity.this).inflate(R.layout.image_dialog, null);
//                ImageView image = (ImageView) view.findViewById(R.id.alertedImage);
//                Picasso.with(HeritageItemViewActivity.this).load(imageUri).resize(0, 1500).into(image);
//                imageDialog.setView(view);
//                imageDialog.setNegativeButton("Close", new DialogInterface.OnClickListener() {
//                    @Override
//                    public void onClick(DialogInterface dialog, int which) {
//                        dialog.dismiss();
//                    }
//                });
//                imageDialog.show();
//            }
//        });


        commentContainer.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                CustomDialogClass cdd = new CustomDialogClass(HeritageItemViewActivity.this, heritageItemPostID, null);
                cdd.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                cdd.show();
            }
        });

        likeContainer.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                new LikeAction(HeritageItemViewActivity.this).execute();
                new LikeCommentCountLoader().execute();
                //Toast.makeText(HeritageItemViewActivity.this, "Will like soon", Toast.LENGTH_SHORT).show();
            }
        });

        LinearLayout like_number_container = (LinearLayout) likeCommentFrame.findViewById(R.id.like_number_container);
        like_number_container.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                CustomLikeClass cdd = new CustomLikeClass(HeritageItemViewActivity.this, heritageItemPostID);
                cdd.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                cdd.show();
            }
        });

        //Report Container
        LinearLayout reportContainer = (LinearLayout) likeCommentFrame.findViewById(R.id.report_container);
        reportContainer.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                new reportAction(HeritageItemViewActivity.this).execute();
                new LikeCommentCountLoader().execute();
                //Toast.makeText(HeritageItemViewActivity.this, "Will report soon", Toast.LENGTH_SHORT).show();
            }
        });

//        new FullItemLoader().execute(heritageItemPostID);

        new LikeCommentCountLoader().execute();
        new ProfileLoader(false).execute();
        //Will be implemented soon!!
        itemUrl = "http://52.90.34.144:85/api/items/" + heritageItemPostID;

        TextView guest = (TextView) findViewById(R.id.guest_profile);
        guest.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                new ProfileLoader(true).execute();
            }
        });
        ImageView guestPic = (ImageView) findViewById(R.id.guest_profile_pict);
        guestPic.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                new ProfileLoader(true).execute();
            }
        });



        /*handle tags recycle view start*/
        RecyclerView.LayoutManager tagsLayoutManager = new LinearLayoutManager(this, LinearLayoutManager.HORIZONTAL, false);
        tagsView.setLayoutManager(tagsLayoutManager);

        new FullItemLoader().execute(heritageItemPostID);

        tagsAdapter = new TagsViewAdapter(HeritageItemViewActivity.this, tagsList);
        tagsView.setAdapter(tagsAdapter);
        /*handle tags recycle view end*/

        // Lastly, populate recommendations
        mRecommendationView = (RecyclerView) findViewById(R.id.recommendation_view);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(this, LinearLayoutManager.HORIZONTAL, false);
        mRecommendationView.setLayoutManager(mLayoutManager);
//        ArrayList<HeritageItem> recommendations = new ArrayList<HeritageItem>();
//        recommendations.add(new HeritageItem(1, "", "", "", true));
//        recommendations.add(new HeritageItem(1, "", "", "", true));
//        recommendations.add(new HeritageItem(1, "", "", "", true));
//        recommendations.add(new HeritageItem(1, "", "", "", true));
//        recommendations.add(new HeritageItem(1, "", "", "", true));
//        recommendations.add(new HeritageItem(1, "", "", "", true));
        String recommendationsUrl = "http://52.90.34.144:85/api/recommendation/item/";
        new RecommendationRequest(HeritageItemViewActivity.this, recommendationsUrl + heritageItemPostID).execute();
        recommendationAdapter = new RecommendationRecyclerViewAdapter(HeritageItemViewActivity.this, recommendations);
        mRecommendationView.setAdapter(recommendationAdapter);

    }

    // This is used when uploading new image
    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if (resultCode == Activity.RESULT_OK) {
            if (requestCode == HeritageMediaAdapter.SELECT_FILE) {
                onSelectFromGalleryResult(data);
//                Toast.makeText(this, "Picked from gallery", Toast.LENGTH_SHORT).show();
            } else if (requestCode == HeritageMediaAdapter.REQUEST_CAMERA) {
//                Toast.makeText(this, "taken by camera", Toast.LENGTH_SHORT).show();
                onCaptureImageResult(data);
            }
        }
    }

    private void onCaptureImageResult(Intent data) {
        Bitmap thumbnail = (Bitmap) data.getExtras().get("data");
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        thumbnail.compress(Bitmap.CompressFormat.JPEG, 70, bytes);

        File destination = new File(Environment.getExternalStorageDirectory(),
                System.currentTimeMillis() + ".jpg");

        FileOutputStream fo;
        try {
            destination.createNewFile();
            fo = new FileOutputStream(destination);
            fo.write(bytes.toByteArray());
            fo.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        String fullPath = getRealPathFromURIForCamera(data.getData());
        Log.v(LOG_TAG, fullPath);
        new ImageUpload(HeritageItemViewActivity.this, fullPath, heritageItemPostID).execute();
    }

    @SuppressWarnings("deprecation")
    private void onSelectFromGalleryResult(Intent data) {
        String fullPath = getRealPathFromURIForGallery(data.getData());
        new ImageUpload(HeritageItemViewActivity.this, fullPath, heritageItemPostID).execute();
        Log.v(LOG_TAG, "full path " + fullPath);
    }

    private String getRealPathFromURIForCamera(Uri contentURI) {
        String result;
        Cursor cursor = getContentResolver().query(contentURI, null, null, null, null);
        if (cursor == null) {
            result = contentURI.getPath();
        } else {
            cursor.moveToFirst();
            int idx = cursor.getColumnIndex(MediaStore.Images.ImageColumns.DATA);
            result = cursor.getString(idx);
            cursor.close();
        }
        return result;
    }

    private String getRealPathFromURIForGallery(Uri uri) {
        String[] projection = {MediaStore.Images.Media.DATA};
        @SuppressWarnings("deprecation")
        Cursor cursor = managedQuery(uri, projection, null, null, null);
        int column_index = cursor.getColumnIndexOrThrow(MediaStore.Images.Media.DATA);
        cursor.moveToFirst();
        return cursor.getString(column_index);
    }

    private class AllMediasReceiver extends AsyncTask<String, Void, ArrayList<HeritageMedia>> {
        private Activity mContext;
        private String mImageUri;
        private int mItemID;

        private AllMediasReceiver(Activity context, int itemID, String imageUri) {
            this.mContext = context;
            this.mItemID = itemID;
            this.mImageUri = imageUri;
        }

        @Override
        protected ArrayList<HeritageMedia> doInBackground(String... params) {
            return getMediaUrls(mItemID);
        }

        private ArrayList<HeritageMedia> getMediaUrls(int mItemID) {
            JSONArray json;
            try {
                json = new JSONArray(Fetcher.getJSON(new URL(getResources().getString(R.string.itemsEndPoint) + mItemID + "/medias"), mContext));
                Log.v(LOG_TAG, "Error in get medias" + json.toString());
                ArrayList<HeritageMedia> medias = new ArrayList<>();
                medias.add(new HeritageMedia(mImageUri, "image"));
                for (int i = 0; i < json.length(); i++) {
                    JSONObject temp = json.getJSONObject(i);
                    if (temp.getString("mediaType").equals("image")) {
                        medias.add(new HeritageMedia(temp.getString("file_url"), "image"));
                    } else if (temp.getString("extension").equals("youtube")) {
                        medias.add(new HeritageMedia(temp.getString("url"), "youtube"));
                    }
                }
                return medias;
            } catch (Exception e) {
                Log.v(LOG_TAG, "Error in get medias" + e.getMessage());
            }
            return null;
        }

        @Override
        protected void onPostExecute(ArrayList<HeritageMedia> medias) {
            if (medias.size() > 1) {
                medias.remove(1);
            }
            HeritageMediaAdapter imageAdapter = new HeritageMediaAdapter(mContext, medias);
            imageList.setAdapter(imageAdapter);
        }

    }

    private class ImageUpload extends AsyncTask<String, Void, Void> {
        Context mContext;
        String mFullPath;
        int mItemID;
        ProgressDialog dialog;

        private ImageUpload(Context context, String fullPath, int itemID) {
            this.mContext = context;
            this.mFullPath = fullPath;
            this.mItemID = itemID;
        }

        @Override
        protected Void doInBackground(String... params) {
            uploadFile(mFullPath, mItemID);

            return null;
        }

        @Override
        protected void onPostExecute(Void v) {
            Intent intent = getIntent();
            intent.addFlags(Intent.FLAG_ACTIVITY_NO_ANIMATION);
            finish();
            overridePendingTransition(0, 0);
            startActivity(intent);
            overridePendingTransition(0, 0);
//            Toast.makeText(mContext, "File Upload Complete.", Toast.LENGTH_LONG).show();
            dialog.dismiss();
        }

        @Override
        protected void onPreExecute() {
            dialog = ProgressDialog.show(mContext, "", "Image is being uploaded. Please wait...", true);
        }

        private void uploadFile(String fileName, int itemID) {
            String upLoadServerUri = "http://52.90.34.144:85/api/items/" + itemID + "/medias";
            int serverResponseCode = 0;
            HttpURLConnection conn = null;
            DataOutputStream dos = null;
            String lineEnd = "\r\n";
            String twoHyphens = "--";
            String boundary = "*****";
            int bytesRead, bytesAvailable, bufferSize;
            byte[] buffer;
            int maxBufferSize = 1 * 1024 * 1024;
            File sourceFile = new File(fileName);
            try {
                FileInputStream fileInputStream = new FileInputStream(sourceFile);
                URL url = new URL(upLoadServerUri);
                conn = (HttpURLConnection) url.openConnection(); // Open a HTTP
                conn.setDoInput(true); // Allow Inputs
                conn.setDoOutput(true); // Allow Outputs
                conn.setUseCaches(false); // Don't use a Cached Copy
                conn.setRequestMethod("POST");
                String token = PreferenceManager.getDefaultSharedPreferences(mContext).getString("token", "null");
                conn.setRequestProperty("Authorization", "JWT " + token);
                conn.setRequestProperty("Connection", "Keep-Alive");
                conn.setRequestProperty("ENCTYPE", "multipart/form-data");
                conn.setRequestProperty("Content-Type", "multipart/form-data;boundary=" + boundary);
                conn.setRequestProperty("file", fileName);
                dos = new DataOutputStream(conn.getOutputStream());

                dos.writeBytes(twoHyphens + boundary + lineEnd);
                dos.writeBytes("Content-Disposition: form-data; name=\"file\";filename=\""
                        + fileName + "\"" + lineEnd);
                dos.writeBytes(lineEnd);

                bytesAvailable = fileInputStream.available(); // create a buffer of
                // maximum size

                bufferSize = Math.min(bytesAvailable, maxBufferSize);
                buffer = new byte[bufferSize];

                // read file and write it into form...
                bytesRead = fileInputStream.read(buffer, 0, bufferSize);

                while (bytesRead > 0) {
                    dos.write(buffer, 0, bufferSize);
                    bytesAvailable = fileInputStream.available();
                    bufferSize = Math.min(bytesAvailable, maxBufferSize);
                    bytesRead = fileInputStream.read(buffer, 0, bufferSize);
                }

                // send multipart form data necesssary after file data...
                dos.writeBytes(lineEnd);
                dos.writeBytes(twoHyphens + boundary + twoHyphens + lineEnd);

                // Responses from the server (code and message)
                serverResponseCode = conn.getResponseCode();
                String serverResponseMessage = conn.getResponseMessage();

                Log.v("uploadFile", "HTTP Response is : " + serverResponseMessage
                        + ": " + serverResponseCode);
                // close the streams //
                fileInputStream.close();
                dos.flush();
                dos.close();

            } catch (MalformedURLException ex) {
                Log.v("uploadFile", "error: " + ex.getMessage(), ex);
            } catch (Exception e) {
                Log.v("uploadFile", "" + e.getMessage());
            }
            Log.v("uploadFile", serverResponseCode + "");
        }
    }

    private class FullItemLoader extends AsyncTask<Integer, Void, String> {

        @Override
        protected String doInBackground(Integer... itemID) {
            try {
                return Fetcher.getJSON(Fetcher.createUrl(getResources().getString(R.string.itemsEndPoint) + itemID[0]), HeritageItemViewActivity.this);
            } catch (IOException e) {
            }
            //if can't return Fetcher.getJSON because of exception
            return null;
        }

        @Override
        protected void onPostExecute(String jsonStr) {
            Log.v("axzs" + LOG_TAG, jsonStr);
            try {
                JSONObject itemJson = new JSONObject(jsonStr);
                JSONArray timelines = itemJson.getJSONArray("timelines");
                JSONObject timeLine0 = null;
                JSONObject loc0 = null;

                try {
                    timeLine0 = timelines.getJSONObject(0);
                    loc0 = timeLine0.getJSONObject("location");
                    final JSONObject tempLoc0 = loc0;
                    final ImageView mapButton = (ImageView) findViewById(R.id.her_item_map_button);
                    try {

                        final double longitude = tempLoc0.getDouble("longtitude");
                        final double latitude = tempLoc0.getDouble("latitude");
                        mapButton.setOnClickListener(new View.OnClickListener() {
                            @Override
                            public void onClick(View v) {
                                Uri gmmIntentUri = Uri.parse("geo:" + latitude + "," + longitude);
                                Intent mapIntent = new Intent(Intent.ACTION_VIEW, gmmIntentUri);
                                mapIntent.setPackage("com.google.android.apps.maps");
                                if (mapIntent.resolveActivity(getPackageManager()) != null) {
                                    startActivity(mapIntent);
                                }
                            }
                        });
//                        if (longitude == 0 || latitude == 0) {
//                        }

//                        Toast.makeText(HeritageItemViewActivity.this, "No map description is available", Toast.LENGTH_SHORT).show();
                    } catch (Exception e) {
                        // No long or lat is available.
                        mapButton.setVisibility(View.GONE);
                    }
                } catch (Exception e) {
                    Log.e(LOG_TAG + "timeline", "onPostExecute: ");
                }


                //JSONObject likeTotalCount = itemJson.getJSONObject("rate");
                JSONArray tags = itemJson.getJSONArray("tags");
                JSONArray comments = itemJson.getJSONArray("comments");

                TextView date = (TextView) findViewById(R.id.her_item_date);

                try {
                    String fullDate = "dummy";
                    String startDate = timeLine0.getString("startLabel");
                    String endDate = timeLine0.getString("endLabel");

                    if (endDate != null && !endDate.equals("null")) {
                        fullDate = startDate + " to " + endDate;
                    } else {
                        fullDate = startDate;
                    }

                    date.setText(fullDate);



                } catch (Exception e) {
                    date.setText("Not specified");
                    Log.e(LOG_TAG + " start date", e.getMessage());
                }


                TextView loc = (TextView) findViewById(R.id.her_item_location);
                try {
                    loc.setText(loc0.getString("name"));
                } catch (Exception e) {
                    loc.setText("Not specified");
                    Log.v(LOG_TAG + " location", e.getMessage());
                }

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
                    tagsList.add(new Tag("noTagsGiven"));

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
                        CustomDialogClass cdd = new CustomDialogClass(HeritageItemViewActivity.this, heritageItemPostID, null);
                        cdd.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                        cdd.show();
                    }
                });

                LinearLayout like_number_container = (LinearLayout) likeCommentFrame.findViewById(R.id.like_number_container);
                like_number_container.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View view) {
                        CustomLikeClass cdd = new CustomLikeClass(HeritageItemViewActivity.this, heritageItemPostID);
                        cdd.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                        cdd.show();
                    }
                });

                /*likeContainer.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View view) {
                        new LikeAction(HeritageItemViewActivity.this).execute();
                        //Toast.makeText(HeritageItemViewActivity.this, "Will like soon", Toast.LENGTH_SHORT).show();
                    }
                });*/


            } catch (
                    JSONException e)

            {
                e.printStackTrace();
            }
        }
    }

    private class ProfileLoader extends AsyncTask<String, String, String> {

        private String creator_username;
        private String creator_photo;
        private String creator_id;
        private boolean onclick;

        private ProfileLoader(boolean onclick) {
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
            String profileURL = "http://52.90.34.144:85/api/profile/" + creator_id;

            ViewGuestProfile(profileURL);

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

        private void ViewGuestProfile(String profileUrl) {
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
            mRecommendationView.setAdapter(recommendationAdapter);
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
    private class LikeAction extends AsyncTask<String, String, String> {

        private Context mContext;
        private boolean LikeSuccessful;
        private boolean isLiked;

        private LikeAction(Context context) {
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
            itemUrl = "http://52.90.34.144:85/api/items/" + heritageItemPostID;
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
                //isLiked = getIsLikedTemp();     //Needs to be removed!!
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

        private boolean uploadLikeCount(String token) {
            String result;
            String ratesUrl = "http://52.90.34.144:85/api/items/" + heritageItemPostID + "/rates";
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
        private String item_url = "http://52.90.34.144:85/api/items/" + heritageItemPostID;  // Temporary url

        private getLikeStatus() {
            this.isLiked = false;
        }

        protected String doInBackground(String... params) {
            try {
                result = Fetcher.getJSON(Fetcher.createUrl(item_url), HeritageItemViewActivity.this); //temporary result
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                JSONObject values = new JSONObject(result);
                isLiked = values.getBoolean("is_rated");
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

    private class LikeCommentCountLoader extends AsyncTask<String, String, String> {

        private String ratesUrl = "http://52.90.34.144:85/api/items/" + heritageItemPostID;
        private int totalLikeCount;
        private int totalCommentCount;
        private int totalReportCount;

        private LikeCommentCountLoader() {
        }

        @Override
        protected String doInBackground(String... params) {
            Log.v("LoaderLikeCommentCount", "hello");
            Log.v(LOG_TAG, "resulting json before itemsUrl " + ratesUrl);
            String result = null;
            totalLikeCount = 0;
            totalCommentCount = 0;
            totalReportCount = 0;
            try {
                result = Fetcher.getJSON(Fetcher.createUrl(ratesUrl), HeritageItemViewActivity.this);
                Log.v(LOG_TAG, "resulting json for ratesUrl " + result);
            } catch (Exception e) {
                Log.v(LOG_TAG, "exception" + Log.getStackTraceString(e));
                Log.v("heritageItem", "invalid url: " + ratesUrl);
            }
            try {
                Log.v(LOG_TAG, "resulting json after likeCommentReportCount: " + result);
                JSONObject values = new JSONObject(result);

                if (!values.isNull("rate")) {
                    totalLikeCount = values.getInt("rate");
                }
                JSONArray comment_ = values.getJSONArray("comments");
                totalCommentCount = comment_.length();
                totalReportCount = values.getInt("report_count");


                Log.v("heritageItem", "success parsing totalCommentCount:" + totalCommentCount);

            } catch (Exception e) {
                Log.v("heritageItem", "error parsing totalLikeCount:" + totalLikeCount);
            }

            return null;

        }

        @Override
        protected void onPostExecute(String result) {
            try {
                String temp = "";
                LinearLayout likeCommentFrame = (LinearLayout) findViewById(R.id.item_like_comment_buttons_container);
                LinearLayout likeContainer = (LinearLayout) likeCommentFrame.findViewById(R.id.like_container);
                LinearLayout commentContainer = (LinearLayout) likeCommentFrame.findViewById(R.id.comment_container);
                LinearLayout reportContainer = (LinearLayout) likeCommentFrame.findViewById(R.id.report_container);
                TextView likeCount = (TextView) likeContainer.findViewById(R.id.like_count);
                likeCount.setText("" + totalLikeCount);
                TextView commentCount = (TextView) commentContainer.findViewById(R.id.comment_count);
                commentCount.setText("" + totalCommentCount);
                TextView reportCount = (TextView) reportContainer.findViewById(R.id.report_count);
                if (totalReportCount != 0) temp = "-";
                reportCount.setText(temp + totalReportCount);

                LinearLayout like_number_container = (LinearLayout) likeCommentFrame.findViewById(R.id.like_number_container);

                TextView show_likes = (TextView) like_number_container.findViewById(R.id.show_likes);
                show_likes.setText("  Liked by " + totalLikeCount + " people");
            } catch (Exception e) {
                Log.v("heritageItem", "error setting totalLikeCount:" + totalLikeCount);
            }
        }
    }


    private class reportAction extends AsyncTask<String, String, String> {

        private Context mContext;
        private boolean reportSuccessful;
        private boolean isReported;

        private reportAction(Context context) {
            mContext = context;
        }

        @Override
        protected String doInBackground(String... params) {
            try {
                SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(mContext);
                String token = preferences.getString("token", "null");
                reportSuccessful = uploadReportPic();
                if (reportSuccessful) {
                    try {
                        reportSuccessful = uploadReportCount(token);
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
            if (reportSuccessful) {
                //Post Execute
                ImageButton reportButton = (ImageButton) findViewById(R.id.report_btn);
                if (isReported) {
                    reportButton.setImageResource(R.drawable.ic_reported);
                    Toast.makeText(mContext, "Reported Successfully", Toast.LENGTH_LONG).show();

                } else {
                    reportButton.setImageResource(R.drawable.ic_not_reported);
                }

            } else {
                Toast.makeText(mContext, "Report unsuccessful", Toast.LENGTH_LONG).show();
            }
        }

        private boolean uploadReportPic() {
            String result;
            itemUrl = "http://52.90.34.144:85/api/items/" + heritageItemPostID;
            try {
                result = Fetcher.getJSON(Fetcher.createUrl(itemUrl), HeritageItemViewActivity.this);
            } catch (IOException e) {
                e.printStackTrace();
                return false;
            }
            try {
                Log.v(LOG_TAG, "resulting json on report button " + result);
                JSONObject values = new JSONObject(result);
                isReported = values.getBoolean("is_reported");
                //isLiked = getIsLikedTemp();     //Needs to be removed!!
                if (isReported) {
                    isReported = false;
                    Log.v("ISREPORTED", "is reported :  Disreporting now");
                } else {
                    isReported = true;
                    Log.v("ISREPORTED", "is reported :  Reporting now");
                }

            } catch (Exception e) {
                Log.v("reportItem", "error parsing report:");
            }
            return !(result == null || result.equals("400"));

        }

        private boolean uploadReportCount(String token) {
            String result;
            String reportUrl = "http://52.90.34.144:85/api/items/" + heritageItemPostID + "/reports";
            try {
                result = PostJSON.postToApi(constructTheJSONReportCount(), reportUrl, token);
            } catch (IOException e) {
                e.printStackTrace();
                return false;

            }
            return !(result == null || result.equals("400"));

        }

        private JSONObject constructTheJSONReportCount() {

            JSONObject json = new JSONObject();
            try {

                if (!isReported) {
                    json.put("report", 0);
                } else {
                    json.put("report", 1);
                }

                Log.v("REPORTImplemented", "" + json.getInt("report"));


                return json;
            } catch (JSONException e) {
                Log.v("report", "Error in json construction");
            }
            return json;
        }
    }

    private class getReportStatus extends AsyncTask<String, String, String> {

        private boolean isReported;
        private String result;
        private String item_url = "http://52.90.34.144:85/api/items/" + heritageItemPostID;  // Temporary url

        private getReportStatus() {
            this.isReported = false;
        }

        protected String doInBackground(String... params) {
            try {
                result = Fetcher.getJSON(Fetcher.createUrl(item_url), HeritageItemViewActivity.this); //temporary result
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                JSONObject values = new JSONObject(result);
                isReported = values.getBoolean("is_reported");
            } catch (Exception e) {
                Log.v("reportItem", "error parsing report:");
            }
            return null;
        }

        protected void onPostExecute(String result) {
            ImageButton reportButton_ = (ImageButton) findViewById(R.id.report_btn);
            if (isReported) {
                reportButton_.setImageResource(R.drawable.ic_reported);
            } else {
                reportButton_.setImageResource(R.drawable.ic_not_reported);
            }
        }
    }
}
