package com.culturage.oceans_eleven.culturage.signup_login;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
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
    String email, username, password;
    static String token;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sign_up);

        mUsernameView = (EditText) findViewById(R.id.signup_username);
        mPasswordView = (EditText) findViewById(R.id.signup_password);
        mEmailView = (EditText) findViewById(R.id.email_signup_form);

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
                    new SignupRequest().execute();
                } catch (Exception e) {
                    Log.v("signuptag", "caught exception");
                    finish();
                }
                if (token != null) {
                    Log.v("signuptag", token);
                    startActivity(new Intent(SignUpActivity.this, NewsFeedActivity.class));
                } else {
                    Log.v("signuptag", token + "null");
                }
            }
        });

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
        try {
            JSONObject json = new JSONObject(result);
            token = json.getString("token");
            Log.v("signuptag", "JSon is extracted. Token: " + token);
        } catch (JSONException e) {
            Log.e("signuptag", "Problem parsing the JSON results", e);
        }
        return token;
    }

    private class SignupRequest extends AsyncTask<String, String, String> {

        private String resp;
        ProgressDialog progressDialog;
        String returnedToken;

        @Override
        protected String doInBackground(String... params) {
            publishProgress("Sleeping..."); // Calls onProgressUpdate()
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
            progressDialog.dismiss();
            SignUpActivity.token = returnedToken;
            startActivity(new Intent(SignUpActivity.this, NewsFeedActivity.class));
        }

        @Override
        protected void onPreExecute() {
            progressDialog = ProgressDialog.show(SignUpActivity.this,
                    "ProgressDialog",
                    "Wait for  seconds");
        }

    }
}
