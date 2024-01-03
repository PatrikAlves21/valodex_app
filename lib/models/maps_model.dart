class ReturnMapsList {
  int? status;
  List<MapsModel>? data;

  ReturnMapsList({this.status, this.data});

  ReturnMapsList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <MapsModel>[];
      json['data'].forEach((v) {
        data!.add(MapsModel.fromJson(v));
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

class MapsModel {
  String? uuid;
  String? displayName;
  String? narrativeDescription;
  String? tacticalDescription;
  String? coordinates;
  String? displayIcon;
  String? listViewIcon;
  String? splash;
  String? assetPath;
  String? mapUrl;

  MapsModel({
    this.uuid,
    this.displayName,
    this.narrativeDescription,
    this.tacticalDescription,
    this.coordinates,
    this.displayIcon,
    this.listViewIcon,
    this.splash,
    this.assetPath,
    this.mapUrl,
  });

  MapsModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    narrativeDescription = json['narrativeDescription'];
    tacticalDescription = json['tacticalDescription'];
    coordinates = json['coordinates'];
    displayIcon = json['displayIcon'];
    listViewIcon = json['listViewIcon'];
    splash = json['splash'];
    assetPath = json['assetPath'];
    mapUrl = json['mapUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['displayName'] = displayName;
    data['narrativeDescription'] = narrativeDescription;
    data['tacticalDescription'] = tacticalDescription;
    data['coordinates'] = coordinates;
    data['displayIcon'] = displayIcon;
    data['listViewIcon'] = listViewIcon;
    data['splash'] = splash;
    data['assetPath'] = assetPath;
    data['mapUrl'] = mapUrl;

    return data;
  }
}
