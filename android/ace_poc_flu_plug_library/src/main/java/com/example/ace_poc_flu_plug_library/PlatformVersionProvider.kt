package com.example.ace_poc_flu_plug_library

import android.os.Build

class PlatformVersionProvider {
    fun getPlatformVersion(): String {
        return "Android ${Build.VERSION.RELEASE}"
    }
}
