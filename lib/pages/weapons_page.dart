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
      "defaultSkinUuid": "f454efd1-49cb-372f-7096-d394df615308",
      "displayIcon":
          "https://media.valorant-api.com/weapons/63e6c2b6-4a8e-869c-3d4c-e38355226584/displayicon.png",
      "killStreamIcon":
          "https://media.valorant-api.com/weapons/63e6c2b6-4a8e-869c-3d4c-e38355226584/killstreamicon.png",
      "assetPath":
          "ShooterGame/Content/Equippables/Guns/HvyMachineGuns/HMG/HMGPrimaryAsset",
      "weaponStats": {
        "fireRate": 12,
        "magazineSize": 100,
        "runSpeedMultiplier": 0.76,
        "equipTimeSeconds": 1.25,
        "reloadTimeSeconds": 5,
        "firstBulletAccuracy": 0.8,
        "shotgunPelletCount": 1,
        "wallPenetration": "EWallPenetrationDisplayType::High",
        "feature": "EWeaponStatsFeature::ROFIncrease",
        "fireMode": null,
        "altFireType": "EWeaponAltFireDisplayType::ADS",
        "adsStats": {
          "zoomMultiplier": 1.15,
          "fireRate": 15.6,
          "runSpeedMultiplier": 0.76,
          "burstCount": 1,
          "firstBulletAccuracy": 0.79
        },
        "altShotgunStats": null,
        "airBurstStats": null,
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
      "shopData": {
        "cost": 3200,
        "category": "Heavy Weapons",
        "shopOrderPriority": 0,
        "categoryText": "Heavy Weapons",
        "gridPosition": {"row": 2, "column": 2},
        "canBeTrashed": true,
        "image": null,
        "newImage":
            "https://media.valorant-api.com/weapons/63e6c2b6-4a8e-869c-3d4c-e38355226584/shop/newimage.png",
        "newImage2": null,
        "assetPath":
            "ShooterGame/Content/Equippables/Guns/HvyMachineGuns/HMG/HeavyMachineGunPurchase"
      },
      "skins": [
        {
          "uuid": "89be9866-4807-6235-2a95-499cd23828df",
          "displayName": "Altitude Odin",
          "themeUuid": "537e0587-416c-f8f3-965c-bba3508156d7",
          "contentTierUuid": "0cebb8be-46d7-c12a-d306-e9907bfc5a25",
          "displayIcon":
              "https://media.valorant-api.com/weaponskins/89be9866-4807-6235-2a95-499cd23828df/displayicon.png",
          "wallpaper": null,
          "assetPath":
              "ShooterGame/Content/Equippables/Guns/HvyMachineGuns/HMG/Airplane/HMG_Airplane_PrimaryAsset",
          "chromas": [
            {
              "uuid": "092a25a4-422f-f577-37ac-26a5d489c155",
              "displayName": "Altitude Odin",
              "displayIcon": null,
              "fullRender":
                  "https://media.valorant-api.com/weaponskinchromas/092a25a4-422f-f577-37ac-26a5d489c155/fullrender.png",
              "swatch": null,
              "streamedVideo": null,
              "assetPath":
                  "ShooterGame/Content/Equippables/Guns/HvyMachineGuns/HMG/Airplane/Chromas/Standard/HMG_Airplane_Standard_PrimaryAsset"
            }
          ],
          "levels": [
            {
              "uuid": "578e9077-4f88-260c-e54c-b988425c60e4",
              "displayName": "Altitude Odin",
              "levelItem": null,
              "displayIcon":
                  "https://media.valorant-api.com/weaponskinlevels/578e9077-4f88-260c-e54c-b988425c60e4/displayicon.png",
              "streamedVideo": null,
              "assetPath":
                  "ShooterGame/Content/Equippables/Guns/HvyMachineGuns/HMG/Airplane/Levels/HMG_Airplane_Lv1_PrimaryAsset"
            }
          ]
        }
      ]
    }
  ]
};
