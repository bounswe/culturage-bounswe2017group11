package com.culturage.oceans_eleven.culturage.newsFeed;


import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.ImageView;
import android.widget.TextView;

import com.culturage.oceans_eleven.culturage.R;
import com.squareup.picasso.Picasso;

public class HeritageItemViewActivity extends AppCompatActivity {

    private int heritageItemPostID = -1;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_heritage_item_view);

        Bundle extras = getIntent().getExtras();
        if (extras != null) {
            this.heritageItemPostID = extras.getInt("postID");
            retrievePost();
        }


        TextView title = (TextView) findViewById(R.id.her_item_Title);
        title.setText(getIntent().getStringExtra("title"));


        ImageView iw = (ImageView) findViewById(R.id.her_item_photo);
        int defaultImageId = R.drawable.culturage;

        String imageUri = extras.getString("imageUrl");
        Picasso.with(this).load(imageUri).into(iw);

//        iw.setImageResource(getIntent().getIntExtra("resourceID", defaultImageId));

        TextView tagsView = (TextView) findViewById(R.id.her_item_tags);
        tagsView.setText("#nice\t#cool\t#dummy");


//        String desc_tit = "WHAT IS IT?";
        String desc_tit = "What is it?";

        TextView desc_tit_view = (TextView) findViewById(R.id.her_item_description_title);
        desc_tit_view.setText(desc_tit);

        TextView desc_view = (TextView) findViewById(R.id.her_item_description);
        desc_view.setText(getIntent().getStringExtra("description"));

        TextView date_title = (TextView) findViewById(R.id.her_item_date_title);
//        date_title.setText("SO ACTUALLY WHEN ARE WE TALKING ABOUT?");
        date_title.setText("So... what actually ar we talking about?");

        TextView date = (TextView) findViewById(R.id.her_item_date);
        date.setText("1789 - ?");

        TextView loc_title = (TextView) findViewById(R.id.her_item_location_title);
//        loc_title.setText("ANY KNOWN LOCATION?");
        loc_title.setText("Any known location?");


        TextView loc = (TextView) findViewById(R.id.her_item_location);
        loc.setText("in the middle of nowhere");
    }


    private boolean retrievePost() {
        //TODO implement api stuff

        return true; //to see if we got it successfully or not
    }
}