import 'package:flutter_music/models/common_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class VideoCategoryWrap extends CommonModel<List<VideoCategoryItem>> {
  VideoCategoryWrap();

  factory VideoCategoryWrap.fromJson(Map<String, dynamic> json) =>
      _$VideoCategoryWrapFromJson(json);

  toJson() => _$VideoCategoryWrapToJson(this);
}

@JsonSerializable()
class VideoCategoryItem {
  VideoCategoryItem();

  int? id;
  String? name;
  String? relatedVideoType;
  bool? selectTab;

  factory VideoCategoryItem.fromJson(Map<String, dynamic> json) =>
      _$VideoCategoryItemFromJson(json);

  toJson() => _$VideoCategoryItemToJson(this);
}
