import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_lib_book/view/upload_image/mutiple.dart';
import 'package:flutter_lib_book/view/upload_image/single.dart';
import 'package:image_picker/image_picker.dart';

class MainUploadImage extends StatefulWidget {
  @override
  _MainUploadImageState createState() => _MainUploadImageState();
}

class _MainUploadImageState extends State<MainUploadImage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          RaisedButton(
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
            color: Colors.limeAccent,
            child: Text(
              "หลายรุป",
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
}
