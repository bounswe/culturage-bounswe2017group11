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
import android.text.InputType;
import android.util.Base64;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TableRow;
import android.widget.TextView;
import android.widget.Toast;

import com.culturage.oceans_eleven.culturage.R;
import com.culturage.oceans_eleven.culturage.baseClasses.HeritageItem;
import com.culturage.oceans_eleven.culturage.network.PostJSON;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import com.google.android.gms.location.places.Place;
import com.google.android.gms.location.places.ui.PlacePicker;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;


public class UploadActivity extends Activity {

    private static final String UPLOAD_URL = "http://52.90.34.144:85/api/items/";
    private final int REQUEST_CAMERA = 0, SELECT_FILE = 1, PLACE_PICKER_REQUEST = 2;
    private double longitude = 0, latitude = 0;
    private ImageView mImageView;
    private ProgressBar mProgressBar;
    private EditText mStartYearView, mEndYearView;
    private Switch mBcSwitchStart, mBcSwitchEnd;
    private Spinner mStartDaySpinner, mStartMonthSpinner, mstartDateResolutionSpinner, mEndDateResolutionSpinner, mEndDaySpinner, mEndMonthSpinner;
    private Button oneDateButton, intervalDateButton;
    private TableRow startDateResolutionRow, startDateRow, endDateResolutionRow, endDateRow;

