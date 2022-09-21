
import 'screenshot_security_platform_interface.dart';

class ScreenshotSecurity {
  Future<void> setSecurityScreen({required bool enabled}) {
    return ScreenshotSecurityPlatform.instance.setSecurityScreen(enabled: enabled);
  }
}
