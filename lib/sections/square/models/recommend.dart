import 'package:flutter_music/constants/key.dart';
import 'package:flutter_music/sections/square/models/playlist.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recommend.g.dart';

///歌单分类推荐
@JsonSerializable()
class SquareEveryDayRecommendWrap {
  SquareEveryDayRecommendWrap();

  int? code;
  bool? featureFirst;
  bool? haveRcmdSongs;
  List<SquareRecommendItem>? recommend;

  factory SquareEveryDayRecommendWrap.fromJson(Map<String, dynamic> json) =>
      _$SquareEveryDayRecommendWrapFromJson(json);

  toJson() => _$SquareEveryDayRecommendWrapToJson(this);
}

@JsonSerializable()
class SquareRecommendItem {
  SquareRecommendItem();

  int? id;
  int? type;
  String? name;
  String? picUrl;
  int? playcount;
  int? playCount;
  int? createTime;
  int? trackCount;
  int? userId;
  PlaylistCreator? creator;

  factory SquareRecommendItem.fromJson(Map<String, dynamic> json) =>
      _$SquareRecommendItemFromJson(json);

  toJson() => _$SquareRecommendItemToJson(this);
}

@JsonSerializable()
class SquareRecommendWrap {
  SquareRecommendWrap();

  int? code;
  int? category;
  List<SquareRecommendItem>? result;

  factory SquareRecommendWrap.fromJson(Map<String, dynamic> json) =>
      _$SquareRecommendWrapFromJson(json);

  toJson() => _$SquareRecommendWrapToJson(this);
}

class RecommendSectionModel {
  RecommendSectionModel();

  String? title;
  List<SquareRecommendItem>? items = [];
}
