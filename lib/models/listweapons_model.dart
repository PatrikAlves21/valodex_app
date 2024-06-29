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
