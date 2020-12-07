import 'dart:convert';

import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;

class SignFacebook {
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  bool _isLoggedIn = false;
  Map profile;

  Future<Map<String, dynamic>> login() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(["email"]);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        var profile = jsonDecode(graphResponse.body);
        _isLoggedIn = true;
        return profile;
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('Login cancelled by the user.');
        _isLoggedIn = false;
        break;
      case FacebookLoginStatus.error:
        print('Something went wrong with the login process.\n');
        print('Here\'s the error Facebook gave us: ${result.errorMessage}');
        _isLoggedIn = false;
        break;
    }
    return {'status': 'failed'};
  }

  logOut() async {
    await facebookSignIn.logOut();
    print('Logged out.');
  }
}
