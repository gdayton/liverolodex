package com.orgpoint.android;

import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.widget.Button;

public class HomeActivity extends AppCompatActivity {

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_home);

    Button button = new Button(this);

    button.setOnClickListener();


    Log.d("LOG", "This is a test log");
    Log.d("log", "I wrote this");

  }


}