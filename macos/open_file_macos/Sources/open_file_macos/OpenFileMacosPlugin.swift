import Cocoa
import FlutterMacOS

public class OpenFileMacosPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "open_file_macos", binaryMessenger: registrar.messenger)
    let instance = OpenFileMacosPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard let args = call.arguments as? [String: Any] else {
      result(FlutterError(code: "InvalidArgsType", message: "Invalid args type", details: nil))
      return
    }

    switch call.method {
    case "open":
      // Arguments are enforced on dart side.
      let file = args["file"] as! String
      let viewInFinder = args["viewInFinder"] as? Bool ?? false
      let isFileURL = args["isFileURL"] as? Bool ?? false
      
      var url: URL?
      if isFileURL {
        url = URL(string: file)
      } else {
        url = URL(fileURLWithPath: file)
      }
      
      guard let url = url else {
        result(FlutterError(code: "InvalidFileURL", message: "Invalid file URL", details: nil))
        return
      }

      if viewInFinder {
        NSWorkspace.shared.activateFileViewerSelecting([url])
      } else {
        NSWorkspace.shared.open(url)
      }
      result(nil)

    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
