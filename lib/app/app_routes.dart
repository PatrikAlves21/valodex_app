import 'package:app_valorant/pages/details_maps_page.dart';
import 'package:app_valorant/pages/home_page.dart';
import 'package:app_valorant/pages/maps_page.dart';
import 'package:flutter/material.dart';
import '../pages/details_agents_page.dart';

class AppRoutes {
  static final routes = <String, WidgetBuilder>{
    '/Home': (BuildContext context) => const HomePage(),
    '/maps': (BuildContext context) => const MapsPage(),
    '/detailsAgents': (BuildContext context) =>
        AgentDetailsPage(ModalRoute.of(context)!.settings.arguments),
    '/detailsMaps': (BuildContext context) =>
        DetailsMapsPage(ModalRoute.of(context)!.settings.arguments),
  };

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static String agents = 'agents';
  static String maps = 'maps';
}
