/*
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ace_poc_flutter_plugin_platform_interface.dart';

/// An implementation of [AcePocFlutterPluginPlatform] that uses method channels.
class MethodChannelAcePocFlutterPlugin extends AcePocFlutterPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ace_poc_flutter_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

}
*/
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ace_poc_flutter_plugin_platform_interface.dart';

/// An implementation of [AcePocFlutterPluginPlatform] that uses method channels.
class MethodChannelAcePocFlutterPlugin extends AcePocFlutterPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ace_poc_flutter_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}