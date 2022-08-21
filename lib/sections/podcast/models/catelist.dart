import 'package:flutter_music/sections/podcast/models/personalize.dart';
import 'package:json_annotation/json_annotation.dart';

part 'catelist.g.dart';

@JsonSerializable()
class CatelistWrap {
  CatelistWrap();

  int? code;
  List<CatelistCategoryItem>? categories;

  factory CatelistWrap.fromJson(Map<String, dynamic> json) =>
      _$CatelistWrapFromJson(json);

  toJson() => _$CatelistWrapToJson(this);
}

@JsonSerializable()
class CatelistCategoryItem {
  CatelistCategoryItem();

  int? id;
  String? name;

  factory CatelistCategoryItem.fromJson(Map<String, dynamic> json) =>
      _$CatelistCategoryItemFromJson(json);

  toJson() => _$CatelistCategoryItemToJson(this);
}

@JsonSerializable()
class CatelistRecommendWrap {
  CatelistRecommendWrap();

  int? code;
  bool? hasMore;
  List<PersonalizeItem>? djRadios;

  factory CatelistRecommendWrap.fromJson(Map<String, dynamic> json) =>
      _$CatelistRecommendWrapFromJson(json);

  toJson() => _$CatelistRecommendWrapToJson(this);
}
