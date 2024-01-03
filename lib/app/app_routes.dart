import 'package:app_valorant/pages/home_page.dart';
import 'package:app_valorant/pages/maps_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static final routes = <String, WidgetBuilder>{
    '/Home': (BuildContext context) => const HomePage(),
    '/maps': (BuildContext context) => const MapsPage(),
  };

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static String agents = 'agents';
  static String maps = 'maps';
}
