import 'package:json_annotation/json_annotation.dart';

part 'search_multimatch.g.dart';

@JsonSerializable()
class SearchMultimatchWrap {
  SearchMultimatchWrap();

  int? code;
  SearchMultimatchResult? result;

  factory SearchMultimatchWrap.fromJson(Map<String, dynamic> json) =>
      _$SearchMultimatchWrapFromJson(json);

  toJson() => _$SearchMultimatchWrapToJson(this);
}

@JsonSerializable()
class SearchMultimatchResult {
  SearchMultimatchResult();

  List<String>? orders;
  List<MultimatchArtistItem>? artist;

  factory SearchMultimatchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchMultimatchResultFromJson(json);

  toJson() => _$SearchMultimatchResultToJson(this);
}

@JsonSerializable()
class MultimatchArtistItem {
  MultimatchArtistItem();

  String? name;
  int? id;
  String? picUrl;
  String? img1v1Url;
  int? albumSize;
  List<String>? alias;
  int? musicSize;
  int? mvSize;
  int? fansSize;
  int? videoSize;
  String? occupation;
  SearchCircle? searchCircle;

  factory MultimatchArtistItem.fromJson(Map<String, dynamic> json) =>
      _$MultimatchArtistItemFromJson(json);

  toJson() => _$MultimatchArtistItemToJson(this);
}

@JsonSerializable()
class SearchCircle {
  SearchCircle();

  String? id;
  String? entranceText;
  String? entranceUrl;

  factory SearchCircle.fromJson(Map<String, dynamic> json) =>
      _$SearchCircleFromJson(json);

  toJson() => _$SearchCircleToJson(this);
}