    private boolean isApprxStart = false, isApprxEnd = false;
    private EditText mTitleView, mDescView, mYearView, mTagView;
    private TextView mLocView;
    private Switch mBcSwitch;
    private Spinner mDaySpinner, mMonthSpinner;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_upload);

        mProgressBar = (ProgressBar) findViewById(R.id.progress_bar_upload);
        mImageView = (ImageView) findViewById(R.id.ivImage);
        mTitleView = (EditText) findViewById(R.id.upload_title);
        mDescView = (EditText) findViewById(R.id.upload_description);
        mStartYearView = (EditText) findViewById(R.id.upload_year);
        mLocView = (EditText) findViewById(R.id.upload_location);
        mTagView = (EditText) findViewById(R.id.upload_tags);
        mBcSwitchStart = (Switch) findViewById(R.id.acSwitch);
        mStartDaySpinner = (Spinner) findViewById(R.id.daySpinner);
        mStartMonthSpinner = (Spinner) findViewById(R.id.monthSpinner);

        mEndYearView = (EditText) findViewById(R.id.upload_yearEnd);
        mBcSwitchEnd = (Switch) findViewById(R.id.acSwitchEnd);
        mEndDaySpinner = (Spinner) findViewById(R.id.daySpinnerEnd);
        mEndMonthSpinner = (Spinner) findViewById(R.id.monthSpinnerEnd);

        startDateResolutionRow = (TableRow) findViewById(R.id.startDateResolutionRow);
        startDateRow = (TableRow) findViewById(R.id.startDateRow);
        endDateResolutionRow = (TableRow) findViewById(R.id.endDateResolutionRow);
        endDateRow = (TableRow) findViewById(R.id.endDateRow);

        intervalDateButton = (Button) findViewById(R.id.intervalButton);


        intervalDateButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                endDateResolutionRow.setVisibility(View.VISIBLE);
                endDateRow.setVisibility(View.VISIBLE);
            }
        });


        oneDateButton = (Button) findViewById(R.id.normalDateButton);


        oneDateButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                endDateResolutionRow.setVisibility(View.GONE);
                endDateRow.setVisibility(View.GONE);
            }
        });


        mstartDateResolutionSpinner = (Spinner) findViewById(R.id.date_resolutions);
        // Create an ArrayAdapter using the string array and a default spinner layout
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this,
                R.array.resolutions, android.R.layout.simple_spinner_item);
        // Specify the layout to use when the list of choices appears
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        // Apply the adapter to the spinner
        mstartDateResolutionSpinner.setAdapter(adapter);

        mstartDateResolutionSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {


            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                //Log.v("Spinner tag", "position =" + position + " , id: "  + id);

                if (position == 0) { //exact

                    mBcSwitchStart.setEnabled(false);
                    mStartDaySpinner.setEnabled(false);
                    mStartMonthSpinner.setEnabled(false);

                    mStartYearView.setInputType(InputType.TYPE_NULL);
                    mStartYearView.setEnabled(false);

                    isApprxStart = false;

                } else if (position == 1) { //exact

                    mBcSwitchStart.setEnabled(true);
                    mStartDaySpinner.setEnabled(true);
                    mStartMonthSpinner.setEnabled(true);

                    mStartYearView.setInputType(InputType.TYPE_CLASS_NUMBER);
                    mStartYearView.setEnabled(true);

                    isApprxStart = false;

                } else if (position == 2) { //approx.

                    mBcSwitchStart.setEnabled(true);
                    mStartDaySpinner.setEnabled(false);
                    mStartMonthSpinner.setEnabled(false);

                    mStartYearView.setInputType(InputType.TYPE_CLASS_NUMBER);
                    mStartYearView.setEnabled(true);

                    isApprxStart = true;


                } else if (position == 3) { //repetetive

                    mBcSwitchStart.setEnabled(true);
                    mStartDaySpinner.setEnabled(true);
                    mStartMonthSpinner.setEnabled(true);

                    mStartYearView.setInputType(InputType.TYPE_NULL);
                    mStartYearView.setEnabled(false);

                    isApprxStart = false;


                }
            }

            @Override
            public void onNothingSelected(AdapterView<?> arg0) {
                // TODO Auto-generated method stub

            }

        });

        mEndDateResolutionSpinner = (Spinner) findViewById(R.id.date_resolutionsEnd);
        // Create an ArrayAdapter using the string array and a default spinner layout
        ArrayAdapter<CharSequence> EndAdapter = ArrayAdapter.createFromResource(this,
                R.array.resolutions, android.R.layout.simple_spinner_item);
        // Specify the layout to use when the list of choices appears
        EndAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        // Apply the adapter to the spinner
        mEndDateResolutionSpinner.setAdapter(EndAdapter);

        mEndDateResolutionSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {


            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                //Log.v("Spinner tag", "position =" + position + " , id: "  + id);

                if (position == 0) { //exact

                    mBcSwitchEnd.setEnabled(false);
                    mEndDaySpinner.setEnabled(false);
                    mEndMonthSpinner.setEnabled(false);

                    mEndYearView.setInputType(InputType.TYPE_NULL);
                    mEndYearView.setEnabled(false);

                    isApprxEnd = false;

                } else if (position == 1) { //exact

                    mBcSwitchEnd.setEnabled(true);
                    mEndDaySpinner.setEnabled(true);
                    mEndMonthSpinner.setEnabled(true);

                    mEndYearView.setInputType(InputType.TYPE_CLASS_NUMBER);
                    mEndYearView.setEnabled(true);

                    isApprxEnd = false;

                } else if (position == 2) { //approx.

                    mBcSwitchEnd.setEnabled(true);
                    mEndDaySpinner.setEnabled(false);
                    mEndMonthSpinner.setEnabled(false);

                    mEndYearView.setInputType(InputType.TYPE_CLASS_NUMBER);
                    mEndYearView.setEnabled(true);

                    isApprxEnd = true;


                } else if (position == 3) { //repetetive

                    mBcSwitchEnd.setEnabled(true);
                    mEndDaySpinner.setEnabled(true);
                    mEndMonthSpinner.setEnabled(true);

                    mEndYearView.setInputType(InputType.TYPE_NULL);
                    mEndYearView.setEnabled(false);

                    isApprxEnd = false;


                }
            }

            @Override
            public void onNothingSelected(AdapterView<?> arg0) {
                // TODO Auto-generated method stub

            }

        });


        mLocView = (TextView) findViewById(R.id.upload_location);
        mBcSwitch = (Switch) findViewById(R.id.acSwitch);
        mDaySpinner = (Spinner) findViewById(R.id.daySpinner);
        mMonthSpinner = (Spinner) findViewById(R.id.monthSpinner);

        ImageButton btnTakePhoto = (ImageButton) findViewById(R.id.btnTakePhoto);
        btnTakePhoto.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                startCameraIntent();
            }
        });

        ImageButton btnSelectPhoto = (ImageButton) findViewById(R.id.btnSelectPhoto);
        btnSelectPhoto.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                startGalleryIntent();
            }
        });

        ImageView btnMap = (ImageView) findViewById(R.id.map_button);
        btnMap.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                PlacePicker.IntentBuilder builder = new PlacePicker.IntentBuilder();
                try {
                    startActivityForResult(builder.build(UploadActivity.this), PLACE_PICKER_REQUEST);
                } catch (GooglePlayServicesRepairableException e) {
                    Log.v("upload", "first catch");
                    e.printStackTrace();
                } catch (GooglePlayServicesNotAvailableException e) {
                    Log.v("upload", "second catch");
                    e.printStackTrace();
                }
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

                /*parse start date*/
                String day = mStartDaySpinner.getSelectedItem().toString();
                String month = mStartMonthSpinner.getSelectedItem().toString();
                String year = mStartYearView.getText().toString();
                if (year.equals("")) {
                    year = "0000";
                } else {
                    if (mBcSwitchStart.isChecked()) {
                        // BC case
                        year = "-" + year;
                    }
                }
                if (day.equals("--")) {
                    day = "00";
                }
                if (month.equals("--")) {
                    month = "00";
                }


                String date = year + "-" + month + "-" + day;

                if (isApprxStart) {
                    date += '~';
                }


                /*parse end date if given*/
                String dayEnd = mEndDaySpinner.getSelectedItem().toString();
                String monthEnd = mEndMonthSpinner.getSelectedItem().toString();
                String yearEnd = mEndYearView.getText().toString();

                String dateEnd = "";
                if (yearEnd.equals("") && dayEnd.equals("--") && monthEnd.equals("--")) {
                    dateEnd = null;
                } else {


                    if (yearEnd.equals("")) {
                        yearEnd = "0000";
                    } else {
                        if (mBcSwitchEnd.isChecked()) {
                            // BC case
                            yearEnd = "-" + yearEnd;
                        }
                    }
                    if (dayEnd.equals("--")) {
                        dayEnd = "00";
                    }
                    if (monthEnd.equals("--")) {
                        monthEnd = "00";
                    }


                    dateEnd = yearEnd + "-" + monthEnd + "-" + dayEnd;

                    if (isApprxEnd) {
                        dateEnd += '~';
                    }
                }



                Log.v("upload-date", date);
