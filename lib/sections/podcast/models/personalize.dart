import 'package:flutter_music/models/common_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'personalize.g.dart';

@JsonSerializable()
class PersonalizeWrap extends CommonModel<List<PersonalizeItem>> {
  PersonalizeWrap();

  factory PersonalizeWrap.fromJson(Map<String, dynamic> json) =>
      _$PersonalizeWrapFromJson(json);

  toJson() => _$PersonalizeWrapToJson(this);
}

@JsonSerializable()
class PersonalizeItem {
  PersonalizeItem();

  int? id;
  String? name;
  String? desc;
  String? picUrl;
  int? subCount;
  int? programCount;
  int? categoryId;
  String? category;
  int? secondCategoryId;
  String? secondCategory;
  PersonalizeDJ? dj;

  factory PersonalizeItem.fromJson(Map<String, dynamic> json) =>
      _$PersonalizeItemFromJson(json);

  toJson() => _$PersonalizeItemToJson(this);
}

@JsonSerializable()
class PersonalizeDJ {
  PersonalizeDJ();

  int? userId;
  int? userType;
  String? avatarUrl;
  String? nickname;
  String? backgroundUrl;

  factory PersonalizeDJ.fromJson(Map<String, dynamic> json) =>
      _$PersonalizeDJFromJson(json);

  toJson() => _$PersonalizeDJToJson(this);
}
