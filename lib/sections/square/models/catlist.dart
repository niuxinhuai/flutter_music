import 'package:flutter_music/constants/key.dart';
import 'package:json_annotation/json_annotation.dart';

part 'catlist.g.dart';

///歌单分类下的内容
@JsonSerializable()
class CatlistWrap {
  CatlistWrap();

  CatlistAll? all;
  int? code;
  Map<String, String>? categories;
  List<CatlistSubItem>? sub;

  factory CatlistWrap.fromJson(Map<String, dynamic> json) =>
      _$CatlistWrapFromJson(json);

  toJson() => _$CatlistWrapToJson(this);
}

@JsonSerializable()
class CatlistAll {
  CatlistAll();

  String? name;
  int? resourceCount;
  int? type;
  int? category;
  int? resourceType;
  bool? hot;
  bool? activity;

  factory CatlistAll.fromJson(Map<String, dynamic> json) =>
      _$CatlistAllFromJson(json);

  toJson() => _$CatlistAllToJson(this);
}

@JsonSerializable()
class CatlistSubItem {
  CatlistSubItem();

  String? name;
  int? resourceCount;
  int? imgId;
  String? imgUrl;
  int? type;
  int? category;
  int? resourceType;
  bool? hot;
  bool? activity;

  @JsonKey(defaultValue: true)
  bool? canMove;

  @JsonKey(defaultValue: false)
  bool? inTop;

  factory CatlistSubItem.fromJson(Map<String, dynamic> json) =>
      _$CatlistSubItemFromJson(json);

  toJson() => _$CatlistSubItemToJson(this);
}

class CatlistSectionModel {
  CatlistSectionModel();

  String? value;
  String? key;
  String? sub;

  bool canEdit = false;
  bool editing = false;

  bool isUser() => key == ConstantsKey.squareKey;

  List<CatlistSubItem>? items;
}
