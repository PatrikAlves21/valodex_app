// ignore_for_file: use_key_in_widget_constructors

import 'package:app_valorant/app/app_bloc.dart';
import 'package:app_valorant/app/app_widget.dart';
import 'package:app_valorant/shared/http_service.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => AppBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => HttpService()),
      ];

  @override
  Widget get view => const AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
