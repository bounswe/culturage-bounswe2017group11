package com.culturage.oceans_eleven.culturage.network;

import android.util.Log;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.Charset;

public class PostJSON {

    private static final String baseURI = "http://18.220.108.135/api/";

    public static String postToApi(JSONObject json, String endpoint) throws MalformedURLException, IOException {
        HttpURLConnection urlConnection;
        String url = baseURI + endpoint;
        String data = json.toString();
        String result = null;
        InputStream inputStream = null;
        Log.v("postApi", url);
        urlConnection = (HttpURLConnection) ((new URL(url).openConnection()));
        Log.v("postApi", " " + (urlConnection == null));
        try {
            //Connect
            urlConnection.setDoOutput(true);
//            urlConnection.setRequestProperty("Content-Type", "application/json");
//            urlConnection.setRequestProperty("Accept", "application/json");
            urlConnection.setRequestMethod("POST");
            urlConnection.connect();
            Log.v("postApi", "url connected");
            //Write
            OutputStream outputStream = urlConnection.getOutputStream();
            BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(outputStream, "UTF-8"));
            writer.write(data);
            writer.close();
            outputStream.close();
            Log.v("postApi", "output closed");
            if (urlConnection.getResponseCode() == 201) {
                inputStream = urlConnection.getInputStream();
                result = readFromStream(inputStream);
            } else {
                Log.v("postApi", json.toString());
                Log.v("postApi", urlConnection.getResponseCode() + "");
                return "400";
            }

        } catch (Exception e) {
            Log.v("postApi", "error in connection. Result: " + result);
            e.printStackTrace();
        }
        return result;

    }

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
        Log.v("postApi-read", "stream is read. output:" + output);
        return output.toString();
    }


}