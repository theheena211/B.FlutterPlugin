
import 'ace_poc_flutter_plugin_platform_interface.dart';

class AcePocFlutterPlugin {
  Future<String?> getPlatformVersion() {
    return AcePocFlutterPluginPlatform.instance.getPlatformVersion();
  }
}