//                startActivity(new Intent(UploadActivity.this, NewsFeedActivity.class));
                HeritageItem itemToUpload = new HeritageItem(mTitleView.getText().toString(), mDescView.getText().toString(), imageString, rate, createdAt, date, dateEnd, mLocView.getText().toString(), longitude, latitude, mTagView.getText().toString());
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
        return Base64.encodeToString(byteFormat, Base64.NO_WRAP);
    }

//    @Override
//    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
//        switch (requestCode) {
//            case NewsFeedUtils.MY_PERMISSIONS_REQUEST_READ_EXTERNAL_STORAGE:
//                if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
//                    if (userChosenTask.equals("Take Photo"))
//                        startCameraIntent();
//                    else if (userChosenTask.equals("Choose from Gallery"))
//                        startGalleryIntent();
//                } else {
//                    //code for deny
//                }
//                break;
//        }
//    }

    private void startGalleryIntent() {
        Intent intent = new Intent();
        intent.setType("image/*");
        intent.setAction(Intent.ACTION_GET_CONTENT);//
        startActivityForResult(Intent.createChooser(intent, "Select File"), SELECT_FILE);
    }

    private void startCameraIntent() {
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
        if (requestCode == PLACE_PICKER_REQUEST) {
            if (resultCode == RESULT_OK) {
                Place place = PlacePicker.getPlace(data, this);
//                String toastMsg = String.format("Place: %s %s",place.getName(), place.getLatLng());
//                Toast.makeText(this, toastMsg, Toast.LENGTH_LONG).show();
                mLocView.setText(place.getName());
                longitude = place.getLatLng().longitude;
                latitude = place.getLatLng().latitude;
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

            String result;

            try {
                result = PostJSON.postToApi(constructTheJSON(), UPLOAD_URL, token);
            } catch (IOException e) {
                e.printStackTrace();
                return false;
            }

            return !(result == null || result.equals("400"));
        }

        private JSONObject constructTheJSON() {
            JSONObject json = new JSONObject();
            try {
                json.put("name", itemToUpload.getmTitle());
                json.put("description", itemToUpload.getmDescription());
                json.put("image", "image/png;base64," + itemToUpload.getmImageBase64String());

                /*add location*/
                JSONObject location = new JSONObject();
                if (itemToUpload.getmLatitude() != 0 && itemToUpload.getmLongitude() != 0) {
                    location.put("name", itemToUpload.getmLocationName());
                    location.put("longtitude", itemToUpload.getmLongitude());
                    location.put("latitude", itemToUpload.getmLatitude());
                }
                json.put("location", location);

                /*add date*/
                JSONObject date = new JSONObject();
                date.put("start", itemToUpload.getmStartDate());
                if (itemToUpload.getmEndDate() != null) {
                    date.put("end", itemToUpload.getmEndDate());
                }

                json.put("date", date);

                /*add tags*/
                JSONArray tags = new JSONArray(itemToUpload.getMTags().replaceAll("#", "").split("\\s"));
                Log.v("upload-tag", tags.toString());
                json.put("tags", tags);
                Log.v("upload", itemToUpload.getmImageBase64String());
                Log.v("upload-whole json", json.toString());
                return json;
            } catch (JSONException e) {
                Log.v("upload", "Error in json construction");
            }
            return json;
        }
    }
}
