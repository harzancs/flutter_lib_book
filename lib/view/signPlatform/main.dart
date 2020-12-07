import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lib_book/view/signPlatform/setLog.dart/facebookSet.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignPlatfromMain extends StatefulWidget {
  @override
  _SignPlatfromMainState createState() => _SignPlatfromMainState();
}

class _SignPlatfromMainState extends State<SignPlatfromMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RaisedButton.icon(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FacebookSet()),
                  );
                },
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
              RaisedButton.icon(
                color: Colors.white,
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.line,
                  size: 50,
                  color: Colors.green,
                ),
                label: Text(
                  'LINE',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              RaisedButton.icon(
                color: Colors.white,
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.google,
                  size: 50,
                  color: Colors.redAccent,
                ),
                label: Text(
                  'Google',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              RaisedButton.icon(
                color: Colors.white,
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.apple,
                  size: 50,
                  color: Colors.grey,
                ),
                label: Text(
                  'Apple ID  (iOS only)',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
