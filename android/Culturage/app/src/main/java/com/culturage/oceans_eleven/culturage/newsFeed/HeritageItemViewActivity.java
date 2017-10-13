package com.culturage.oceans_eleven.culturage.newsFeed;


import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.ImageView;
import android.widget.TextView;

import com.culturage.oceans_eleven.culturage.R;

import static com.culturage.oceans_eleven.culturage.R.mipmap.ic_launcher;

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
        title.setText("dummy item");


        ImageView iw = (ImageView) findViewById(R.id.her_item_photo);
        iw.setImageResource(R.drawable.culturage);

        String desc_tit = "WHAT IS IT?";
        TextView desc_tit_view = (TextView) findViewById(R.id.her_item_description_title);
        desc_tit_view.setText(desc_tit);

        String desc = "this is a test text";
        TextView desc_view = (TextView) findViewById(R.id.her_item_description);
        desc_view.setText(desc);

        TextView date_title = (TextView) findViewById(R.id.her_item_date_title);
        date_title.setText("SO ACTUALLY WHEN ARE WE TALKING ABOUT?");

        TextView date = (TextView) findViewById(R.id.her_item_date);
        date.setText("1789 - ?");

        TextView loc_title = (TextView) findViewById(R.id.her_item_location_title);
        loc_title.setText("ANY KNOWN LOCATION?");

        TextView loc = (TextView) findViewById(R.id.her_item_location);
        loc.setText("in the middle of nowhere");
    }


    private boolean retrievePost() {
        //TODO implement api stuff

        return true; //to see if we got it successfully or not
    }
}