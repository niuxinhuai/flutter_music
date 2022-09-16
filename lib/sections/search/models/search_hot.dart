import 'package:flutter_music/models/common_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'search_hot.g.dart';

@JsonSerializable()
class SearchHotWrap extends CommonModel<List<SearchHotDataItem>> {
  SearchHotWrap();

  factory SearchHotWrap.fromJson(Map<String, dynamic> json) =>
      _$SearchHotWrapFromJson(json);

  toJson() => _$SearchHotWrapToJson(this);
}

@JsonSerializable()
class SearchHotDataItem {
  SearchHotDataItem();

  String? searchWord;
  String? content;
  int? score;
  String? iconUrl;
  int? source;
  int? iconType;

  factory SearchHotDataItem.fromJson(Map<String, dynamic> json) =>
      _$SearchHotDataItemFromJson(json);

  toJson() => _$SearchHotDataItemToJson(this);
}
