package com.culturage.oceans_eleven.culturage.newsFeed;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.widget.ListView;

import com.culturage.oceans_eleven.culturage.R;

import java.util.ArrayList;

public class NewsFeedActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_news_feed);

        ArrayList<HeritageItem> items = new ArrayList<HeritageItem>();
        items.add(new HeritageItem("Hagia Sophia", "A good building"));
        items.add(new HeritageItem("Hagia Sophia", "A good building"));
        items.add(new HeritageItem("Hagia Sophia", "A good building"));
        items.add(new HeritageItem("Hagia Sophia", "A good building"));
        items.add(new HeritageItem("Hagia Sophia", "A good building"));
        items.add(new HeritageItem("Hagia Sophia", "A good building"));
        items.add(new HeritageItem("Hagia Sophia", "A good building"));
        items.add(new HeritageItem("Hagia Sophia", "A good building"));
        items.add(new HeritageItem("Hagia Sophia", "A good building"));
        items.add(new HeritageItem("Hagia Sophia", "A good building"));
        items.add(new HeritageItem("Hagia Sophia", "A good building"));
        items.add(new HeritageItem("Hagia Sophia", "A good building"));
        items.add(new HeritageItem("Hagia Sophia", "A good building"));

//        LayoutInflater inflater = LayoutInflater.from(NewsFeedActivity.this);
        HeritageItemAdapter adapter = new HeritageItemAdapter(NewsFeedActivity.this, items);
        ListView listView = (ListView) findViewById(R.id.news_feed_list);
        Log.v("list view situation", (listView == null) + "" + (adapter == null));
        listView.setAdapter(adapter);
    }
}
