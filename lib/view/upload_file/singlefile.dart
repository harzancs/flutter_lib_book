import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SingleFile extends StatefulWidget {
  @override
  _SingleFileState createState() => _SingleFileState();
}

class _SingleFileState extends State<SingleFile> {
  String _directoryPath;
  bool _loadingPath = false;
  bool _multiPick = false;
  String _extension;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _fileName = '...';
  List<PlatformFile> _paths;

  _singleFile() async {
    setState(() => _loadingPath = true);
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles()).files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      _fileName = _paths != null ? _paths.map((e) => e.name).toString() : '...';
    });
  }

  void _clearCachedFiles() {
    FilePicker.platform.clearTemporaryFiles().then((result) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ไฟล์เดียว'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              RaisedButton(
                onPressed: () {
                  _clearCachedFiles();
                  _singleFile();
                },
                child: Container(
                  child: Row(children: [
                    FaIcon(FontAwesomeIcons.file),
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
