import 'package:app_valorant/models/skins_model.dart';
import 'package:app_valorant/models/stats_model.dart';

class WeaponsModel {
  String? uuid;
  String? displayName;
  String? category;
  String? displayIcon;
  String? killStreamIcon;
  WeaponStatsModel? weaponStats;
  ShopDataModel? shopData;
  List<SkinsModel>? skins;

  WeaponsModel({
    this.uuid,
    this.displayName,
    this.category,
    this.displayIcon,
    this.killStreamIcon,
    this.weaponStats,
    this.shopData,
    this.skins,
  });

  WeaponsModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    category = json['category'];
    displayIcon = json['displayIcon'];
    killStreamIcon = json['killStreamIcon'];
    weaponStats = json['weaponStats'] != null
        ? WeaponStatsModel.fromJson(json['weaponStats'])
        : null;
    shopData = json['shopData'] != null
        ? ShopDataModel.fromJson(json['shopData'])
        : null;
    if (json['skins'] != null) {
      skins = <SkinsModel>[];
      json['skins'].forEach((v) {
        skins!.add(SkinsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['displayName'] = displayName;
    data['category'] = category;
    data['displayIcon'] = displayIcon;
    data['killStreamIcon'] = killStreamIcon;
    if (weaponStats != null) {
      data['weaponStats'] = weaponStats!.toJson();
    }
    if (shopData != null) {
      data['shopData'] = shopData!.toJson();
    }
    if (skins != null) {
      data['skins'] = skins!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
