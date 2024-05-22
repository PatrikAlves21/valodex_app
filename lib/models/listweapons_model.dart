// ignore_for_file: file_names, prefer_typing_uninitialized_variables

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

class WeaponsModel {
  String? uuid;
  String? displayName;
  String? category;
  String? displayIcon;
  String? killStreamIcon;
  WeaponStatsModel? weaponStats;
  ShopDataModel? shopData;
  List<SkinsModel>? skins;

  WeaponsModel(
      {this.uuid,
      this.displayName,
      this.category,
      this.displayIcon,
      this.killStreamIcon,
      this.weaponStats,
      this.shopData,
      this.skins});

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

class WeaponStatsModel {
  var fireRate;
  var magazineSize;
  var runSpeedMultiplier;
  var equipTimeSeconds;
  var reloadTimeSeconds;
  var firstBulletAccuracy;
  var shotgunPelletCount;
  AdsStatsModel? adsStats;
  List<DamageRangesModel>? damageRanges;

  WeaponStatsModel(
      {this.fireRate,
      this.magazineSize,
      this.runSpeedMultiplier,
      this.equipTimeSeconds,
      this.reloadTimeSeconds,
      this.firstBulletAccuracy,
      this.shotgunPelletCount,
      this.adsStats,
      this.damageRanges});

  WeaponStatsModel.fromJson(Map<String, dynamic> json) {
    fireRate = json['fireRate'];
    magazineSize = json['magazineSize'];
    runSpeedMultiplier = json['runSpeedMultiplier'];
    equipTimeSeconds = json['equipTimeSeconds'];
    reloadTimeSeconds = json['reloadTimeSeconds'];
    firstBulletAccuracy = json['firstBulletAccuracy'];
    shotgunPelletCount = json['shotgunPelletCount'];
    adsStats = json['adsStats'] != null
        ? AdsStatsModel.fromJson(json['adsStats'])
        : null;
    if (json['damageRanges'] != null) {
      damageRanges = <DamageRangesModel>[];
      json['damageRanges'].forEach((v) {
        damageRanges!.add(DamageRangesModel.fromJson(v));
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
    if (adsStats != null) {
      data['adsStats'] = adsStats!.toJson();
    }
    if (damageRanges != null) {
      data['damageRanges'] = damageRanges!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AdsStatsModel {
  var zoomMultiplier;
  var fireRate;
  var runSpeedMultiplier;
  var burstCount;
  var firstBulletAccuracy;

  AdsStatsModel(
      {this.zoomMultiplier,
      this.fireRate,
      this.runSpeedMultiplier,
      this.burstCount,
      this.firstBulletAccuracy});

  AdsStatsModel.fromJson(Map<String, dynamic> json) {
    zoomMultiplier = json['zoomMultiplier'];
    fireRate = json['fireRate'];
    runSpeedMultiplier = json['runSpeedMultiplier'];
    burstCount = json['burstCount'];
    firstBulletAccuracy = json['firstBulletAccuracy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['zoomMultiplier'] = zoomMultiplier;
    data['fireRate'] = fireRate;
    data['runSpeedMultiplier'] = runSpeedMultiplier;
    data['burstCount'] = burstCount;
    data['firstBulletAccuracy'] = firstBulletAccuracy;
    return data;
  }
}

class DamageRangesModel {
  var rangeStartMeters;
  var rangeEndMeters;
  var headDamage;
  var bodyDamage;
  var legDamage;

  DamageRangesModel(
      {this.rangeStartMeters,
      this.rangeEndMeters,
      this.headDamage,
      this.bodyDamage,
      this.legDamage});

  DamageRangesModel.fromJson(Map<String, dynamic> json) {
    rangeStartMeters = json['rangeStartMeters'];
    rangeEndMeters = json['rangeEndMeters'];
    headDamage = json['headDamage'];
    bodyDamage = json['bodyDamage'];
    legDamage = json['legDamage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rangeStartMeters'] = rangeStartMeters;
    data['rangeEndMeters'] = rangeEndMeters;
    data['headDamage'] = headDamage;
    data['bodyDamage'] = bodyDamage;
    data['legDamage'] = legDamage;
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
