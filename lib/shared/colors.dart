import 'package:flutter/material.dart';

// App Colors Default

class AppColors {
  static const MaterialColor grey = MaterialColor(
    _greyPrimaryValue,
    <int, Color>{
      50: Color(0xFFFAFAFA),
      100: Color(0xFFF5F5F5),
      200: Color(0xFFEEEEEE),
      300: Color(0xFFE0E0E0),
      350: Color(
          0xFFD6D6D6), // only for raised button while pressed in light theme
      400: Color(0xFFBDBDBD),
      500: Color(_greyPrimaryValue),
      600: Color(0xFF757575),
      700: Color(0xFF616161),
      800: Color(0xFF333333),
      850: Color(0xFF303030), // only for background color in dark theme
      900: Color(0xFF212121),
    },
  );

  static const int _greyPrimaryValue = 0xFF9e9e9e;
}

Color backgroundPage = const Color(0xFF333333);

Color borderCard = const Color(0xFFe5e5e5);

Color borderButtonGrey = Colors.grey[300]!;

Color textColor = Colors.white;

Color textGrey = Colors.grey[600]!;

Color hintTextColor = Colors.grey[600]!;

Color redDestact = const Color(0xFFD40000);

Color redDiverge = const Color(0xFFFFDFDF);

Color green = const Color(0xFF43B428);

Color greenSave = const Color(0xFF2C9C18);

Color disable = Colors.grey[100]!;

Color colorAgendaFixa = const Color(0xFF40385b);

Color orange = const Color(0xFFE86826);

Color cargaResfriada = const Color(0xFF6794DC);

Color yellow = const Color(0xFFFFCC00);

Color blueDefault = const Color(0xFF268BFF);
