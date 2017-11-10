package com.culturage.oceans_eleven.culturage.network;

import android.content.AsyncTaskLoader;
import android.content.Context;

import com.culturage.oceans_eleven.culturage.baseClasses.HeritageItem;

import java.util.ArrayList;

/**
 * by gry on 21.10.2017.
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