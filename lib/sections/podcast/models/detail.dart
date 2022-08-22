import 'package:flutter_music/models/common_model.dart';
import 'package:flutter_music/sections/podcast/models/personalize.dart';
import 'package:flutter_music/sections/podcast/models/podcast.dart';

import 'package:json_annotation/json_annotation.dart';

part 'detail.g.dart';

@JsonSerializable()
class PodcastDetailWrap extends CommonModel<PodcastDetailData> {
  PodcastDetailWrap();

  factory PodcastDetailWrap.fromJson(Map<String, dynamic> json) =>
      _$PodcastDetailWrapFromJson(json);

  toJson() => _$PodcastDetailWrapToJson(this);
}

@JsonSerializable()
class PodcastDetailData {
  PodcastDetailData();

  int? id;
  String? name;
  String? picUrl;
  String? desc;
  int? subCount;
  int? shareCount;
  int? commentCount;
  int? playCount;
  String? category;
  int? categoryId;
  String? secondCategory;
  int? secondCategoryId;
  PersonalizeDJ? dj;
  RadiosIcon? icon;

  factory PodcastDetailData.fromJson(Map<String, dynamic> json) =>
      _$PodcastDetailDataFromJson(json);

  toJson() => _$PodcastDetailDataToJson(this);
}

class DetailIndicatorModel {
  DetailIndicatorModel();

  String? title;
  int? id;
}

class DetailSheetModel {
  DetailSheetModel();

  String? imgNamed;
  String? title;
}
