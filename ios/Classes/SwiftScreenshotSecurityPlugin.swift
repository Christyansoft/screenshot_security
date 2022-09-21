import Flutter
import UIKit

public class SwiftScreenshotSecurityPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "screenshot_security", binaryMessenger: registrar.messenger())
    let instance = SwiftScreenshotSecurityPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {

        if(call.method == "enableSecurity"){
            setEnableSecurity(enable: true)
        }
        else if(call.method == "disableSecurity"){
            setEnableSecurity(enable: false)
        }

        result("")
    }

    public func setEnableSecurity(enable: Bool){

       if let window = UIApplication.shared.windows.first{

           let tagTextField = 9227

           if let textField = window.subviews.first(where: {$0.tag == tagTextField}) as? UITextField {
               textField.isSecureTextEntry = enable
           }
           else {
               let textField = UITextField()
               textField.tag = tagTextField

               window.addSubview(textField)
               textField.isSecureTextEntry = enable
               textField.centerYAnchor.constraint(equalTo: window.centerYAnchor).isActive = true
               textField.centerXAnchor.constraint(equalTo: window.centerXAnchor).isActive = true
               window.layer.superlayer?.addSublayer(textField.layer)
               textField.layer.sublayers?.first?.addSublayer(window.layer)
           }
       }
    }
}
