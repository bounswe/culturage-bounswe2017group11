package com.culturage.oceans_eleven.culturage.newsFeed;

import android.app.Activity;
import android.app.LoaderManager;
import android.content.Context;
import android.content.Intent;
import android.content.Loader;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.AsyncTask;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.provider.MediaStore;
import android.support.v7.app.AppCompatActivity;
import android.util.Base64;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.Toast;

import com.culturage.oceans_eleven.culturage.R;
import com.culturage.oceans_eleven.culturage.baseClasses.ProfilePage;
import com.culturage.oceans_eleven.culturage.network.PostJSON;
import com.culturage.oceans_eleven.culturage.network.ProfilePageLoader;
import com.culturage.oceans_eleven.culturage.signup_login.LoginActivity;
import com.squareup.picasso.Picasso;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;

public class ProfilePageActivity extends AppCompatActivity implements LoaderManager.LoaderCallbacks<ArrayList<ProfilePage>> {

    private int SELECT_FILE = 1;
    private boolean isChangedImage = false;
    private ImageView photo;
    private static final String apiURL = "http://18.220.108.135/api/profile";
    private static final String baseURL = "http://18.220.108.135";
    private ProgressBar mProgressBar;
    private EditText username, email, fullName, location, birthday;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_profile_page);

        mProgressBar = (ProgressBar) findViewById(R.id.progress_bar_profilePage);

        getLoaderManager().initLoader(1, null, this);

        //Upload profile picture button
        ImageButton uploadProfilePic = (ImageButton) findViewById(R.id.uploadProfilePic);
        uploadProfilePic.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //userChosenTask = "Choose from Gallery";
                galleryIntent();
            }
        });

        photo = (ImageView) findViewById(R.id.profilePicture);

        ImageButton signout = (ImageButton) findViewById(R.id.logout);
        signout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(ProfilePageActivity.this);
                SharedPreferences.Editor editor = preferences.edit();
                editor.putString("token", "null");
                editor.apply();
                startActivity(new Intent(ProfilePageActivity.this, LoginActivity.class));
            }
        });

        //Save Change button for saving profile changes
        final boolean isValidProfileChange = true;
        ImageButton saveprofile = (ImageButton) findViewById(R.id.saveProfile);
        saveprofile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String[] arrayProfile = new String[5];
                for (int i = 0; i < arrayProfile.length; i++) {
                    arrayProfile[i] = "";
                }
                username = (EditText) findViewById(R.id.profileUsernameEdit);
                email = (EditText) findViewById(R.id.profileEmailEdit);
                fullName = (EditText) findViewById(R.id.profileFullNameEdit);
                location = (EditText) findViewById(R.id.profileLocationEdit);
                birthday = (EditText) findViewById(R.id.profileBirthdayEdit);
                photo = (ImageView) findViewById(R.id.profilePicture);

                Log.v("Stop!", "Here");
                arrayProfile[0] = fullName.getText().toString();
                Log.v("Continue", arrayProfile[0]);
                arrayProfile[1] = username.getText().toString();
                arrayProfile[2] = email.getText().toString();
                arrayProfile[3] = location.getText().toString();
                arrayProfile[4] = birthday.getText().toString();

                BitmapDrawable drawable = (BitmapDrawable) (photo.getDrawable());
                String imageString = getEncoded64ImageStringFromBitmap(drawable.getBitmap());

                ProfilePage profilePage = new ProfilePage(arrayProfile[1], arrayProfile[2], arrayProfile[0],
                        arrayProfile[3], imageString, arrayProfile[4]);

                if (isValidProfileChange) {
                    try {

                        new uploadProfileRequest(ProfilePageActivity.this, arrayProfile, profilePage).execute();
                    } catch (Exception e) {
                        Log.v("uploadPRofileTag", "caught exception");
                        finish();
                    }
                    //  startActivity(new Intent(ProfilePageActivity.this, NewsFeedActivity.class));
                }
            }
        });

        ImageButton discard_changes = (ImageButton) findViewById(R.id.discard_changes);
        discard_changes.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(ProfilePageActivity.this, NewsFeedActivity.class));
            }
        });

