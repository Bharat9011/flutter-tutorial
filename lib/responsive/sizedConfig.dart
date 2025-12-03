import 'package:flutter/material.dart';

class Sizeconfig {
  // ignore: unused_field
  static late double ScreenWidth;
  static late double ScreenHeight;
  static late double iconSize;
  static late double titleTextsize;
  static late String fontR;
  static late String fontRLight;
  static late String fontACMS;

  static void init(BuildContext context) {
    ScreenWidth = MediaQuery.of(context).size.width;
    ScreenHeight = MediaQuery.of(context).size.height;
    iconSize = ScreenWidth * 0.07;
    fontR = "RobotoCondensed Black";
    fontRLight = "RobotoCondensed Light";
    fontACMS = "Acme";
  }
}
