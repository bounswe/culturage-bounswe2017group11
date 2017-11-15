package com.culturage.oceans_eleven.culturage.newsFeed;


import android.app.LoaderManager;
import android.content.Intent;
import android.content.Loader;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.culturage.oceans_eleven.culturage.R;
import com.culturage.oceans_eleven.culturage.adapters.HeritageItemAdapter;
import com.culturage.oceans_eleven.culturage.baseClasses.CustomDialogClass;
import com.culturage.oceans_eleven.culturage.baseClasses.ProfilePage;
import com.culturage.oceans_eleven.culturage.network.ProfilePageLoader;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;

public class HeritageItemViewActivity extends AppCompatActivity {

    private int heritageItemPostID = -1;
    private String creator_id;
    private String creator_username;
    private ImageView photo;
    private String profileURL = "http://18.220.108.135/api/profile/";
    private static final String itemUrl = "http://18.220.108.135/api/items";

    private HeritageItemAdapter itemAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_heritage_item_view);

        LinearLayout frame = (LinearLayout) findViewById(R.id.item_like_comment_buttons_container);
        LinearLayout commentContainer = (LinearLayout) findViewById(R.id.comment_container);
        commentContainer.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                CustomDialogClass cdd = new CustomDialogClass(HeritageItemViewActivity.this);
                cdd.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                cdd.show();
            }
        });

        TextView commentCount = (TextView) commentContainer.findViewById(R.id.comment_count);
        commentCount.setText(0 + "");

        LinearLayout likeContainer = (LinearLayout) frame.findViewById(R.id.like_container);
        likeContainer.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Toast.makeText(HeritageItemViewActivity.this, "Will like soon", Toast.LENGTH_SHORT).show();
            }
        });

        TextView likeCount = (TextView) likeContainer.findViewById(R.id.like_count);
        likeCount.setText(0 + "");
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
//        date.setText(getIntent().getStringExtra("date"));

        TextView loc_title = (TextView) findViewById(R.id.her_item_location_title);
//        loc_title.setText("ANY KNOWN LOCATION?");
        loc_title.setText("Location");

        TextView loc = (TextView) findViewById(R.id.her_item_location);
//        loc.setText(getIntent().getStringExtra("location"));

        TextView tags = (TextView) findViewById(R.id.her_item_tags);
//        tags.setText(getIntent().getStringExtra("tags"));


        /**
         * Guest User Profile
         */
//        creator_id = getIntent().getStringExtra("creator_id");
//        creator_username = getIntent().getStringExtra("creator_username");
        TextView guest = (TextView) findViewById(R.id.guest_profile);
        ImageView guestPic = (ImageView) findViewById(R.id.guest_profile_pict);
//        guest.setText(" " + creator_username);
        guest.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(HeritageItemViewActivity.this, ProfileGuestActivity.class));
                Intent intent = new Intent(HeritageItemViewActivity.this, ProfileGuestActivity.class);
                intent.putExtra("creator_id", creator_id); //New
                startActivity(intent);
            }
        });
        guestPic.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(HeritageItemViewActivity.this, ProfileGuestActivity.class));
                Intent intent = new Intent(HeritageItemViewActivity.this, ProfileGuestActivity.class);
                intent.putExtra("creator_id", creator_id); //New
                startActivity(intent);
            }
        });

        profileURL = profileURL + creator_id;

        //Profile Loader
        getLoaderManager().initLoader(1, null, profileLoader);

        //getLoaderManager().initLoader(2,null, heritageItemLoader);

    }


    private LoaderManager.LoaderCallbacks<ArrayList<ProfilePage>> profileLoader
            = new LoaderManager.LoaderCallbacks<ArrayList<ProfilePage>>() {


        public Loader<ArrayList<ProfilePage>> onCreateLoader(int i, Bundle bundle) {
            Log.v("LoaderProfilePage", "hello");
            return new ProfilePageLoader(HeritageItemViewActivity.this, profileURL);
        }

        @Override
        public void onLoadFinished(Loader<ArrayList<ProfilePage>> loader, ArrayList<ProfilePage> profilePages) {
            if (profilePages == null) return;

            if (!profilePages.get(0).getPhoto().equals("-1")) {
                photo = (ImageView) findViewById(R.id.guest_profile_pict);
                String imageUri = "http://" + profilePages.get(0).getPhoto();
                Log.v("Uploadtag", imageUri);
                Picasso.with(getBaseContext()).load(imageUri).into(photo);
                // String imageUri = baseURL + profilePages.get(0).getPhoto();

            }
        }

        @Override
        public void onLoaderReset(Loader<ArrayList<ProfilePage>> loader) {

        }

    };

    /*
    public void updateUi(ArrayList<HeritageItem> heritageItems) {
        itemAdapter.clear();
        if (heritageItems != null || heritageItems.size() > 0) {
            itemAdapter.addAll(heritageItems);
        }
    }

    //WILL BE IMPLEMENT SOON
    private LoaderManager.LoaderCallbacks<ArrayList<HeritageItem>> heritageItemLoader
            = new LoaderManager.LoaderCallbacks<ArrayList<HeritageItem>>() {

            public Loader<ArrayList<HeritageItem>> onCreateLoader(int i, Bundle bundle) {
                return new HeritageItemListFragment();

            }

            @Override
            public void onLoadFinished(Loader<ArrayList<HeritageItem>> loader, ArrayList<HeritageItem> heritageItems) {
                if (heritageItems == null) return;
                updateUi(heritageItems);
            }

            @Override
            public void onLoaderReset(Loader<ArrayList<HeritageItem>> loader) {
                itemAdapter.clear();
            }


    }; */



}
