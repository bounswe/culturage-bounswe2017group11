package com.culturage.oceans_eleven.culturage.signup_login;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.Toast;

import com.culturage.oceans_eleven.culturage.R;
import com.culturage.oceans_eleven.culturage.network.NetworkUtils;
import com.culturage.oceans_eleven.culturage.network.PostJSON;
import com.culturage.oceans_eleven.culturage.newsFeed.NewsFeedActivity;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.PrintWriter;
import java.io.StringWriter;

public class LoginActivity extends AppCompatActivity {

    private static final String registerURI = "auth/login/";
    private EditText mUsernameView;
    private EditText mPasswordView;
    private ProgressBar mProgressBar;
    SharedPreferences preferences;
    SharedPreferences.Editor editor;
    String username, password;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        NetworkUtils.forceInternetConnection(LoginActivity.this);

        preferences = PreferenceManager.getDefaultSharedPreferences(LoginActivity.this);
        String token = preferences.getString("token", "null");
        if (!token.equals("null")) {
            startActivity(new Intent(LoginActivity.this, NewsFeedActivity.class));
        }
        mUsernameView = (EditText) findViewById(R.id.username);
        mPasswordView = (EditText) findViewById(R.id.password);
        mProgressBar = (ProgressBar) findViewById(R.id.progress_bar_login);

        Button mSignInButton = (Button) findViewById(R.id.sign_in_button);
        mSignInButton.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View view) {
                attemptLogin();
            }
        });

        Button mSignUpButton = (Button) findViewById(R.id.sign_up_button);
        mSignUpButton.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(LoginActivity.this, SignUpActivity.class);
                startActivity(intent);
            }
        });

    }
    private void attemptLogin() {

        // Reset errors.
        mUsernameView.setError(null);
        mPasswordView.setError(null);

        // Store values at the time of the login attempt.
        username = mUsernameView.getText().toString();
        password = mPasswordView.getText().toString();

        new LoginRequest(LoginActivity.this).execute();
    }

    private class LoginRequest extends AsyncTask<String, String, String> {

        private String resp;
        String returnedToken;
        Context mContext;

        LoginRequest(Context context) {
            mContext = context;
        }

        @Override
        protected String doInBackground(String... params) {
            try {
                returnedToken = sendLoginRequest();
            } catch (Exception e) {
                e.printStackTrace();
                resp = e.getMessage();
            }
            return resp;
        }

        @Override
        protected void onPostExecute(String result) {
            mProgressBar.setVisibility(View.INVISIBLE);
            if (returnedToken != null) {
                editor = preferences.edit();
                editor.putString("token", returnedToken);
                editor.putString("username", username);
                editor.apply();
                startActivity(new Intent(LoginActivity.this, NewsFeedActivity.class));
            } else {
                Toast.makeText(mContext, "Invalid credentials", Toast.LENGTH_LONG).show();
            }
        }

        @Override
        protected void onPreExecute() {
            mProgressBar.setVisibility(View.VISIBLE);
        }

    }

    private String sendLoginRequest() {
        JSONObject json = new JSONObject();
        try {
            json.put("username", username);
            json.put("password", password);
            Log.v("logintag: json", json.toString());
        } catch (JSONException e) {
            Log.v("logintag", "Error in Json construction");
            e.printStackTrace();
        }

        String result = null;
        try {
            result = PostJSON.postToApi(json, "http://18.220.108.135/api/" + registerURI,"");
        } catch (Exception e) {
            // TODO: Handle exception
            StringWriter sw = new StringWriter();
            e.printStackTrace(new PrintWriter(sw));
            String exceptionAsString = sw.toString();
            Log.v("logintag", exceptionAsString);
        }
        if (result.equals("Error")) {
            Log.v("logintag", "400 returned from server");
        }
        return parseJson(result);
    }

    private String parseJson(String result) {
        String token = null;
        try {
            JSONObject json = new JSONObject(result);
            token = json.getString("token");
            Log.v("logintag", "JSon is extracted. Token: " + token);
        } catch (JSONException e) {
            Log.e("logintag", "Problem parsing the JSON results", e);
        }
        return token;
    }
}
