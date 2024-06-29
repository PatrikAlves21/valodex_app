import 'package:app_valorant/models/skins_model.dart';

class WeaponStatsModel {
  num? fireRate;
  num? magazineSize;
  num? runSpeedMultiplier;
  num? equipTimeSeconds;
  num? reloadTimeSeconds;
  num? firstBulletAccuracy;
  num? shotgunPelletCount;
  List<DamageRanges>? damageRanges;

  WeaponStatsModel(
      {this.fireRate,
      this.magazineSize,
      this.runSpeedMultiplier,
      this.equipTimeSeconds,
      this.reloadTimeSeconds,
      this.firstBulletAccuracy,
      this.shotgunPelletCount,
      this.damageRanges});

  WeaponStatsModel.fromJson(Map<String, dynamic> json) {
    fireRate = json['fireRate'];
    magazineSize = json['magazineSize'];
    runSpeedMultiplier = json['runSpeedMultiplier'];
    equipTimeSeconds = json['equipTimeSeconds'];
    reloadTimeSeconds = json['reloadTimeSeconds'];
    firstBulletAccuracy = json['firstBulletAccuracy'];
    shotgunPelletCount = json['shotgunPelletCount'];
    if (json['damageRanges'] != null) {
      damageRanges = <DamageRanges>[];
      json['damageRanges'].forEach((v) {
        damageRanges!.add(DamageRanges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fireRate'] = fireRate;
    data['magazineSize'] = magazineSize;
    data['runSpeedMultiplier'] = runSpeedMultiplier;
    data['equipTimeSeconds'] = equipTimeSeconds;
    data['reloadTimeSeconds'] = reloadTimeSeconds;
    data['firstBulletAccuracy'] = firstBulletAccuracy;
    data['shotgunPelletCount'] = shotgunPelletCount;

    return data;
  }
}

class ShopDataModel {
  var cost;
  String? category;

  ShopDataModel({this.cost, this.category});

  ShopDataModel.fromJson(Map<String, dynamic> json) {
    cost = json['cost'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cost'] = cost;
    data['category'] = category;
    return data;
  }
}
