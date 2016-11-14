package com.yourincal.btstackaudiotest;

import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.hardware.usb.*;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.util.Log;

import java.util.HashMap;
import java.util.Iterator;

public class MainActivity extends ActionBarActivity {
    private static final String ACTION_USB_PERMISSION  = "com.yourincal.btstackaudiotest.USB_PERMISSION";
    private PendingIntent mPermissionIntent;

    private native void run(String device_path, int fd);


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        mPermissionIntent = PendingIntent.getBroadcast(this, 0, new Intent(ACTION_USB_PERMISSION), 0);
        IntentFilter filter = new IntentFilter(ACTION_USB_PERMISSION);
        registerReceiver(mUsbReceiver, filter);

        UsbManager manager = (UsbManager) getSystemService(Context.USB_SERVICE);
        HashMap<String, UsbDevice> deviceList = manager.getDeviceList();

        Log.i("USB", "device count: " + deviceList.values().size());

        Iterator<UsbDevice> deviceIterator = deviceList.values().iterator();
        while (deviceIterator.hasNext()) {
            UsbDevice device = deviceIterator.next();
            Log.i("USB", "found device! Manufacturer: " + device.getManufacturerName());
            Log.i("USB", "  product: " + device.getProductName());
            Log.i("USB", " class: " + device.getDeviceClass());

            if (device.getDeviceClass() == UsbConstants.USB_CLASS_WIRELESS_CONTROLLER) {
                Log.i("USB", "Found one! requesting access now...");
                manager.requestPermission(device, mPermissionIntent);
            }
        }
    }

    private final BroadcastReceiver mUsbReceiver = new BroadcastReceiver() {

        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            if (ACTION_USB_PERMISSION.equals(action)) {
                synchronized (this) {
                    UsbDevice device = (UsbDevice)intent.getParcelableExtra(UsbManager.EXTRA_DEVICE);

                    if (intent.getBooleanExtra(UsbManager.EXTRA_PERMISSION_GRANTED, false)) {
                        if(device != null){
                            Log.i("USB", "Received permission, opening device now");
                            String device_path = device.getDeviceName();
                            UsbManager manager = (UsbManager) getSystemService(Context.USB_SERVICE);
                            UsbDeviceConnection con = manager.openDevice(device);

                            // UsbInterface in = device.getInterface(0);
                            // con.claimInterface(device.getInterface(0), true);
                            // con.claimInterface(device.getInterface(1), true);

//                            UsbEndpoint ep = in.getEndpoint(0);
//                            Log.d("USB", "EP addr: " + ep.getAddress() + " max pack: " + ep.getMaxPacketSize());
                            int fd = con.getFileDescriptor();
                            run(device_path, fd);
                        }
                    }
                    else {
                        Log.d("USB", "permission denied for device " + device);
                    }
                }
            }
        }
    };


    static
    {
        System.loadLibrary("usb1.0");
        System.loadLibrary("main");
    }
}
