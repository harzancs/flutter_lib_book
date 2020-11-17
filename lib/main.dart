import 'package:flutter/material.dart';
import 'package:flutter_lib_book/view/home.dart';

const EVENTS_KEY = "fetch_events";

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false, home: HomeScrern());
  }
}
