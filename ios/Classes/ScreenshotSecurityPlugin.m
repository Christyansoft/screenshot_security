#import "ScreenshotSecurityPlugin.h"
#if __has_include(<screenshot_security/screenshot_security-Swift.h>)
#import <screenshot_security/screenshot_security-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "screenshot_security-Swift.h"
#endif

@implementation ScreenshotSecurityPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftScreenshotSecurityPlugin registerWithRegistrar:registrar];
}
@end
