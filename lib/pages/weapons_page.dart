import 'package:app_valorant/app/app_module.dart';
import 'package:flutter/material.dart';

import '../shared/http_service.dart';

class WeaponsPage extends StatefulWidget {
  const WeaponsPage({super.key});

  @override
  State<WeaponsPage> createState() => _WeaponsPageState();
}

class _WeaponsPageState extends State<WeaponsPage> {
  HttpService get httpService => AppModule.to.getDependency<HttpService>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

var data = {
  "status": 200,
  "data": [
    {
      "uuid": "63e6c2b6-4a8e-869c-3d4c-e38355226584",
      "displayName": "Odin",
      "category": "EEquippableCategory::Heavy",
      "displayIcon":
          "https://media.valorant-api.com/weapons/63e6c2b6-4a8e-869c-3d4c-e38355226584/displayicon.png",
      "killStreamIcon":
          "https://media.valorant-api.com/weapons/63e6c2b6-4a8e-869c-3d4c-e38355226584/killstreamicon.png",
      "weaponStats": {
        "fireRate": 12,
        "magazineSize": 100,
        "runSpeedMultiplier": 0.76,
        "equipTimeSeconds": 1.25,
        "reloadTimeSeconds": 5,
        "firstBulletAccuracy": 0.8,
        "shotgunPelletCount": 1,
        "adsStats": {
          "zoomMultiplier": 1.15,
          "fireRate": 15.6,
          "runSpeedMultiplier": 0.76,
          "burstCount": 1,
          "firstBulletAccuracy": 0.79
        },
        "damageRanges": [
          {
            "rangeStartMeters": 0,
            "rangeEndMeters": 30,
            "headDamage": 95,
            "bodyDamage": 38,
            "legDamage": 32.3
          },
          {
            "rangeStartMeters": 30,
            "rangeEndMeters": 50,
            "headDamage": 77.5,
            "bodyDamage": 31,
            "legDamage": 26.35
          }
        ]
      },
      "shopData": {"cost": 3200, "category": "Heavy Weapons"},
      "skins": [
        {
          "displayName": "Altitude Odin",
          "displayIcon":
              "https://media.valorant-api.com/weaponskins/89be9866-4807-6235-2a95-499cd23828df/displayicon.png",
        }
      ]
    }
  ]
};
