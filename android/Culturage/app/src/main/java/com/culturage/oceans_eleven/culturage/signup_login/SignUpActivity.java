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
import android.widget.Button;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.Toast;

import com.culturage.oceans_eleven.culturage.R;
import com.culturage.oceans_eleven.culturage.network.PostJSON;
import com.culturage.oceans_eleven.culturage.newsFeed.NewsFeedActivity;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.PrintWriter;
import java.io.StringWriter;

public class SignUpActivity extends AppCompatActivity {

    private static final String registerURI = "auth/register/";
    private EditText mPasswordView, mEmailView, mUsernameView;
    private ProgressBar mProgressBar;
    String email, username, password;
    SharedPreferences preferences;
    SharedPreferences.Editor editor;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sign_up);
        preferences = PreferenceManager.getDefaultSharedPreferences(SignUpActivity.this);

        mUsernameView = (EditText) findViewById(R.id.signup_username);
        mPasswordView = (EditText) findViewById(R.id.signup_password);
        mEmailView = (EditText) findViewById(R.id.email_signup_form);
        mProgressBar = (ProgressBar) findViewById(R.id.progress_bar_signup);

        Button mSignUpBtn;
        mSignUpBtn = (Button) findViewById(R.id.sign_up_button);
        mSignUpBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                username = mUsernameView.getText().toString();
                password = mPasswordView.getText().toString();
                email = mEmailView.getText().toString();
                Toast.makeText(SignUpActivity.this
                        , username + password, Toast.LENGTH_SHORT).show();
                Log.v("signuptag", "Send request");
                try {
                    new SignupRequest(SignUpActivity.this).execute();
                } catch (Exception e) {
                    Log.v("signuptag", "caught exception");
                    finish();
                }
            }
        });

    }


    private class SignupRequest extends AsyncTask<String, String, String> {

        private String resp;
        String returnedToken;
        Context mContext;

        public SignupRequest(Context context) {
            mContext = context;
        }

        @Override
        protected String doInBackground(String... params) {
            try {
                returnedToken = sendSignupRequest();
            } catch (Exception e) {
                e.printStackTrace();
                resp = e.getMessage();
            }
            return resp;
        }


        @Override
        protected void onPostExecute(String result) {
            mProgressBar.setVisibility(View.GONE);
            editor = preferences.edit();
            editor.putString("token", returnedToken);
            editor.apply();
            startActivity(new Intent(SignUpActivity.this, NewsFeedActivity.class));
        }

        @Override
        protected void onPreExecute() {
            mProgressBar.setVisibility(View.VISIBLE);
        }

    }

    private String sendSignupRequest() {
        JSONObject json = new JSONObject();
        try {
            json.put("email", email);
            json.put("username", username);
            json.put("password", password);
        } catch (JSONException e) {
            // TODO: Handle exception
            Log.v("signuptag", "Error in Json construction");
            e.printStackTrace();
        }

        String result = null;
        try {
            result = PostJSON.postToApi(json, registerURI);
        } catch (Exception e) {
            // TODO: Handle exception
            StringWriter sw = new StringWriter();
            e.printStackTrace(new PrintWriter(sw));
            String exceptionAsString = sw.toString();
            Log.v("signuptag", exceptionAsString);
        }
        if (result.equals("Error")) {
            Log.v("signuptag", "400 returned from server");
        }
        return parseJson(result);
    }

    private String parseJson(String result) {
        String token = null;
        try {
            JSONObject json = new JSONObject(result);
            token = json.getString("token");
            Log.v("signuptag", "JSon is extracted. Token: " + token);
        } catch (JSONException e) {
            Log.e("signuptag", "Problem parsing the JSON results", e);
        }
        return token;
    }
}
