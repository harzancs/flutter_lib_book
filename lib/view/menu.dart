import 'package:flutter/material.dart';
import 'package:flutter_lib_book/view/home.dart';
import 'package:flutter_lib_book/view/load_more/main.dart';
import 'package:flutter_lib_book/view/signPlatform/main.dart';
import 'package:flutter_lib_book/view/tts/main.dart';
import 'package:flutter_lib_book/view/tutorialScreen/main.dart';
import 'package:flutter_lib_book/view/upload_file/main_screen.dart';
import 'package:flutter_lib_book/view/upload_image/main_screen.dart';

class Menu {
  final drawerItems = [
    DrawerItem("หน้าแรก", Icon(Icons.home)),
    DrawerItem("อัพโหลดไฟล์", Icon(Icons.file_upload)),
    DrawerItem("อัพโหลดรูปภาพ", Icon(Icons.image)),
    DrawerItem("Text To Speech", Icon(Icons.text_format)),
    DrawerItem("Load More", Icon(Icons.download_sharp)),
    DrawerItem("แนะนำการใช้งาน", Icon(Icons.cast_for_education)),
    DrawerItem("Sign In Social", Icon(Icons.style)),
  ];
  getDrawerItemWidget(int pos) {
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
      case 3:
        return TextToSpeech();
        break;
      case 4:
        return LoadMorePage();
        break;
      case 5:
        return TutorialMain();
        break;
      case 6:
        return SignPlatfromMain();
        break;
      default:
        return FirstScreen();
    }
  }
}
