import 'package:flutter_test/flutter_test.dart';
import 'package:screenshot_security/screenshot_security.dart';
import 'package:screenshot_security/screenshot_security_platform_interface.dart';
import 'package:screenshot_security/screenshot_security_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockScreenshotSecurityPlatform 
    with MockPlatformInterfaceMixin
    implements ScreenshotSecurityPlatform {

  @override
  Future<String?> setSecurityScreen() => Future.value('42');
}

void main() {
  final ScreenshotSecurityPlatform initialPlatform = ScreenshotSecurityPlatform.instance;

  test('$MethodChannelScreenshotSecurity is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelScreenshotSecurity>());
  });

  test('getPlatformVersion', () async {
    ScreenshotSecurity screenshotSecurityPlugin = ScreenshotSecurity();
    MockScreenshotSecurityPlatform fakePlatform = MockScreenshotSecurityPlatform();
    ScreenshotSecurityPlatform.instance = fakePlatform;
  
    expect(await screenshotSecurityPlugin.setSecurityScreen(), '42');
  });
}
