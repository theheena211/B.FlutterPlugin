import 'package:flutter_test/flutter_test.dart';
import 'package:ace_poc_flutter_plugin/ace_poc_flutter_plugin.dart';
import 'package:ace_poc_flutter_plugin/ace_poc_flutter_plugin_platform_interface.dart';
import 'package:ace_poc_flutter_plugin/ace_poc_flutter_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAcePocFlutterPluginPlatform
    with MockPlatformInterfaceMixin
    implements AcePocFlutterPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AcePocFlutterPluginPlatform initialPlatform = AcePocFlutterPluginPlatform.instance;

  test('$MethodChannelAcePocFlutterPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAcePocFlutterPlugin>());
  });

  test('getPlatformVersion', () async {
    AcePocFlutterPlugin acePocFlutterPlugin = AcePocFlutterPlugin();
    MockAcePocFlutterPluginPlatform fakePlatform = MockAcePocFlutterPluginPlatform();
    AcePocFlutterPluginPlatform.instance = fakePlatform;

    expect(await acePocFlutterPlugin.getPlatformVersion(), '42');
  });
}
