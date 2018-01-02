package com.culturage.oceans_eleven.culturage.network;

import android.content.Context;
import android.support.v4.content.AsyncTaskLoader;

import com.culturage.oceans_eleven.culturage.baseClasses.HeritageItem;

import java.util.ArrayList;

/**
 * Loader extends AsyncTaskLoader<ArrayList<HeritageItem> > that is used to download
 * the news feed (both general and user specific recommendation)
 */
public class NewsFeedLoader extends AsyncTaskLoader<ArrayList<HeritageItem> > {

    private String Url;
    private Context context;

    public NewsFeedLoader(Context context, String url){
        super(context);
        this.context = context;
        this.Url = url;
    }

    @Override
    protected void onStartLoading(){
        forceLoad();
    }

    @Override
    public ArrayList<HeritageItem> loadInBackground() {
        return Fetcher.fetchNewsFeedData(Url,context);
    }

}