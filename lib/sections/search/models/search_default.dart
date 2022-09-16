import 'package:flutter_music/models/common_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'search_default.g.dart';

@JsonSerializable()
class SearchDefaultWrap extends CommonModel<SearchDefaultData> {
  SearchDefaultWrap();

  factory SearchDefaultWrap.fromJson(Map<String, dynamic> json) =>
      _$SearchDefaultWrapFromJson(json);

  toJson() => _$SearchDefaultWrapToJson(this);
}

@JsonSerializable()
class SearchDefaultData {
  SearchDefaultData();

  String? showKeyword;
  String? realkeyword;
  int? searchType;

  factory SearchDefaultData.fromJson(Map<String, dynamic> json) =>
      _$SearchDefaultDataFromJson(json);

  toJson() => _$SearchDefaultDataToJson(this);
}

class SearchTopModel {
  SearchTopModel();

  String? imageNamed;
  String? text;
}
