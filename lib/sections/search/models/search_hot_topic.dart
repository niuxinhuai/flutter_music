import 'package:json_annotation/json_annotation.dart';

part 'search_hot_topic.g.dart';

@JsonSerializable()
class SearchHotTopicWrap {
  SearchHotTopicWrap();

  int? code;
  List<SearchHotTopicItem>? hot;

  factory SearchHotTopicWrap.fromJson(Map<String, dynamic> json) =>
      _$SearchHotTopicWrapFromJson(json);

  toJson() => _$SearchHotTopicWrapToJson(this);
}

@JsonSerializable()
class SearchHotTopicItem {
  SearchHotTopicItem();

  String? title;
  List<String>? text;
  int? actId;
  int? participateCount;
  String? sharePicUrl;

  factory SearchHotTopicItem.fromJson(Map<String, dynamic> json) =>
      _$SearchHotTopicItemFromJson(json);

  toJson() => _$SearchHotTopicItemToJson(this);
}
