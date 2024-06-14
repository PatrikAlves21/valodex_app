import 'package:app_valorant/app/app_routes.dart';
import 'package:app_valorant/components/loadinglists_widget.dart';
import 'package:app_valorant/components/maps_container_widget.dart';
import 'package:app_valorant/components/scaffold_default.dart';
import 'package:app_valorant/models/maps_model.dart';
import 'package:app_valorant/models/enums.dart';
import 'package:app_valorant/shared/http_service.dart';
import 'package:app_valorant/styles/extension_texts.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../app/app_module.dart';
import '../models/request_default_model.dart';
import '../shared/app_colors.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  HttpService get httpService => AppModule.to.getDependency<HttpService>();
  late Future<ReturnMapsList> maps;

  @override
  void initState() {
    super.initState();
    maps = getListMaps();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldDefault(
      selectedPage: SelectedPage.MAPSPAGE,
      body: Container(
        color: backgroundPage,
        padding: const EdgeInsets.all(16),
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: FutureBuilder<ReturnMapsList>(
            future: maps,
            builder:
                (BuildContext context, AsyncSnapshot<ReturnMapsList> snapshot) {
              Widget children;
              if (snapshot.hasData) {
                children = Column(
                  children: [
                    Row(
                      children: [
                        const Text('Mapas')
                            .h1(style: TextStyle(color: valorantPrimary)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                            children: snapshot.data!.data!
                                .map(
                                  (maps) => MapsContainer(maps: maps),
                                )
                                .toList()),
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                children = Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          'Ocorreu um erro ao carregar as informações.',
                          style: TextStyle(
                            color: textColorWhite,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ]);
              } else {
                children = const LoadingListWidget();
              }
              return children;
            }),
      ),
    );
  }

  Future<ReturnMapsList> getListMaps() async {
    Response response = await httpService.get(
      AppRoutes.maps,
      queryParams: {...RequestDefault.language},
    );

    return ReturnMapsList.fromJson(response.data);
  }
}
