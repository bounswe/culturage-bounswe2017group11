package com.culturage.oceans_eleven.culturage.newsFeed;


import android.os.Bundle;

import com.culturage.oceans_eleven.culturage.baseClasses.HeritageItem;
import com.culturage.oceans_eleven.culturage.network.NewsFeedLoader;

import java.util.ArrayList;

/**
 * The fragment that holds general - recently added heritage item recommendations
 * extends HeritageItemListFragment
 */
public class UniversalNewsfeedFragment extends HeritageItemListFragment {

    private static final String apiURL = "http://52.90.34.144:85/api/newsfeed";

    @Override
    public android.support.v4.content.Loader<ArrayList<HeritageItem>> onCreateLoader(int id, Bundle args) {
        return new NewsFeedLoader(getContext(), apiURL);
    }


}
