import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ace_poc_flutter_plugin/ace_poc_flutter_plugin_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelAcePocFlutterPlugin platform = MethodChannelAcePocFlutterPlugin();
  const MethodChannel channel = MethodChannel('ace_poc_flutter_plugin');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
