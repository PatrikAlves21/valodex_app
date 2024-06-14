class DamageConfigModel {
  String? title;
  List<ValuesDamageModel>? values;

  DamageConfigModel({this.title, this.values});
}

class ValuesDamageModel {
  String? description;
  num? value;

  ValuesDamageModel({this.description, this.value});
}
