package com.culturage.oceans_eleven.culturage.newsFeed;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.ListView;

import com.culturage.oceans_eleven.culturage.R;

import java.util.ArrayList;

public class NewsFeedActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_news_feed);

        ImageView profileIco = (ImageView) findViewById(R.id.profileIcon);
        profileIco.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(NewsFeedActivity.this, ProfilePageActivity.class);
                startActivity(intent);
            }
        });


        ArrayList<HeritageItem> items = new ArrayList<HeritageItem>();

        String description = "\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"";
        String title = "Lorem Ipsum";
        items.add(new HeritageItem(title, description, R.drawable.sample_0));
        items.add(new HeritageItem(title, description, R.drawable.sample_1));
        items.add(new HeritageItem(title, description, R.drawable.sample_2));
        items.add(new HeritageItem(title, description, R.drawable.sample_3));
        items.add(new HeritageItem(title, description, R.drawable.sample_4));
        items.add(new HeritageItem(title, description, R.drawable.sample_5));
        items.add(new HeritageItem(title, description, R.drawable.sample_6));
        items.add(new HeritageItem(title, description, R.drawable.sample_7));

//        LayoutInflater inflater = LayoutInflater.from(NewsFeedActivity.this);
        HeritageItemAdapter adapter = new HeritageItemAdapter(NewsFeedActivity.this, items);
        ListView listView = (ListView) findViewById(R.id.news_feed_list);
        Log.v("list view situation", (listView == null) + "" + (adapter == null));
        listView.setAdapter(adapter);
    }

}
