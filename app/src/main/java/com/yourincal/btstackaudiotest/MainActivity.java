package com.yourincal.btstackaudiotest;

import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;

public class MainActivity extends ActionBarActivity {

    private native void run();


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        run();
    }



    static
    {
    	System.loadLibrary("main");
    }
}
