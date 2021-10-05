import Cocoa
import FlutterMacOS
import GoogleMaps

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
  GMSServices.provideAPIKey("AIzaSyBecnAONB7omX7O7ghHwrvab_C0ZGI5oZU")
    return true
  }
}
