// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:app_valorant/models/weapons_model.dart';

class ListWeaponsModel {
  int? status;
  List<WeaponsModel>? data;

  ListWeaponsModel({this.status, this.data});

  ListWeaponsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <WeaponsModel>[];
      json['data'].forEach((v) {
        data!.add(WeaponsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WeaponStatsModel {
  num? fireRate;
  num? magazineSize;
  num? runSpeedMultiplier;
  num? equipTimeSeconds;
  num? reloadTimeSeconds;
  num? firstBulletAccuracy;
  num? shotgunPelletCount;

  WeaponStatsModel({
    this.fireRate,
    this.magazineSize,
    this.runSpeedMultiplier,
    this.equipTimeSeconds,
    this.reloadTimeSeconds,
    this.firstBulletAccuracy,
    this.shotgunPelletCount,
  });

  WeaponStatsModel.fromJson(Map<String, dynamic> json) {
    fireRate = json['fireRate'];
    magazineSize = json['magazineSize'];
    runSpeedMultiplier = json['runSpeedMultiplier'];
    equipTimeSeconds = json['equipTimeSeconds'];
    reloadTimeSeconds = json['reloadTimeSeconds'];
    firstBulletAccuracy = json['firstBulletAccuracy'];
    shotgunPelletCount = json['shotgunPelletCount'];
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

class SkinsModel {
  String? displayName;
  String? displayIcon;

  SkinsModel({this.displayName, this.displayIcon});

  SkinsModel.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    displayIcon = json['displayIcon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['displayName'] = displayName;
    data['displayIcon'] = displayIcon;
    return data;
  }
}
