package com.culturage.oceans_eleven.culturage.newsFeed;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import com.culturage.oceans_eleven.culturage.R;

import java.util.ArrayList;

public class ProfilePageActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_profile_page);

        ArrayList<String> list = new ArrayList<String>();

        list.add("Name");
        list.add("Surname");
        list.add("Username");
        list.add("Date Of Birth");
        list.add("Email Address");
        list.add("About You");


        ArrayAdapter<String> itemsAdapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, list);

        ListView listView = (ListView) findViewById(R.id.profilePage_);

        listView.setAdapter(itemsAdapter);


    }

}
