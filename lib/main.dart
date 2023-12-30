import 'package:app_valorant/app/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart' as intl_local_date_data;
import 'package:intl/intl.dart';

void main() async {
  //runApp(const SplashScreemPage());

  WidgetsFlutterBinding.ensureInitialized();

  var intl = intl_local_date_data.initializeDateFormatting("pt_BR");

  Future.wait([intl]).then((_) {
    Intl.defaultLocale = 'pt_BR';
  });

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    AppModule(),
  );
}
