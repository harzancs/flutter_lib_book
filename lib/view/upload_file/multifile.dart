import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MultiFilePage extends StatefulWidget {
  @override
  _MultiFilePageState createState() => _MultiFilePageState();
}

class _MultiFilePageState extends State<MultiFilePage> {
  String _directoryPath;
  bool _loadingPath = false;
  bool _multiPick = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _fileName = '...';
  List<PlatformFile> _paths;

  _multiFile() async {
    setState(() => _loadingPath = true);
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(allowMultiple: true)).files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      _fileName =
          _fileName != null ? _paths.map((e) => e.name).toString() : '...';
    });
  }

  void _clearCachedFiles() {
    FilePicker.platform.clearTemporaryFiles().then((result) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('หลายไฟล์'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              RaisedButton(
                onPressed: () {
                  _clearCachedFiles();
                  _multiFile();
                },
                child: Container(
                  child: Row(children: [
                    FaIcon(FontAwesomeIcons.file),
                    // Icon(Icons.ac_unit),
                    Text('เลือกไฟล์')
                  ]),
                ),
              ),
              Text('PATH : ' + _fileName)
            ],
          ),
        ),
      ),
    );
  }
}
