import 'dart:io';

import 'package:app_valorant/app/app_bloc.dart';
import 'package:app_valorant/app/app_module.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class HttpService extends Disposable {
  static String api = 'https://valorant-api.com/v1/';

  AppBloc get appBloc => AppModule.to.getBloc();

  Dio? _dio;

  static Dio dioGet(Dio? convertDio) {
    if (convertDio == null) {
      convertDio = Dio();

      (convertDio.httpClientAdapter as IOHttpClientAdapter).createHttpClient =
          () {
        final HttpClient client =
            HttpClient(context: SecurityContext(withTrustedRoots: false));
        client.badCertificateCallback = (
          X509Certificate cert,
          String host,
          int port,
        ) {
          return true;
        };
        return client;
      };
    }

    return convertDio;
  }

  String getApi() {
    return api;
  }

  Options getOptions() {
    return Options(
      contentType: "application/json",
    );
  }

  Future post(String route, {required dynamic data}) async {
    Response response;
    var dio = dioGet(_dio);
    try {
      var options = getOptions();

      response = await dio.post("$api$route", data: data, options: options);
    } on DioException catch (exception) {
      return exception;
    }
    return response;
  }

  Future get(
    String route, {
    Map<String, dynamic>? queryParams,
  }) async {
    var dio = dioGet(_dio);
    try {
      var options = getOptions();

      return await dio.get("$api$route",
          queryParameters: queryParams, options: options);
    } on DioException catch (exception) {
      return exception;
    }
  }

  @override
  void dispose() {}
}
