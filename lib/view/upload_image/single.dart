import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSingle extends StatefulWidget {
  @override
  _ImageSingleState createState() => _ImageSingleState();
}

class _ImageSingleState extends State<ImageSingle> {
  File _image = null;
  @override
  void initState() {
    super.initState();
  }

  // void open_camera() async {
  //   var image = await ImagePicker.pickImage(source: ImageSource.camera);
  //   setState(() {
  //     _image = image;
  //   });
  // }

  void open_gallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('รูปเดียว'),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              _image == null ? Text("Still waiting!") : Image.file(_image),
              Text(_image == null ? "" : _image.toString()),
              // FlatButton(
              //   color: Colors.deepOrangeAccent,
              //   child: Text(
              //     "Open Camera",
              //     style: TextStyle(color: Colors.white),
              //   ),
              //   onPressed: () {
              //     open_camera();
              //   },
              // ),
              FlatButton(
                color: Colors.limeAccent,
                child: Text(
                  "Open Gallery",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  open_gallery();
                },
              )
            ],
          ),
        ));
  }
}
