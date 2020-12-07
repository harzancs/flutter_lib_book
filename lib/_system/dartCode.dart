import 'package:dart_code_viewer/dart_code_viewer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowCodeDart extends StatelessWidget {
  String code;
  ShowCodeDart({Key key, @required this.code}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DartCodeViewerTheme(
      data: DartCodeViewerThemeData(
        backgroundColor: Colors.white,
        copyButtonText: Text(
          'Copiar',
          style: TextStyle(color: Colors.black),
        ),
        showCopyButton: true,
      ),
      child: DartCodeViewer.textColor(
        code,
        showCopyButton: true,
        textStyle: GoogleFonts.lato(),
        commentColor: Colors.grey,
        baseColor: Colors.blue,
        constantColor: Colors.black,
        classColor: Colors.black,
        stringColor: Colors.amber[800],
        punctuationColor: Colors.black,
        keywordColor: Colors.blueGrey[600],
        numberColor: Colors.purple,
      ),
    );
  }
}
