import 'package:flutter/material.dart';
import 'package:flutter_lib_book/view/upload_file/main_screen.dart';
import 'package:flutter_lib_book/view/upload_image/main_screen.dart';

class HomeScrern extends StatefulWidget {
  @override
  _HomeScrernState createState() => _HomeScrernState();
}

class DrawerItem {
  String title;
  Icon icon;
  DrawerItem(this.title, this.icon);
}

class _HomeScrernState extends State<HomeScrern> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedDrawerIndex = 0;

  final drawerItems = [
    DrawerItem("หน้าแรก", Icon(Icons.home)),
    DrawerItem("อัพโหลดไฟล์", Icon(Icons.file_upload)),
    DrawerItem("อัพโหลดรูปภาพ", Icon(Icons.image)),
  ];
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return FirstScreen();
        break;
      case 1:
        return MainUploadFile();
        break;
      case 2:
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
                return GestureDetector(
                  onTap: () {
                    _onClickMenu(index);
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Row(
                      children: [
                        drawerItems[index].icon != null
                            ? drawerItems[index].icon
                            : null,
                        SizedBox(
                          width: 5,
                        ),
                        Text(drawerItems[index].title),
                      ],
                    ),
                  ),
                );
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
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [Text('data')],
      ),
    );
  }
}
