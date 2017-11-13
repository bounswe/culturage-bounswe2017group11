package com.culturage.oceans_eleven.culturage.newsFeed;


import android.os.Bundle;

import com.culturage.oceans_eleven.culturage.baseClasses.HeritageItem;
import com.culturage.oceans_eleven.culturage.network.NewsFeedLoader;

import java.util.ArrayList;

/**
 * Created by me on 10.11.2017.
 */

public class UniversalNewsfeedFragment extends HeritageItemListFragment {

    private static final String apiURL = "http://18.220.108.135/api/items";

    @Override
    public android.support.v4.content.Loader<ArrayList<HeritageItem>> onCreateLoader(int id, Bundle args) {
        return new NewsFeedLoader(getContext(), apiURL);
    }


}
