import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ace_poc_flutter_plugin_method_channel.dart';

abstract class AcePocFlutterPluginPlatform extends PlatformInterface {
  /// Constructs a AcePocFlutterPluginPlatform.
  AcePocFlutterPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static AcePocFlutterPluginPlatform _instance = MethodChannelAcePocFlutterPlugin();

  /// The default instance of [AcePocFlutterPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelAcePocFlutterPlugin].
  static AcePocFlutterPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AcePocFlutterPluginPlatform] when
  /// they register themselves.
  static set instance(AcePocFlutterPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
