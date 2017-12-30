package com.culturage.oceans_eleven.culturage.network;

import android.content.AsyncTaskLoader;
import android.content.Context;
import android.util.Log;

import com.culturage.oceans_eleven.culturage.baseClasses.ProfilePage;

import java.util.ArrayList;

/**
 * Loader extends AsyncTaskLoader<ArrayList<ProfilePage>> to download the profile page information of the user
 */
public class ProfilePageLoader extends AsyncTaskLoader<ArrayList<ProfilePage>> {

    private String Url;
    private Context context;

    /**
     * @param context being used
     * @param url     the url string of the users profile info in the server
     *                example : http://.../api/profile/<userID>
     */
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
        return NetworkUtils.fetchProfilePageData(Url, context);
    }
}
