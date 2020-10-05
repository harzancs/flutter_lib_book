import 'package:url_launcher/url_launcher.dart';

class Url {
  Future<void> launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  // iOS
  // pubspac > url_launcher: ^5.5.0
  // กำหนด Browser ใน ios/Runner/info.plist
  // <dict>
  // .....
  // <key>LSApplicationQueriesSchemes</key>
  // <array>
  // 		<string>youtube</string>
  // 		<string>safari</string>
  // 		<string>chrome</string>
  // </array>
  //   .....
  // </dict>

  // -------------

  Url() : super();
}
