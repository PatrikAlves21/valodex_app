import 'package:flutter/material.dart';

class AppMaterialColor {
  static const MaterialColor valorantAppColors = MaterialColor(
    _primaryColor,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xff6f757b),
      300: Color(0xff3f474f),
      400: Color(0xff273039),
      500: Color(_primaryColor),
      600: Color(0xff0d161f),
      700: Color(0xff0c141c),
      800: Color(0xFF111111),
      900: Color(0xFF000000)
    },
  );

  static const int _primaryColor = 0xFF0F1923;
}
