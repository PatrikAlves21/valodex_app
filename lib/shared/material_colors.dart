import 'package:flutter/material.dart';

class AppMaterialColor {
  static const MaterialColor valorantAppColors = MaterialColor(
    _primaryColor,
    <int, Color>{
      100: Color(0xFFFFFFFF),
      300: Color(0xFF292929),
      500: Color(_primaryColor),
      800: Color(0xFF111111),
    },
  );

  static const int _primaryColor = 0xFF0F1923;
}
