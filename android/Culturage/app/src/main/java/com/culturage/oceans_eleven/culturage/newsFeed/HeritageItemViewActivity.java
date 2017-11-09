package com.culturage.oceans_eleven.culturage.newsFeed;


import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import com.culturage.oceans_eleven.culturage.R;
import com.squareup.picasso.Picasso;

public class HeritageItemViewActivity extends AppCompatActivity {

    private int heritageItemPostID = -1;
    private String creator_id;
    private String creator_username;
    Button showComments;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_heritage_item_view);

        showComments = (Button) findViewById(R.id.showComments);
        showComments.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
//                R.id.TXT_Exit:
                CustomDialogClass cdd = new CustomDialogClass(HeritageItemViewActivity.this);
                cdd.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                cdd.show();
            }
        });
        Bundle extras = getIntent().getExtras();
        if (extras != null) {
            this.heritageItemPostID = extras.getInt("postID");
        }

        TextView title = (TextView) findViewById(R.id.her_item_Title);
        title.setText(getIntent().getStringExtra("title"));

        ImageView iw = (ImageView) findViewById(R.id.her_item_photo);
        int defaultImageId = R.drawable.culturage;

        String imageUri = extras.getString("imageUrl");
        // 400 looks cool
        Picasso.with(this).load(imageUri).resize(400, 0).into(iw);

//        iw.setImageResource(getIntent().getIntExtra("resourceID", defaultImageId));

//        String desc_tit = "WHAT IS IT?";
        String desc_tit = "Description?";

        TextView desc_tit_view = (TextView) findViewById(R.id.her_item_description_title);
        desc_tit_view.setText(desc_tit);

        TextView desc_view = (TextView) findViewById(R.id.her_item_description);
        desc_view.setText(getIntent().getStringExtra("description"));

        TextView date_title = (TextView) findViewById(R.id.her_item_date_title);
//        date_title.setText("SO ACTUALLY WHEN ARE WE TALKING ABOUT?");
        date_title.setText("Date");

        TextView date = (TextView) findViewById(R.id.her_item_date);
        date.setText(getIntent().getStringExtra("date"));

        TextView loc_title = (TextView) findViewById(R.id.her_item_location_title);
//        loc_title.setText("ANY KNOWN LOCATION?");
        loc_title.setText("Location");

        TextView loc = (TextView) findViewById(R.id.her_item_location);
        loc.setText(getIntent().getStringExtra("location"));

        TextView tags = (TextView) findViewById(R.id.her_item_tags);
        tags.setText(getIntent().getStringExtra("tags"));

        creator_id = getIntent().getStringExtra("creator_id");
        creator_username = getIntent().getStringExtra("creator_username");
        TextView guest = (TextView) findViewById(R.id.guest_profile);
        guest.setText(creator_username);
        guest.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(HeritageItemViewActivity.this, ProfileGuestActivity.class));
                Intent intent = new Intent(HeritageItemViewActivity.this, ProfileGuestActivity.class);
                intent.putExtra("creator_id", creator_id); //New
                startActivity(intent);
            }
        });


    }

}
