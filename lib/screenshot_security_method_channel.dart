import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'screenshot_security_platform_interface.dart';

/// An implementation of [ScreenshotSecurityPlatform] that uses method channels.
class MethodChannelScreenshotSecurity extends ScreenshotSecurityPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('screenshot_security');

  @override
  Future<void> setSecurityScreen({required bool enabled}) async {
    await methodChannel
        .invokeMethod<String>(enabled ? 'enableSecurity' : 'disableSecurity');
  }
}
