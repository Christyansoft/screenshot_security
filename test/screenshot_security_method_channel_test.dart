import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:screenshot_security/screenshot_security_method_channel.dart';

void main() {
  MethodChannelScreenshotSecurity platform = MethodChannelScreenshotSecurity();
  const MethodChannel channel = MethodChannel('screenshot_security');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.setSecurityScreen(), '42');
  });
}
