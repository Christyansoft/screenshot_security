import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'screenshot_security_method_channel.dart';

abstract class ScreenshotSecurityPlatform extends PlatformInterface {
  /// Constructs a ScreenshotSecurityPlatform.
  ScreenshotSecurityPlatform() : super(token: _token);

  static final Object _token = Object();

  static ScreenshotSecurityPlatform _instance = MethodChannelScreenshotSecurity();

  /// The default instance of [ScreenshotSecurityPlatform] to use.
  ///
  /// Defaults to [MethodChannelScreenshotSecurity].
  static ScreenshotSecurityPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ScreenshotSecurityPlatform] when
  /// they register themselves.
  static set instance(ScreenshotSecurityPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> setSecurityScreen({required bool enabled}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
