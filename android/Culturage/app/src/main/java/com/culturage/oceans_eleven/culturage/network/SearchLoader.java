package com.culturage.oceans_eleven.culturage.network;

import android.content.AsyncTaskLoader;
import android.content.Context;

import com.culturage.oceans_eleven.culturage.baseClasses.HeritageItem;

import java.util.ArrayList;

/**
 * Created by me on 17.11.2017.
 * Loader extends AsyncTaskLoader<ArrayList<HeritageItem>> to install search results from server
 */

public class SearchLoader extends AsyncTaskLoader<ArrayList<HeritageItem>> {

    private String Url;
    private Context context;

    /**
     * @param context being used
     * @param url     the url string of the users profile info in the server
     *                example : http://.../api/search/item?q=<searchQuery>
     */
    public SearchLoader(Context context, String url) {
        super(context);
        this.context = context;
        this.Url = url;
    }

    @Override
    protected void onStartLoading() {

        forceLoad();
    }

    @Override
    public ArrayList<HeritageItem> loadInBackground() {
        return Fetcher.fetchNewsFeedData(Url, context);
    }
}
