import 'package:flutter/services.dart';
import 'package:flutter_lib_book/_system/url.dart';
import 'package:get_version/get_version.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'dart:io' show Platform;

void setTargetPlatformForDesktop() {
  TargetPlatform targetPlatform;
  if (Platform.isMacOS) {
    targetPlatform = TargetPlatform.iOS;
  } else if (Platform.isLinux || Platform.isWindows) {
    targetPlatform = TargetPlatform.android;
  }
  if (targetPlatform != null) {
    debugDefaultTargetPlatformOverride = targetPlatform;
  }
}

class InfoOfApp extends StatefulWidget {
  @override
  _InfoOfAppState createState() => _InfoOfAppState();
}

class _InfoOfAppState extends State<InfoOfApp> {
  String _platformVersion = 'Unknown';
  String _projectVersion = '';
  String _projectCode = '';
  String _projectAppID = '';
  String _projectName = '';

  TextStyle _txt = TextStyle(fontSize: 12, color: Color(0xFF7A7A7A));
  TextStyle _txtLink = TextStyle(fontSize: 12, color: Color(0xFF097CFF));

  initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await GetVersion.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    String projectVersion;
    try {
      projectVersion = await GetVersion.projectVersion;
    } on PlatformException {
      projectVersion = 'Failed to get project version.';
    }

    String projectCode;
    try {
      projectCode = await GetVersion.projectCode;
    } on PlatformException {
      projectCode = 'Failed to get build number.';
    }

    String projectAppID;
    try {
      projectAppID = await GetVersion.appID;
    } on PlatformException {
      projectAppID = 'Failed to get app ID.';
    }

    String projectName;
    try {
      projectName = await GetVersion.appName;
    } on PlatformException {
      projectName = 'Failed to get app name.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _projectVersion = projectVersion;
      _projectCode = projectCode;
      _projectAppID = projectAppID;
      _projectName = projectName;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image(
          //   image: AssetImage('assets/images/powered/powered.png'),
          //   width: 60,
          //   height: 60,
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Version ' + _projectVersion + ' On ' + _platformVersion,
                style: _txt,
              ),
              Row(
                children: [
                  Text(
                    'Powered by ',
                    style: _txt,
                  ),
                  InkWell(
                    onTap: () {
                      Url().launchInBrowser('https://www.cityvariety.co.th/');
                    },
                    child: Text(
                      'CityVariety Co.,Ltd,',
                      style: _txtLink,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
