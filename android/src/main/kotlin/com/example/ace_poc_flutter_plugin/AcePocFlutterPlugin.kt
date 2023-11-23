package com.example.ace_poc_flutter_plugin

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import kotlinx.coroutines.*



/** AcePocFlutterPlugin */
class AcePocFlutterPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  /*private val platformVersionProvider = PlatformVersionProvider()*/
  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "ace_poc_flutter_plugin")
    channel.setMethodCallHandler(this)
  }

  /*No coroutins no Delay
  override fun onMethodCall(call: MethodCall, result: Result) {
   if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else {
      result.notImplemented()
    }
  }
  */
  /* Sleep of 2secs
  override fun onMethodCall(call: MethodCall, result: Result) {
   if (call.method == "getPlatformVersion") {
     Thread.sleep(2000)
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else {
      result.notImplemented()
    }
  }
  */


  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {

      // Introduce a delay of 2 seconds using coroutines
      GlobalScope.launch {
        delay(2000)
        withContext(Dispatchers.Main) {
          result.success("Android ${android.os.Build.VERSION.RELEASE}")
        }
      }
    } else {
      result.notImplemented()
    }
  }

  /*Next step to create independant code and link via AAR
  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success(platformVersionProvider.getPlatformVersion()) // Use the extracted function
    } else {
      result.notImplemented()
    }
  }
*/

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
