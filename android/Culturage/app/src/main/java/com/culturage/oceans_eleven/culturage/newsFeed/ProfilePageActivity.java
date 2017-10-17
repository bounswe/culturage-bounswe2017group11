package com.culturage.oceans_eleven.culturage.newsFeed;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.provider.MediaStore;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;

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

        Button uploadProfilePic = (Button) findViewById(R.id.uploadProfilePic);
        uploadProfilePic.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //userChosenTask = "Choose from Gallery";
                galleryIntent();
            }
        });

        profileImage = (ImageView) findViewById(R.id.CulturagePicture);

        Button signout = (Button) findViewById(R.id.signOut);
        signout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(ProfilePageActivity.this, LoginActivity.class));
            }
        });

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
