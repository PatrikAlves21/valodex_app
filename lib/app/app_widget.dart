import 'package:app_valorant/app/app_bloc.dart';
import 'package:app_valorant/app/app_module.dart';
import 'package:app_valorant/app/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shared/material_colors.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  AppBloc get appBloc => AppModule.to.getBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        ScreenUtil.init(
          context,
          designSize: const Size(360, 800),
        );
        var keyboardVisibilityController = KeyboardVisibilityController();

        keyboardVisibilityController.onChange.listen((bool visible) {
          appBloc.setKeyboardVisibility(visible);
        });

        return MaterialApp(
          title: 'Valodex',
          navigatorKey: AppRoutes.navigatorKey,
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.black,
            primarySwatch: AppMaterialColor.valorantAppColors,
            canvasColor: Colors.transparent,
            textTheme: Theme.of(context).textTheme.apply(
                  fontFamily: 'Karantina',
                ),
          ),
          initialRoute: "/Home",
          routes: AppRoutes.routes,
          debugShowCheckedModeBanner: false,
          navigatorObservers: const [],
        );
      },
    );
  }
}
