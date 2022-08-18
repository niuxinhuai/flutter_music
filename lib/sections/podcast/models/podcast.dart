import 'package:flutter/material.dart';
import 'package:flutter_music/models/common_model.dart';
import 'package:flutter_music/utils/colorUtils.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'podcast.g.dart';

@JsonSerializable()
class PodcastWrap extends CommonModel<List<PodcastStage>> {
  PodcastWrap();

  factory PodcastWrap.fromJson(Map<String, dynamic> json) =>
      _$PodcastWrapFromJson(json);

  toJson() => _$PodcastWrapToJson(this);
}

@JsonSerializable()
class PodcastPerferedWrap extends CommonModel<List<RadiosItem>> {
  PodcastPerferedWrap();

  factory PodcastPerferedWrap.fromJson(Map<String, dynamic> json) =>
      _$PodcastPerferedWrapFromJson(json);

  toJson() => _$PodcastPerferedWrapToJson(this);
}

@JsonSerializable()
class PodcastStage {
  PodcastStage();

  int? categoryId;
  String? categoryName;
  List<RadiosItem>? radios;

  factory PodcastStage.fromJson(Map<String, dynamic> json) =>
      _$PodcastStageFromJson(json);

  toJson() => _$PodcastStageToJson(this);
}

@JsonSerializable()
class RadiosItem {
  RadiosItem();

  int? id;
  String? name;
  String? rcmdText;
  int? radioFeeType;
  int? feeScope;
  String? picUrl;
  int? programCount;
  int? subCount;
  bool? subed;
  int? playCount;
  String? lastProgramName;
  RadiosIcon? icon;

  factory RadiosItem.fromJson(Map<String, dynamic> json) =>
      _$RadiosItemFromJson(json);

  toJson() => _$RadiosItemToJson(this);
}

@JsonSerializable()
class RadiosIcon {
  RadiosIcon();

  String? type;
  String? value;
  String? color;

  factory RadiosIcon.fromJson(Map<String, dynamic> json) =>
      _$RadiosIconFromJson(json);

  toJson() => _$RadiosIconToJson(this);
}
