import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_lib_book/view/menu.dart';
import 'package:highlighter_coachmark/highlighter_coachmark.dart';

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

  _onClickMenu(index) {
    setState(() => _selectedDrawerIndex = index);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        //
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(Menu().drawerItems[_selectedDrawerIndex].title),
        ),
        body: Scaffold(
          key: _scaffoldKey,
          body: Menu().getDrawerItemWidget(_selectedDrawerIndex),
        ),
        drawer: Drawer(
          child: ListView.builder(
              itemCount: Menu().drawerItems.length,
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
                        Menu().drawerItems[index].icon != null
                            ? Menu().drawerItems[index].icon
                            : null,
                        SizedBox(
                          width: 5,
                        ),
                        Text(Menu().drawerItems[index].title)
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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
