import 'package:app_valorant/components/gridview_skins.dart';
import 'package:app_valorant/components/weapons_stats_damage.dart';
import 'package:app_valorant/components/weapons_stats_details.dart';
import 'package:app_valorant/models/damage_model.dart';
import 'package:app_valorant/models/weapons_model.dart';
import 'package:app_valorant/styles/extension_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/list_config_weapons.dart';
import '../shared/app_colors.dart';

class DetailsWeaponsPage extends StatefulWidget {
  final dynamic arguments;
  const DetailsWeaponsPage(this.arguments, {super.key});

  @override
  State<DetailsWeaponsPage> createState() => _DetailsWeaponsPageState();
}

class _DetailsWeaponsPageState extends State<DetailsWeaponsPage> {
  late WeaponsModel weapons;
  late ListConfigWeapons config;

  List<DamageConfigModel> listData = [];

  @override
  void initState() {
    super.initState();
    weapons = widget.arguments['weapon'];
    config = widget.arguments['config'];
    createListConfig();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPage,
      body: Stack(
        children: <Widget>[
          Container(
            color: fontColorPrimary,
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
          ),
          Container(
            decoration: BoxDecoration(color: backgroundPage),
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * 0.25,
          ),
          Container(
              margin: EdgeInsets.only(
                top: MediaQuery.sizeOf(context).height * 0.08,
              ),
              height: MediaQuery.sizeOf(context).height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(3.14),
                    child: Image.network(
                      weapons.displayIcon!,
                      width: MediaQuery.sizeOf(context).width * 0.8,
                    ),
                  ),
                ],
              )),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).height * 0.2,
            ),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: fontColorPrimary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.sp),
                  topRight: Radius.circular(16.sp),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(weapons.displayName!)
                            .h1(style: TextStyle(color: valorantPrimary)),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('ESTATÍSTICAS').h2(
                          style: TextStyle(
                              color: fontColorSecondary, fontSize: 24.sp),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: WeaponsStatsDetails(
                            title: 'FIRE RATE',
                            value: weapons.weaponStats?.fireRate ?? 0,
                            description: 'RDS/SEC',
                            percentage: calculatePercentage(
                                percentage: weapons.weaponStats?.fireRate ?? 0,
                                total: config.fireRate),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: WeaponsStatsDetails(
                            title: 'EQUIP SPEED',
                            value: weapons.weaponStats?.equipTimeSeconds ?? 0,
                            description: 'M/SEC',
                            percentage: calculatePercentage(
                                percentage:
                                    weapons.weaponStats?.equipTimeSeconds ?? 0,
                                total: config.equipSpeed),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: WeaponsStatsDetails(
                            title: 'MAGAZINE',
                            value: weapons.weaponStats?.magazineSize ?? 0,
                            description: 'RDS',
                            percentage: calculatePercentage(
                                percentage:
                                    weapons.weaponStats?.magazineSize ?? 0,
                                total: config.magazineSize),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: WeaponsStatsDetails(
                            title: 'RELOAD SPEED',
                            value: weapons.weaponStats?.reloadTimeSeconds ?? 0,
                            description: 'SEC',
                            percentage: calculatePercentage(
                                percentage:
                                    weapons.weaponStats?.reloadTimeSeconds ?? 0,
                                total: config.reloadSpeed),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        const Text('DANO').h2(
                          style: TextStyle(
                              color: fontColorSecondary, fontSize: 24.sp),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      children: listData
                          .map((data) => WeaponsStatsDamage(data: data))
                          .toList(),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        const Text('SKINS').h2(
                          style: TextStyle(
                              color: fontColorSecondary, fontSize: 24.sp),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    GridViewSkinsWidget(listSkins: weapons.skins!),
                    SizedBox(
                      height: 56.sp,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 48.sp,
            left: 16.sp,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 24.sp,
                color: valorantPrimary,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }

  double calculatePercentage({required num percentage, required num total}) {
    return (percentage / total) * 100;
  }

  createListConfig() {
    listData.addAll(
      [
        DamageConfigModel(
            title: 'Cabeça',
            values: weapons.weaponStats?.damageRanges!
                .map((damage) => ValuesDamageModel(
                    description:
                        "${damage.rangeStartMeters} - ${damage.rangeEndMeters}m",
                    value: damage.headDamage))
                .toList()),
        DamageConfigModel(
            title: 'Corpo',
            values: weapons.weaponStats?.damageRanges!
                .map((damage) => ValuesDamageModel(
                    description:
                        "${damage.rangeStartMeters} - ${damage.rangeEndMeters}m",
                    value: damage.bodyDamage))
                .toList()),
        DamageConfigModel(
            title: 'Pernas',
            values: weapons.weaponStats?.damageRanges!
                .map((damage) => ValuesDamageModel(
                    description:
                        "${damage.rangeStartMeters} - ${damage.rangeEndMeters}m",
                    value: damage.legDamage))
                .toList()),
      ],
    );
  }
}
