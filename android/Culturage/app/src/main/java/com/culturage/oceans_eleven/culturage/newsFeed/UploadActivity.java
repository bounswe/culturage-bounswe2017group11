/*
This code is taken from:
http://www.theappguruz.com/blog/android-take-photo-camera-gallery-code-sample
 */
package com.culturage.oceans_eleven.culturage.newsFeed;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Environment;
import android.preference.PreferenceManager;
import android.provider.MediaStore;
import android.util.Base64;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.Toast;

import com.culturage.oceans_eleven.culturage.R;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.HttpURLConnection;
import java.net.URL;


public class UploadActivity extends Activity {

    private static final String UPLOAD_URL = "http://18.220.108.135/api/items/";
    private int REQUEST_CAMERA = 0, SELECT_FILE = 1;
    private ImageView mImageView;
    private ProgressBar mProgressBar;
    private EditText mTitleView, mDescView, mDateView, mLocView, mTagView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_upload);

        mProgressBar = (ProgressBar) findViewById(R.id.progress_bar_upload);
        mImageView = (ImageView) findViewById(R.id.ivImage);
        mTitleView = (EditText) findViewById(R.id.upload_title);
        mDescView = (EditText) findViewById(R.id.upload_description);
        mDateView = (EditText) findViewById(R.id.upload_date);
        mLocView = (EditText) findViewById(R.id.upload_location);
        mTagView = (EditText) findViewById(R.id.upload_tags);

        ImageButton btnTakePhoto = (ImageButton) findViewById(R.id.btnTakePhoto);
        btnTakePhoto.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                cameraIntent();
            }
        });

        ImageButton btnSelectPhoto = (ImageButton) findViewById(R.id.btnSelectPhoto);
        btnSelectPhoto.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                galleryIntent();
            }
        });

        ImageButton btnUpload = (ImageButton) findViewById(R.id.save_upload);
        btnUpload.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                BitmapDrawable drawable = (BitmapDrawable) (mImageView.getDrawable());
                String imageString = getEncoded64ImageStringFromBitmap(drawable.getBitmap());
                String rate = null;
                String createdAt = null;
                HeritageItem itemToUpload = new HeritageItem(mTitleView.getText().toString(), mDescView.getText().toString(), imageString,
                        rate, createdAt, mDateView.getText().toString(), mLocView.getText().toString(), mTagView.getText().toString());
                new UploadRequest(UploadActivity.this, itemToUpload).execute();
                startActivity(new Intent(UploadActivity.this, NewsFeedActivity.class));
            }
        });

        ImageButton discardBtn = (ImageButton) findViewById(R.id.discard_upload);
        discardBtn.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(UploadActivity.this, "Item is discarded", Toast.LENGTH_SHORT).show();
                startActivity(new Intent(UploadActivity.this, NewsFeedActivity.class));
            }
        });

    }

    public String getEncoded64ImageStringFromBitmap(Bitmap bitmap) {
        ByteArrayOutputStream stream = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.JPEG, 70, stream);
        byte[] byteFormat = stream.toByteArray();
        // get the base 64 string
        String imgString = Base64.encodeToString(byteFormat, Base64.NO_WRAP);
        return imgString;
    }

