package com.culturage.oceans_eleven.culturage.signup_login;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.culturage.oceans_eleven.culturage.R;
import com.culturage.oceans_eleven.culturage.newsFeed.NewsFeedActivity;

public class SignUpActivity extends AppCompatActivity {

    private Button mSignUpBtn;
    private EditText mUsernameView;
    private EditText mPasswordView;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sign_up);

        mUsernameView = (EditText) findViewById(R.id.username);
        mPasswordView = (EditText) findViewById(R.id.password);

        mSignUpBtn = (Button) findViewById(R.id.sign_up_button);
        mSignUpBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(SignUpActivity.this, NewsFeedActivity.class);
                startActivity(intent);
                String username = mUsernameView.getText().toString();
                String password = mPasswordView.getText().toString();

                Toast.makeText(SignUpActivity.this
                        , username + password, Toast.LENGTH_SHORT).show();
            }
        });
    }
}
