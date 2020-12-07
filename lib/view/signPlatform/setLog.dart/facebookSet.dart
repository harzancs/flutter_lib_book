import 'package:dart_code_viewer/dart_code_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lib_book/_system/dartCode.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FacebookSet extends StatefulWidget {
  @override
  _FacebookSetState createState() => _FacebookSetState();
}

class _FacebookSetState extends State<FacebookSet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facebook'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RaisedButton.icon(
                color: Colors.white,
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.facebook,
                  size: 50,
                  color: Colors.blue,
                ),
                label: Text(
                  'FACEBOOK',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Divider(),
              Container(
                child: ShowCodeDart(
                  code: r'''
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  bool _isLoggedIn = false;
  

  login() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        var profile = json.decode(graphResponse.body);
        print(profile);
        _isLoggedIn = true;

        break;
      case FacebookLoginStatus.cancelledByUser:
        print('close fb');
        Navigator.pop(context);
        _isLoggedIn = false;
        break;
      case FacebookLoginStatus.error:
        
        Navigator.pop(context);
        _isLoggedIn = false;
        break;
    }
  }

                  ''',
                ),
              ),
              Container(
                child: ShowCodeDart(
                  code: r'''
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  bool _isLoggedIn = false;
  

  login() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        var profile = json.decode(graphResponse.body);
        print(profile);
        _isLoggedIn = true;

        break;
      case FacebookLoginStatus.cancelledByUser:
        print('close fb');
        Navigator.pop(context);
        _isLoggedIn = false;
        break;
      case FacebookLoginStatus.error:
        
        Navigator.pop(context);
        _isLoggedIn = false;
        break;
    }
  }

                  ''',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
