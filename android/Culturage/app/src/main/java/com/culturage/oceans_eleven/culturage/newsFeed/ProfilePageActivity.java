package com.culturage.oceans_eleven.culturage.newsFeed;

import android.app.Activity;
import android.app.LoaderManager;
import android.content.Context;
import android.content.Intent;
import android.content.Loader;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.provider.MediaStore;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.Spinner;

import com.culturage.oceans_eleven.culturage.R;
import com.culturage.oceans_eleven.culturage.network.ProfilePageLoader;
import com.culturage.oceans_eleven.culturage.signup_login.LoginActivity;
import com.squareup.picasso.Picasso;

import java.io.IOException;
import java.util.ArrayList;

public class ProfilePageActivity extends AppCompatActivity implements LoaderManager.LoaderCallbacks<ArrayList<ProfilePage>> {

    private int SELECT_FILE = 1;
    private ImageView photo;
    private static final String apiURL = "http://18.220.108.135/api/profile";
    private static final String baseURL = "http://18.220.108.135";
    private ProgressBar mProgressBar;
    private EditText username, email, fullName, location;



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
                if (isValidProfileChange) {
                    startActivity(new Intent(ProfilePageActivity.this, NewsFeedActivity.class));
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
        spinner.setAdapter(adapter);

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
                onSelectFromGalleryResult(data);
            }
        }
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


            username.setText(profilePages.get(0).getUsername());
            email.setText(profilePages.get(0).getEmail());
            fullName.setText(profilePages.get(0).getFullName());
            location.setText(profilePages.get(0).getLocation());

            if (!profilePages.get(0).getPhoto().equals("-1")) {
                photo = (ImageView) findViewById(R.id.profilePicture);
                String imageUri = baseURL + profilePages.get(0).getPhoto();
                Picasso.with(getBaseContext()).load(imageUri).into(photo);
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

}