/*
        Spinner spinner = (Spinner) findViewById(R.id.birthDaySpinner);
        // Create an ArrayAdapter using the string array and a default spinner layout
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this,
                R.array.birthDayList, android.R.layout.simple_spinner_item);
        // Specify the layout to use when the list of choices appears
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        // Apply the adapter to the spinner
        spinner.setAdapter(adapter);


        spinner = (Spinner) findViewById(R.id.birthMonthSpinner);
        // Create an ArrayAdapter using the string array and a default spinner layout
        adapter = ArrayAdapter.createFromResource(this,
                R.array.birthMonthList, android.R.layout.simple_spinner_item);
        // Specify the layout to use when the list of choices appears
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        // Apply the adapter to the spinner
        spinner.setAdapter(adapter);


        spinner = (Spinner) findViewById(R.id.birthYearSpinner);
        // Create an ArrayAdapter using the string array and a default spinner layout
        adapter = ArrayAdapter.createFromResource(this,
                R.array.birthYearList, android.R.layout.simple_spinner_item);
        // Specify the layout to use when the list of choices appears
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        // Apply the adapter to the spinner
        spinner.setAdapter(adapter); */

    }


    private void galleryIntent() {
        Intent intent = new Intent();
        intent.setType("image/*");
        intent.setAction(Intent.ACTION_GET_CONTENT);//
        startActivityForResult(Intent.createChooser(intent, "Select File"), SELECT_FILE);
    }

    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if (resultCode == Activity.RESULT_OK) {
            if (requestCode == SELECT_FILE) {
                isChangedImage = true;
                onSelectFromGalleryResult(data);
            }
        }
    }

    public String getEncoded64ImageStringFromBitmap(Bitmap bitmap) {
        ByteArrayOutputStream stream = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.JPEG, 70, stream);
        byte[] byteFormat = stream.toByteArray();
        // get the base 64 string
        return Base64.encodeToString(byteFormat, Base64.NO_WRAP);
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

        photo.setImageBitmap(bm);

    }

    public void updateUi(ArrayList<ProfilePage> profilePages) {
        if (profilePages != null || profilePages.size() > 0) {
            username = (EditText) findViewById(R.id.profileUsernameEdit);
            email = (EditText) findViewById(R.id.profileEmailEdit);
            fullName = (EditText) findViewById(R.id.profileFullNameEdit);
            location = (EditText) findViewById(R.id.profileLocationEdit);
            birthday = (EditText) findViewById(R.id.profileBirthdayEdit);

            username.setText(profilePages.get(0).getUsername());
            email.setText(profilePages.get(0).getEmail());
            fullName.setText(profilePages.get(0).getFullName());
            location.setText(profilePages.get(0).getLocation());
            birthday.setText(profilePages.get(0).getBirthday());

            if (!isChangedImage) {
                if (!profilePages.get(0).getPhoto().equals("-1")) {
                    photo = (ImageView) findViewById(R.id.profilePicture);
                    String imageUri = "http://" + profilePages.get(0).getPhoto();
                    Log.v("Uploadtag", imageUri);
                    Picasso.with(getBaseContext()).load(imageUri).into(photo);
                    // String imageUri = baseURL + profilePages.get(0).getPhoto();

                }
            }
        }

    }

    @Override
    public Loader<ArrayList<ProfilePage>> onCreateLoader(int i, Bundle bundle) {
        Log.v("LoaderProfilePage", "hello");
        mProgressBar.setVisibility(View.VISIBLE);
        return new ProfilePageLoader(ProfilePageActivity.this, apiURL);
    }

    @Override
    public void onLoadFinished(Loader<ArrayList<ProfilePage>> loader, ArrayList<ProfilePage> profilePages) {
        if (profilePages == null) return;
        updateUi(profilePages);
        mProgressBar.setVisibility(View.GONE);

    }

    @Override
    public void onLoaderReset(Loader<ArrayList<ProfilePage>> loader) {

    }


    private boolean isConnectedToInternet() {

        ConnectivityManager cm = (ConnectivityManager) this.getSystemService(Context.CONNECTIVITY_SERVICE);

        NetworkInfo ni = cm.getActiveNetworkInfo();
        if (ni == null) {
            return false;
        }
        return ni.isConnected();
    }

    @Override
    public void onBackPressed() {
        moveTaskToBack(true);
    }

    ///////

    private class uploadProfileRequest extends AsyncTask<String, String, String> {

        Context mContext;
        boolean uploadSuccessful;
        String[] arrayProfile;
        ProfilePage profilePage;

        private uploadProfileRequest(Context context, String[] arrayProfile, ProfilePage profilePage) {
            mContext = context;
            this.arrayProfile = arrayProfile;
            this.profilePage = profilePage;
        }

        @Override
        protected String doInBackground(String... params) {
            try {
                SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(mContext);
                String token = preferences.getString("token", "null");
                uploadSuccessful = uploadProfile(token);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "";
        }

        @Override
        protected void onPostExecute(String result) {
            mProgressBar.setVisibility(View.INVISIBLE);
            if (uploadSuccessful) {
                startActivity(new Intent(ProfilePageActivity.this, NewsFeedActivity.class));
            } else {
                Toast.makeText(mContext, "Upload unsuccessful", Toast.LENGTH_LONG).show();
            }
        }

        @Override
        protected void onPreExecute() {
            mProgressBar.setVisibility(View.VISIBLE);
        }

        private boolean uploadProfile(String token) {
            String result;
            try {
                result = PostJSON.postToApi(constructTheJSON(),apiURL,token);
            } catch (IOException e) {
                e.printStackTrace();
                return false;

            }
            if(result == null || result.equals("400")){
                return false;
            }

            return true;

        }

        private JSONObject constructTheJSON() {

            JSONObject json = new JSONObject();
            try {

                if (arrayProfile[0] != null) {
                    json.put("fullName", arrayProfile[0]);
                }
                if (arrayProfile[3] != null) {
                    json.put("location", arrayProfile[3]);
                }
                if (arrayProfile[1] != null) {
                    json.put("username", arrayProfile[1]);
                }
                if (arrayProfile[2] != null) {
                    //json.put("email", arrayProfile[2]);
                }
                //TODO: Problem here, needs to be changeed.
                if (arrayProfile[4] != null) {
                    if (arrayProfile[4].equals("")) {
                        Log.v("Birthday String Length:", arrayProfile[4]);
                    } else {
                        json.put("birthday", arrayProfile[4]);
                    }
                }
                //   if(!("image/png;base64,"+profilePage.getPhoto()).equals(json.getString("photo"))){
                json.put("photo", "image/png;base64," + profilePage.getPhoto());
                //  }
                Log.v("IMPORTANT HEREE!!", json.getString("photo"));
                Log.v("Make the comparrison", profilePage.getPhoto());


                return json;
            } catch (JSONException e) {
                Log.v("upload", "Error in json construction");
            }
            return json;
        }
    }

    /*

    private class uploadProfileRequest extends AsyncTask<String, String, Void> {
        private String resp;
        String returnedToken;
        Context mContext;
        private String[] arrayProfile;

        public uploadProfileRequest(Context context, String[] arrayProfile) {
            mContext = context;
            for(int i = 0; i< arrayProfile.length; i++){
                this.arrayProfile[i] = arrayProfile[i];
            }
            Log.v("Look Here", arrayProfile[0]);
        }

        @Override
        protected Void doInBackground(String... params) {
            try {
                new ProfileUploadLoader(ProfilePageActivity.this, apiURL, arrayProfile);
            } catch (Exception e) {
                e.printStackTrace();
                resp = e.getMessage();
            }
            return null;
        }



        protected void onPostExecute() {
            mProgressBar.setVisibility(View.INVISIBLE);
            startActivity(new Intent(ProfilePageActivity.this, NewsFeedActivity.class));

        }

        @Override
        protected void onPreExecute() {
            mProgressBar.setVisibility(View.VISIBLE);
        }

    }  */

}
