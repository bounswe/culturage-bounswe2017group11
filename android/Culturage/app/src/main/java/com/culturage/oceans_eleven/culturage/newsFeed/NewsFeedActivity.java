package com.culturage.oceans_eleven.culturage.newsFeed;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.TabLayout;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.Toast;

import com.culturage.oceans_eleven.culturage.R;
import com.culturage.oceans_eleven.culturage.adapters.HeritageItemListAdapter;
import com.culturage.oceans_eleven.culturage.network.NetworkUtils;

public class NewsFeedActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // Set the content of the activity to use the activity_main.xml layout file
        setContentView(R.layout.activity_fragment_work_around);
        NetworkUtils.forceInternetConnection(NewsFeedActivity.this);


        ImageButton searchButton = (ImageButton) findViewById(R.id.searchButton);
        searchButton.setOnClickListener(new ImageButton.OnClickListener() {

            @Override
            public void onClick(View v) {
                EditText searchBar = (EditText) findViewById(R.id.search_bar);
                final String stringToSearch = searchBar.getText().toString();
                if (stringToSearch.length() == 0) {

                    /*if no query search is provided than do not search*/
                    Toast.makeText(NewsFeedActivity.this, "Please enter a search query", Toast.LENGTH_LONG).show();
                    return;
                }
                Intent newIntent = new Intent(NewsFeedActivity.this, SearchActivity.class);
                newIntent.putExtra("stringToSearch", stringToSearch);
                newIntent.putExtra("endPoint", getResources().getString(R.string.search_item_EndPoint));
                startActivity(newIntent);
            }
        });

        ImageView profileIcon = (ImageView) findViewById(R.id.profileIcon);
        profileIcon.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(NewsFeedActivity.this, ProfilePageActivity.class));
            }
        });

        // Find the view pager that will allow the user to swipe between fragments
        ViewPager viewPager = (ViewPager) findViewById(R.id.viewpager);

        // Create an adapter that knows which fragment should be shown on each page
        HeritageItemListAdapter adapter = new HeritageItemListAdapter(this, getSupportFragmentManager());

        // Set the adapter onto the view pager
        viewPager.setAdapter(adapter);

        // Find the tab layout that shows the tabs
        TabLayout tabLayout = (TabLayout) findViewById(R.id.tabs);

        // Connect the tab layout with the view pager. This will
        //   1. Update the tab layout when the view pager is swiped
        //   2. Update the view pager when a tab is selected
        //   3. Set the tab layout's tab names with the view pager's adapter's titles
        //      by calling onPageTitle()
        tabLayout.setupWithViewPager(viewPager);
    }

    @Override
    public void onBackPressed() {
        moveTaskToBack(true);
    }

}
