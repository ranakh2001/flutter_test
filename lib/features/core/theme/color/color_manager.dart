import 'package:flutter/material.dart';

class ColorManager {
  //singelton color manager class
  static ColorManager instance = ColorManager._internal();
  ColorManager._internal();
  //light theme colors
  final Color primaryColor = const Color(0xff000000);
  final Color secondaryColor = const Color(0xffB9B9B9);
  final Color backgroundColor = const Color(0xffFFFFFF);
  final Color transparent = const Color(0x00000000);
  final Color redError = const Color(0xffFF0000);
}
