package com.example.first_flutter_app

import android.annotation.SuppressLint
import android.os.Build
import android.provider.Settings
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "deviceId"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getDeviceId") {
                val androidId = getDeviceId()
                result.success(androidId)
            } else {
                result.notImplemented()
            }
        }
    }

    @SuppressLint("HardwareIds")
    private fun getDeviceId(): String? {
        var androidId = ""
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.CUPCAKE) {
            androidId = Settings.Secure.getString(context.contentResolver, Settings.Secure.ANDROID_ID)
        }
        return androidId
    }
}