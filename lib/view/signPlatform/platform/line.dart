import 'package:flutter/services.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';

class SignLine {
  lineSDKInit() async {
    await LineSDK.instance.setup("1655235451").then((_) {
      print("LineSDK is Prepared");
    });
  }

  Future<Map<String, dynamic>> startLineLogin() async {
    try {
      final result = await LineSDK.instance.login(scopes: ["profile"]);
      var list = result.userProfile.data;
      return list;
    } on PlatformException catch (e) {
      print(e);
      return {'status': 'failed'};
    }
  }
}
