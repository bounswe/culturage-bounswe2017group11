package com.culturage.oceans_eleven.culturage.newsFeed;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.provider.MediaStore;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Spinner;

import com.culturage.oceans_eleven.culturage.R;
import com.culturage.oceans_eleven.culturage.signup_login.LoginActivity;

import java.io.IOException;

public class ProfilePageActivity extends AppCompatActivity {

    private int SELECT_FILE = 1;
    private ImageView profileImage;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_profile_page);

        //Upload profile picture button
        Button uploadProfilePic = (Button) findViewById(R.id.uploadProfilePic);
        uploadProfilePic.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //userChosenTask = "Choose from Gallery";
                galleryIntent();
            }
        });

        profileImage = (ImageView) findViewById(R.id.CulturagePicture);

        Button signout = (Button) findViewById(R.id.SignOut);
        signout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(ProfilePageActivity.this, LoginActivity.class));
            }
        });

        //Save Change button for saving profile changes
        final boolean isValidProfileChange = true;
        Button saveprofile = (Button) findViewById(R.id.saveProfile);
        saveprofile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (isValidProfileChange) {
                    startActivity(new Intent(ProfilePageActivity.this, NewsFeedActivity.class));
                }
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

        profileImage.setImageBitmap(bm);

    }

}
