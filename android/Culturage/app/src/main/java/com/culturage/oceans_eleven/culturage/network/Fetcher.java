package com.culturage.oceans_eleven.culturage.network;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.text.TextUtils;
import android.util.Log;

import com.culturage.oceans_eleven.culturage.baseClasses.HeritageItem;

import org.json.JSONArray;
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

/**
 * Created by me on 21.10.2017.
 * <p>
 * Fetches data from url
 * does some other url stuff internally
 */

public class Fetcher {
    /**
     * Tag for the log messages
     */
    private static final String LOG_TAG = Fetcher.class.getSimpleName();

    /**
     * Query the "backend" and return an {@link HeritageItem} object to represent a single heritage item.
     */
    static ArrayList<HeritageItem> fetchNewsFeedData(String requestUrl, Context context) {

        // Create URL object
        URL url = createUrl(requestUrl);
        // Perform HTTP request to the URL and receive a JSON response back
        String jsonResponse = null;
        try {
            jsonResponse = getJSON(url, context);
        } catch (IOException e) {
            Log.e(LOG_TAG, "Error closing input stream", e);
        }
        return extractHeritageItemsFromJson(jsonResponse);
    }

    /**
     * Returns new URL object from the given string URL.
     */
    public static URL createUrl(String stringUrl) {
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
    public static String getJSON(URL url, Context context) throws IOException {
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
            urlConnection.setRequestMethod("GET");

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
                Log.v(LOG_TAG, "Fetched succesfully " + jsonResponse);
            } else {
                Log.e(LOG_TAG, "Error response code: " + urlConnection.getResponseCode());
            }
        } catch (IOException e) {
            Log.e(LOG_TAG, "Problem retrieving the news feed JSON results.", e);
        } finally {
            if (urlConnection != null) {
                urlConnection.disconnect();
            }
            if (inputStream != null) {
                inputStream.close();
            }
        }
        Log.v(LOG_TAG, "resulting json " + jsonResponse);
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
     * Return an {@link HeritageItem} object by parsing out information
     * about the first heritage item from the input newsFeedJSON string.
     */
    private static ArrayList<HeritageItem> extractHeritageItemsFromJson(String newsFeedJSON) {
        // If the JSON string is empty or null, then return early.
        if (TextUtils.isEmpty(newsFeedJSON)) {
            return null;
        }

        // Create an empty ArrayList that we can start adding HeritageItem's to
        ArrayList<HeritageItem> heritageItems = new ArrayList<>();
        try {
            JSONArray items = new JSONArray(newsFeedJSON);
            for (int i = 0; i < items.length(); i++) {
                JSONObject values = items.getJSONObject(i);
                String title, description, imageURL, rate, createdAt, date, location = "", stringTags = "";
                title = values.getString("name");
                description = values.getString("description");
                imageURL = values.getString("featured_img");
                boolean isRated = values.getBoolean("is_rated");
                int postID = values.getInt("id");
//                createdAt = values.getString("created_at");
//                JSONArray timelines = values.getJSONArray("timelines");
//                date = parseDate(timelines);
//                try {
//                    location = timelines.getJSONObject(0).getJSONObject("location").getString("name");
//                } catch (Exception e) {
//                    Log.v("fetcher", "error parsing location.");
//                }
//                JSONArray tags = values.getJSONArray("tags");
//                try {
//                    stringTags = parseTags(tags);
//                } catch (Exception e) {
//                    Log.v("fetcher", "error parsing tags.");
//                }

                heritageItems.add(new HeritageItem(postID, title.trim(), description.trim(), imageURL, isRated));
                //heritageItems.get(i).setCreatorId(creator.getString("id")); //New
                //heritageItems.get(i).setCreatorUsername(creator.getString("username"));
            }
        } catch (Exception e) {
            Log.v(LOG_TAG, "Error in populating heritage items");
        }

        return heritageItems;
    }

    private static String parseTags(JSONArray tags) {
        String stringTags = "";
        try {
            StringBuilder stringTagsBuilder = new StringBuilder();
            for (int j = 0; j < tags.length(); j++) {
                stringTagsBuilder = stringTagsBuilder.append("#");
                stringTagsBuilder = stringTagsBuilder.append(tags.getJSONObject(j).getString("name"));
                stringTagsBuilder = stringTagsBuilder.append(" ");
            }
            stringTags = stringTagsBuilder.toString();
        } catch (Exception e) {
            Log.v("fetcher", "error parsing tags");
        }
        if (stringTags.equals("#")) {
            stringTags = "";
        }
        stringTags = stringTags.replaceAll("##", "#").trim();
        return stringTags;
    }

    private static String parseDate(JSONArray timelines) {
        String date = "";
        try {
            date = timelines.getJSONObject(0).getString("startDate");
            Log.v("fetcher-loc", timelines.getJSONObject(0).toString());
            Log.v("integer", date);
            if (date == null || date.equals("null")) {
                date = "2017-01-01";
            }
            String[] temp = date.split("-");
            int tempYear = Integer.parseInt(temp[0]);
            if (tempYear > 3000) {
                temp[0] = tempYear - 3000 + "";
            } else {
                temp[0] = tempYear + "";
            }
            date = temp[2] + "/" + temp[1] + "/" + temp[0];
        } catch (Exception e) {
            Log.v("fetcher", "Error parsing date");
        }
        return date;
    }

}

