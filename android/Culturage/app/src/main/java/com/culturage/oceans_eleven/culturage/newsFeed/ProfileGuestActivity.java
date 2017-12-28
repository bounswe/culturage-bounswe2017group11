package com.culturage.oceans_eleven.culturage.newsFeed;

import android.app.LoaderManager;
import android.content.Intent;
import android.content.Loader;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.culturage.oceans_eleven.culturage.R;
import com.culturage.oceans_eleven.culturage.baseClasses.ProfilePage;
import com.culturage.oceans_eleven.culturage.network.ProfilePageLoader;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;

public class ProfileGuestActivity extends AppCompatActivity implements LoaderManager.LoaderCallbacks<ArrayList<ProfilePage>> {

    private ImageView photo;
    private String apiURL = "http://52.90.34.144:85/api/profile/";
    private static final String baseURL = "http://52.90.34.144:85";
    private ProgressBar mProgressBar;
    private String creator_id;
    private TextView username, email, fullName, location, birthday;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_profile_guest);

        creator_id = getIntent().getStringExtra("creator_id");
        Log.v("Guest creator_id Tag", creator_id);
        apiURL = apiURL + creator_id;

        mProgressBar = (ProgressBar) findViewById(R.id.progress_bar_profileGuest);

        getLoaderManager().initLoader(1, null, this);

        photo = (ImageView) findViewById(R.id.profilePictureGuest);

        ImageButton go_back = (ImageButton) findViewById(R.id.back_profileGuest);
        go_back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(ProfileGuestActivity.this, NewsFeedActivity.class));
            }
        });

        //Save Change button for saving profile changes
        final boolean isValidProfileChange = true;

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

    public void updateUi(ArrayList<ProfilePage> profilePages) {
        if (profilePages != null || profilePages.size() > 0) {
            username = (TextView) findViewById(R.id.profileUsernameTextGuest);
            email = (TextView) findViewById(R.id.profileEmailTextGuest);
            fullName = (TextView) findViewById(R.id.profileFullNameTextGuest);
            location = (TextView) findViewById(R.id.profileLocationTextGuest);
            birthday = (TextView) findViewById(R.id.profileBirthdayTextGuest);

            username.setText(profilePages.get(0).getUsername());
            email.setText(profilePages.get(0).getEmail());
            fullName.setText(profilePages.get(0).getFullName());
            location.setText(profilePages.get(0).getLocation());
            birthday.setText(profilePages.get(0).getBirthday());

            if (!profilePages.get(0).getPhoto().equals("-1")) {
                photo = (ImageView) findViewById(R.id.profilePictureGuest);
                String imageUri = "http://" + profilePages.get(0).getPhoto();
                Log.v("Uploadtag", imageUri);
                Picasso.with(getBaseContext()).load(imageUri).into(photo);
                // String imageUri = baseURL + profilePages.get(0).getPhoto();

            }

        }

    }

    @Override
    public Loader<ArrayList<ProfilePage>> onCreateLoader(int i, Bundle bundle) {
        Log.v("LoaderProfilePage", "hello");
        mProgressBar.setVisibility(View.VISIBLE);
        return new ProfilePageLoader(ProfileGuestActivity.this, apiURL);
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

    @Override
    public void onBackPressed() {
        moveTaskToBack(true);
    }

}
