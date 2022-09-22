import 'package:flutter_music/sections/search/models/search_result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'singer_category.g.dart';

@JsonSerializable()
class SearchSingerCategoryWrap {
  SearchSingerCategoryWrap();

  bool? more;
  List<ArtistsItem>? artists;
  int? code;

  factory SearchSingerCategoryWrap.fromJson(Map<String, dynamic> json) =>
      _$SearchSingerCategoryWrapFromJson(json);

  toJson() => _$SearchSingerCategoryWrapToJson(this);
}

class SearchSingerMenuModel {
  SearchSingerMenuModel();

  String? text;
  int? id;
  bool selected = false;
}
