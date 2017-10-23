package com.culturage.oceans_eleven.culturage.network;

import android.content.AsyncTaskLoader;
import android.content.Context;
import android.util.Log;

import com.culturage.oceans_eleven.culturage.newsFeed.ProfilePage;

import java.util.ArrayList;

/**
 * Created by BARIN on 23.10.2017.
 */

public class ProfilePageLoader extends AsyncTaskLoader<ArrayList<ProfilePage>> {

    private String Url;
    private Context context;

    public ProfilePageLoader(Context context, String url) {
        super(context);
        this.context = context;
        this.Url = url;
    }

    @Override
    protected void onStartLoading() {
        forceLoad();
    }

    @Override
    public ArrayList<ProfilePage> loadInBackground() {
        Log.v("ProfilePageLoader", "okey");
        return Utils.fetchProfilePageData(Url, context);
    }
}
