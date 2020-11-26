import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_lib_book/view/upload_image/multiple.dart';
import 'package:flutter_lib_book/view/upload_image/single.dart';
import 'package:highlighter_coachmark/highlighter_coachmark.dart';
import 'package:image_picker/image_picker.dart';

class MainUploadImage extends StatefulWidget {
  @override
  _MainUploadImageState createState() => _MainUploadImageState();
}

class _MainUploadImageState extends State<MainUploadImage> {
  GlobalKey _buttonImage = GlobalObjectKey("button"); // used by RaisedButton
  GlobalKey _buttonImage1 = GlobalObjectKey("button1"); // used by RaisedButton

  @override
  void initState() {
    super.initState();
    _loadTutorial();
  }

  Future<void> _loadTutorial() async {
    Timer(Duration(seconds: 1), () => showButton());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RaisedButton(
            key: _buttonImage,
            color: Colors.limeAccent,
            child: Text(
              "รูปเดียว",
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ImageSingle()),
              );
            },
          ),
          RaisedButton(
            key: _buttonImage1,
            color: Colors.limeAccent,
            child: Text(
              "หลายรูป",
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MultipleImages()),
              );
            },
          )
        ],
      ),
    );
  }

  void showButton() {
    CoachMark coachMarkTile = CoachMark();
    RenderBox target = _buttonImage.currentContext.findRenderObject();

    Rect markRect = target.localToGlobal(Offset.zero) & target.size;
    markRect = markRect.inflate(5.0);

    coachMarkTile.show(
      targetContext: _buttonImage.currentContext,
      markRect: markRect,
      markShape: BoxShape.rectangle,
      children: [
        Positioned(
          top: markRect.bottom + 15.0,
          right: 5.0,
          child: Text(
            "อัพโหลดรูปเดียว",
            style: const TextStyle(
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        )
      ],
      duration: null, // this effect will only last for 5s
      onClose: () {
        showButton1();
      },
    );
  }

  void showButton1() {
    CoachMark coachMarkTile = CoachMark();
    RenderBox target = _buttonImage1.currentContext.findRenderObject();

    Rect markRect = target.localToGlobal(Offset.zero) & target.size;
    markRect = markRect.inflate(5.0);

    coachMarkTile.show(
      targetContext: _buttonImage1.currentContext,
      markRect: markRect,
      markShape: BoxShape.rectangle,
      children: [
        Positioned(
          top: markRect.bottom + 15.0,
          right: 5.0,
          child: Text(
            "อัพโหลดหลายรูป",
            style: const TextStyle(
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        )
      ],
      duration: null, // this effect will only last for 5s
    );
  }
}