//    @Override
//    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
//        switch (requestCode) {
//            case Utility.MY_PERMISSIONS_REQUEST_READ_EXTERNAL_STORAGE:
//                if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
//                    if (userChosenTask.equals("Take Photo"))
//                        cameraIntent();
//                    else if (userChosenTask.equals("Choose from Gallery"))
//                        galleryIntent();
//                } else {
//                    //code for deny
//                }
//                break;
//        }
//    }

    private void galleryIntent() {
        Intent intent = new Intent();
        intent.setType("image/*");
        intent.setAction(Intent.ACTION_GET_CONTENT);//
        startActivityForResult(Intent.createChooser(intent, "Select File"), SELECT_FILE);
    }

    private void cameraIntent() {
        Intent intent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
        startActivityForResult(intent, REQUEST_CAMERA);
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if (resultCode == Activity.RESULT_OK) {
            if (requestCode == SELECT_FILE)
                onSelectFromGalleryResult(data);
            else if (requestCode == REQUEST_CAMERA)
                onCaptureImageResult(data);
        }
    }

    private void onCaptureImageResult(Intent data) {
        Bitmap thumbnail = (Bitmap) data.getExtras().get("data");
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        thumbnail.compress(Bitmap.CompressFormat.JPEG, 90, bytes);

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

        mImageView.setImageBitmap(thumbnail);
    }

    @SuppressWarnings("deprecation")
    private void onSelectFromGalleryResult(Intent data) {

        Bitmap bm = null;
        if (data != null) {
            try {
                bm = MediaStore.Images.Media.getBitmap(getApplicationContext().getContentResolver(), data.getData());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        mImageView.setImageBitmap(bm);
    }


    private class UploadRequest extends AsyncTask<String, String, String> {

        Context mContext;
        boolean uploadSuccessful;
        HeritageItem itemToUpload;

        private UploadRequest(Context context, HeritageItem itemToUpload) {
            mContext = context;
            this.itemToUpload = itemToUpload;
        }

        @Override
        protected String doInBackground(String... params) {
            try {
                SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(mContext);
                String token = preferences.getString("token", "null");
                uploadSuccessful = uploadPhoto(token);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "";
        }

        @Override
        protected void onPostExecute(String result) {
            mProgressBar.setVisibility(View.INVISIBLE);
            if (uploadSuccessful) {
                startActivity(new Intent(UploadActivity.this, NewsFeedActivity.class));
            } else {
                Toast.makeText(mContext, "Upload unsuccessful", Toast.LENGTH_LONG).show();
            }
        }

        @Override
        protected void onPreExecute() {
            mProgressBar.setVisibility(View.VISIBLE);
        }

        private boolean uploadPhoto(String token) {
            HttpURLConnection conn = null;
            int serverResponseCode = 400;
            Log.v("upload", "Entered method");
            try {
                URL url = new URL(UPLOAD_URL);
                // Open a HTTP  connection to  the URL
                conn = (HttpURLConnection) url.openConnection();
                conn.setDoInput(true); // Allow Inputs
                conn.setDoOutput(true); // Allow Outputs
//            conn.setUseCaches(false); // Don't use a Cached Copy
                conn.setRequestMethod("POST");
                conn.setRequestProperty("Content-Type", "application/json");
                conn.setRequestProperty("Accept", "application/json");
                conn.setRequestProperty("Authorization", "JWT " + token);

                String json = constructTheJSON();

                OutputStream outputStream = conn.getOutputStream();
                BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(outputStream, "UTF-8"));
                writer.write(json);
                writer.close();
                outputStream.close();
                Log.v("upload", "Output is closed");
                // Responses from the server (code and message)
                serverResponseCode = conn.getResponseCode();
                String serverResponseMessage = conn.getResponseMessage();
                Log.v("upload", "HTTP Response is : "
                        + serverResponseMessage + ": " + serverResponseCode);


            } catch (Exception ex) {
                StringWriter sw = new StringWriter();
                ex.printStackTrace(new PrintWriter(sw));
                String exceptionAsString = sw.toString();
                Log.v("upload", "Caught exception" + exceptionAsString);
                return false;
            }
            return serverResponseCode < 300;
        }

        private String constructTheJSON() {
            try {

                JSONObject json = new JSONObject();
                json.put("name", itemToUpload.getmTitle());
                json.put("description", itemToUpload.getmDescription());
                json.put("image", "image/png;base64," + itemToUpload.getmImageString());
                json.put("location", itemToUpload.getmLocation());
                json.put("date", itemToUpload.getmDate());
                JSONArray tags = new JSONArray(itemToUpload.getMTags().split("\\s"));
                json.put("tags", tags);
                Log.v("upload", itemToUpload.getmImageString());
                return json.toString();
            } catch (JSONException e) {
                Log.v("upload", "Error in json construction");
            }
            return "";
        }

    }

}
