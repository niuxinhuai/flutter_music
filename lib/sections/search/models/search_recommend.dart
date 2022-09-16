import 'package:json_annotation/json_annotation.dart';

part 'search_recommend.g.dart';

@JsonSerializable()
class SearchRecommendWrap {
  SearchRecommendWrap();

  int? code;
  SearchRecommendResult? result;

  factory SearchRecommendWrap.fromJson(Map<String, dynamic> json) =>
      _$SearchRecommendWrapFromJson(json);

  toJson() => _$SearchRecommendWrapToJson(this);
}

@JsonSerializable()
class SearchRecommendResult {
  SearchRecommendResult();

  List<SearchRecommendHotsItem>? hots;

  factory SearchRecommendResult.fromJson(Map<String, dynamic> json) =>
      _$SearchRecommendResultFromJson(json);

  toJson() => _$SearchRecommendResultToJson(this);
}

@JsonSerializable()
class SearchRecommendHotsItem {
  SearchRecommendHotsItem();

  String? first;
  int? second;
  int? iconType;

  factory SearchRecommendHotsItem.fromJson(Map<String, dynamic> json) =>
      _$SearchRecommendHotsItemFromJson(json);

  toJson() => _$SearchRecommendHotsItemToJson(this);
}
