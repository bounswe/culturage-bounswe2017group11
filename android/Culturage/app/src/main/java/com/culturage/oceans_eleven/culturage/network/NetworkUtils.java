package com.culturage.oceans_eleven.culturage.network;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.ConnectivityManager;
import android.os.Build;
import android.preference.PreferenceManager;
import android.provider.Settings;
import android.support.v7.app.AlertDialog;
import android.text.TextUtils;
import android.util.Log;

import com.culturage.oceans_eleven.culturage.baseClasses.ProfilePage;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.ArrayList;

public class NetworkUtils {

    /**
     * Tag for the log messages
     */
    private static final String LOG_TAG = NetworkUtils.class.getSimpleName();

    static ArrayList<ProfilePage> fetchProfilePageData(String requestUrl, Context context) {
        // Create URL object
        URL url = createUrl(requestUrl);

        // Perform HTTP request to the URL and receive a JSON response back
        String jsonResponse = null;
        try {
            jsonResponse = makeHttpRequest(url, context);
        } catch (IOException e) {
            Log.e(LOG_TAG, "Error closing input stream", e);
        }

        // Extract relevant fields from the JSON response and create an {@link Event} object
        // Return the {@link Event}
        return extractProfilePageFromJson(jsonResponse);
    }

    /**
     * Returns new URL object from the given string URL.
     */
    private static URL createUrl(String stringUrl) {
        URL url = null;
        try {
            url = new URL(stringUrl);
        } catch (MalformedURLException e) {
            Log.e(LOG_TAG, "Error with creating URL ", e);
        }
        return url;
    }

    /**
     * Make an HTTP request to the given URL and return a String as the response.
     */
    private static String makeHttpRequest(URL url, Context context) throws IOException {
        String jsonResponse = "";

        // If the URL is null, then return early.
        if (url == null) {
            return jsonResponse;
        }

        HttpURLConnection urlConnection = null;
        InputStream inputStream = null;
        try {
            urlConnection = (HttpURLConnection) url.openConnection();
            urlConnection.setReadTimeout(10000 /* milliseconds */);
            urlConnection.setConnectTimeout(15000 /* milliseconds */);
            urlConnection.setRequestMethod("GET");                  //!!!!!!!!!!!1 watch out

            SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(context);
            String token = preferences.getString("token", "null");
            // String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMiwidXNlcm5hbWUiOiJha29rc2FsIiwiZW1haWwiOiJha29rc2FsQGEuY29tIiwiZXhwIjoyNTA4Njc4OTE1fQ.PgPIJppA9u5umhrHGxPmv7_1Hi2ItASDgd7NH4DHcO0";
            urlConnection.setRequestProperty("Authorization", "JWT " + token);
            urlConnection.connect();

            // If the request was successful (response code 200),
            // then read the input stream and parse the response.
            if (urlConnection.getResponseCode() == 200) {
                inputStream = urlConnection.getInputStream();
                jsonResponse = readFromStream(inputStream);
            } else {
                Log.e(LOG_TAG, "Error response code: " + urlConnection.getResponseCode());
            }
        } catch (IOException e) {
            Log.e(LOG_TAG, "Problem retrieving the profile page JSON results.", e);
        } finally {
            if (urlConnection != null) {
                urlConnection.disconnect();
            }
            if (inputStream != null) {
                inputStream.close();
            }
        }
        return jsonResponse;
    }

    /**
     * Convert the {@link InputStream} into a String which contains the
     * whole JSON response from the server.
     */
    private static String readFromStream(InputStream inputStream) throws IOException {
        StringBuilder output = new StringBuilder();
        if (inputStream != null) {
            InputStreamReader inputStreamReader = new InputStreamReader(inputStream, Charset.forName("UTF-8"));
            BufferedReader reader = new BufferedReader(inputStreamReader);
            String line = reader.readLine();
            while (line != null) {
                output.append(line);
                line = reader.readLine();
            }
        }
        return output.toString();
    }

    /**
     * Return an {@link ProfilePage} object by parsing out information
     * about the first earthquake from the input profilepageJSON string.
     */
    private static ArrayList<ProfilePage> extractProfilePageFromJson(String profilepageJSON) {
        // If the JSON string is empty or null, then return early.
        if (TextUtils.isEmpty(profilepageJSON)) {
            return null;
        }

        // Create an empty ArrayList that we can start adding profilepages to
        ArrayList<ProfilePage> profilepages = new ArrayList<>();

        // Try to parse the SAMPLE_JSON_RESPONSE. If there's a problem with the way the JSON
        // is formatted, a JSONException exception object will be thrown.
        // Catch the exception so the app doesn't crash, and print the error message to the logs.
        try {

            JSONObject json = new JSONObject(profilepageJSON);

            String username = json.getString("username");
            String email = "";
            String fullName = "";
            String location = "";
            String photo = "-1";
            String birthday = "";

            if (!json.isNull("email")) {
                email = json.getString("email");
            }
            if (!json.isNull("fullName")) {
                fullName = json.getString("fullName");
            }
            if (!json.isNull("location")) {
                location = json.getString("location");
            }
            if (!json.isNull("photo")) {
                photo = json.getString("photo");
            }
            if (!json.isNull("birthday")) {
                birthday = json.getString("birthday");
            }

            Log.v("Get Json Username", username);
            Log.v("Get Json name", fullName);
            Log.v("Get Json email", email);
            Log.v("Get Json location", location);
            Log.v("Get Json photo", photo);
            Log.v("Get Json birthday", birthday);


            //TODO dont forget to give the parameters
            profilepages.add(new ProfilePage(username, email, fullName, location, photo, birthday));

        } catch (JSONException e) {
            Log.e("QueryUtils", "Problem parsing the profile page results", e);
        }

        // Return the list of profilePages
        return profilepages;
    }

    /**
     * Checks if internet connection exists else alerts the user
     *
     * @param context the context currently being used
     */
    public static void forceInternetConnection(final Context context) {
        ConnectivityManager conMan = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        if (conMan.getActiveNetworkInfo() == null || !conMan.getActiveNetworkInfo().isConnected()) {
            AlertDialog.Builder builder;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                builder = new AlertDialog.Builder(context, android.R.style.Theme_Material_Dialog_Alert);
            } else {
                builder = new AlertDialog.Builder(context);
            }
            builder.setTitle("No Internet Connection")
                    .setMessage("Please connect to the internet")
                    .setPositiveButton("Connect to Wi-Fi", new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialog, int which) {
                            context.startActivity(new Intent(Settings.ACTION_WIFI_SETTINGS));
                        }
                    })
                    .setIcon(android.R.drawable.ic_dialog_alert)
                    .show();
        }
    }
}
