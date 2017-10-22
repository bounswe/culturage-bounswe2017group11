/*
This code is taken from:
http://www.theappguruz.com/blog/android-take-photo-camera-gallery-code-sample
 */
package com.culturage.oceans_eleven.culturage.newsFeed;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.Environment;
import android.provider.MediaStore;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.ImageView;

import com.culturage.oceans_eleven.culturage.R;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;


public class UploadActivity extends Activity {

    private int REQUEST_CAMERA = 0, SELECT_FILE = 1;
    private ImageView ivImage;
    private String userChosenTask;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_upload);

        ImageButton btnTakePhoto = (ImageButton) findViewById(R.id.btnTakePhoto);
        btnTakePhoto.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                cameraIntent();
                //userChosenTask = "Take Photo";
            }
        });

        ImageButton btnSelectPhoto = (ImageButton) findViewById(R.id.btnSelectPhoto);
        btnSelectPhoto.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                //userChosenTask = "Choose from Gallery";
                galleryIntent();
            }
        });

        Button btnUpload = (Button) findViewById(R.id.upload_btn);
        btnUpload.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                // For now just return to news feed
                startActivity(new Intent(UploadActivity.this, NewsFeedActivity.class));
            }
        });
        ivImage = (ImageView) findViewById(R.id.ivImage);
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

        ivImage.setImageBitmap(thumbnail);
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

        ivImage.setImageBitmap(bm);
    }

}
