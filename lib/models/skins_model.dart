class SkinsModel {
  String? displayName;
  String? displayIcon;
  List<ChromasModel>? chromas;
  List<LevelsModel>? levels;

  SkinsModel({this.displayName, this.displayIcon, this.chromas, this.levels});

  SkinsModel.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    displayIcon = json['displayIcon'];
    if (json['chromas'] != null) {
      chromas = <ChromasModel>[];
      json['chromas'].forEach((v) {
        chromas!.add(ChromasModel.fromJson(v));
      });
    }
    if (json['levels'] != null) {
      levels = <LevelsModel>[];
      json['levels'].forEach((v) {
        levels!.add(LevelsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['displayName'] = displayName;
    data['displayIcon'] = displayIcon;
    if (chromas != null) {
      data['chromas'] = chromas!.map((v) => v.toJson()).toList();
    }
    if (levels != null) {
      data['levels'] = levels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChromasModel {
  String? displayName;
  String? displayIcon;
  String? swatch;
  String? streamedVideo;

  ChromasModel(
      {this.displayName, this.displayIcon, this.swatch, this.streamedVideo});

  ChromasModel.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    displayIcon = json['displayIcon'];
    swatch = json['swatch'];
    streamedVideo = json['streamedVideo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['displayName'] = displayName;
    data['displayIcon'] = displayIcon;
    data['swatch'] = swatch;
    data['streamedVideo'] = streamedVideo;
    return data;
  }
}

class LevelsModel {
  String? displayName;
  String? displayIcon;
  String? streamedVideo;

  LevelsModel({this.displayName, this.displayIcon, this.streamedVideo});

  LevelsModel.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    displayIcon = json['displayIcon'];
    streamedVideo = json['streamedVideo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['displayName'] = displayName;
    data['displayIcon'] = displayIcon;
    data['streamedVideo'] = streamedVideo;
    return data;
  }
}

class DamageRanges {
  int? rangeStartMeters;
  int? rangeEndMeters;
  num? headDamage;
  num? bodyDamage;
  num? legDamage;

  DamageRanges(
      {this.rangeStartMeters,
      this.rangeEndMeters,
      this.headDamage,
      this.bodyDamage,
      this.legDamage});

  DamageRanges.fromJson(Map<String, dynamic> json) {
    rangeStartMeters = json['rangeStartMeters'];
    rangeEndMeters = json['rangeEndMeters'];
    headDamage = json['headDamage'];
    bodyDamage = json['bodyDamage'];
    legDamage = json['legDamage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['headDamage'] = headDamage;
    data['bodyDamage'] = bodyDamage;
    data['legDamage'] = legDamage;
    return data;
  }
}
