import 'package:flutter/material.dart';
import 'package:flutter_lib_book/view/upload_file/main_screen.dart';
import 'package:flutter_lib_book/view/upload_image/main_screen.dart';

class HomeScrern extends StatefulWidget {
  @override
  _HomeScrernState createState() => _HomeScrernState();
}

class DrawerItem {
  String title;
  AssetImage icon;
  DrawerItem(this.title, this.icon);
}

class _HomeScrernState extends State<HomeScrern> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedDrawerIndex = 0;

  final drawerItems = [
    DrawerItem("อัพโหลดไฟล์", null),
  ];
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return MainUploadFile();
        break;
      case 1:
        return MainUploadImage();
        break;
      default:
        return FirstScreen();
    }
  }

  _onClickMenu(index) {
    setState(() => _selectedDrawerIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        //
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(drawerItems[_selectedDrawerIndex].title),
        ),
        body: Scaffold(
          key: _scaffoldKey,
          body: _getDrawerItemWidget(_selectedDrawerIndex),
        ),
        drawer: Drawer(
          child: ListView.builder(
              itemCount: drawerItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(drawerItems[index].title),
                    onTap: () {
                      _onClickMenu(index);
                    });
              }),
        ),
      ),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [Text('data')],
      ),
    );
  }
}
