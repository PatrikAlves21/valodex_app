import 'package:app_valorant/app/app_module.dart';
import 'package:app_valorant/app/app_routes.dart';
import 'package:app_valorant/components/weapons_container_widget.dart';
import 'package:app_valorant/models/enums.dart';
import 'package:app_valorant/models/listWeapons_model.dart';
import 'package:app_valorant/styles/extension_texts.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/loadingLists_widget.dart';
import '../components/scaffold_default.dart';
import '../models/list_config_weapons.dart';
import '../models/request_default_model.dart';
import '../shared/app_colors.dart';
import '../shared/http_service.dart';

class WeaponsPage extends StatefulWidget {
  const WeaponsPage({super.key});

  @override
  State<WeaponsPage> createState() => _WeaponsPageState();
}

class _WeaponsPageState extends State<WeaponsPage> {
  HttpService get httpService => AppModule.to.getDependency<HttpService>();

  late Future<ListWeaponsModel> weapons;

  ListConfigWeapons? listConfig;

  @override
  void initState() {
    super.initState();
    weapons = getListAgents();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldDefault(
        selectedPage: SelectedPage.WEAPONSPAGE,
        body: Container(
          color: backgroundPage,
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: FutureBuilder<ListWeaponsModel>(
              future: weapons,
              builder: (BuildContext context,
                  AsyncSnapshot<ListWeaponsModel> snapshot) {
                Widget children;
                if (snapshot.hasData) {
                  children = Column(
                    children: [
                      Row(
                        children: [
                          const Text('ARSENAL')
                              .h1(style: TextStyle(color: valorantPrimary)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView(
                          children: snapshot.data!.data!
                              .map((weapon) => WeaponsContainer(weapon: weapon))
                              .toList(),
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
                              color: textColor,
                              fontSize: 14.sp,
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
        ));
  }

  Future<ListWeaponsModel> getListAgents() async {
    Response response = await httpService
        .get(AppRoutes.weapons, queryParams: {...RequestDefault.language});

    ListWeaponsModel listWeapons = ListWeaponsModel.fromJson(response.data);

    createListConfig(listWeapons);

    return listWeapons;
  }

  createListConfig(ListWeaponsModel list) {
    List<num> fireRate = [];
    List magazine = [];
    List reload = [];
    List equip = [];
    list.data?.forEach((weapons) {
      fireRate.add(weapons.weaponStats?.fireRate ?? 0);
      magazine.add(weapons.weaponStats?.magazineSize ?? 0);
      reload.add(weapons.weaponStats?.reloadTimeSeconds ?? 0);
      equip.add(weapons.weaponStats?.equipTimeSeconds ?? 0);
    });

    listConfig = ListConfigWeapons(
      fireRate: fireRate.reduce((curr, next) => curr > next ? curr : next),
      magazineSize: magazine.reduce((curr, next) => curr > next ? curr : next),
      equipSpeed: equip.reduce((curr, next) => curr > next ? curr : next),
      reloadSpeed: reload.reduce((curr, next) => curr > next ? curr : next),
    );
  }
}
