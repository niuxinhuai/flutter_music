import 'package:flutter_music/models/common_model.dart';
import 'package:flutter_music/sections/square/models/playlist.dart';

import 'package:json_annotation/json_annotation.dart';

part 'source.g.dart';

@JsonSerializable()
class VideoSourceWrap {
  VideoSourceWrap();

  String? msg;
  int? code;
  bool? hasmore;
  int? rcmdLimit;
  List<VideoSourceItem>? datas;

  factory VideoSourceWrap.fromJson(Map<String, dynamic> json) =>
      _$VideoSourceWrapFromJson(json);

  toJson() => _$VideoSourceWrapToJson(this);
}

@JsonSerializable()
class VideoSourceItem {
  VideoSourceItem();

  int? type;
  VideoItemData? data;

  factory VideoSourceItem.fromJson(Map<String, dynamic> json) =>
      _$VideoSourceItemFromJson(json);

  toJson() => _$VideoSourceItemToJson(this);
}

@JsonSerializable()
class VideoItemData {
  VideoItemData();

  String? coverUrl;
  double? height;
  double? width;
  String? title;
  String? description;
  int? commentCount;
  int? shareCount;
  int? praisedCount;
  int? playTime;
  PlaylistCreator? creator;
  String? previewUrl;
  String? vid;
  List<ResolutionsItem>? resolutions;
  List<VideoGroupItem>? videoGroup;

  factory VideoItemData.fromJson(Map<String, dynamic> json) =>
      _$VideoItemDataFromJson(json);

  toJson() => _$VideoItemDataToJson(this);
}

@JsonSerializable()
class ResolutionsItem {
  ResolutionsItem();

  int? size;
  int? resolution;

  factory ResolutionsItem.fromJson(Map<String, dynamic> json) =>
      _$ResolutionsItemFromJson(json);

  toJson() => _$ResolutionsItemToJson(this);
}

@JsonSerializable()
class VideoGroupItem {
  VideoGroupItem();

  int? id;
  String? name;

  factory VideoGroupItem.fromJson(Map<String, dynamic> json) =>
      _$VideoGroupItemFromJson(json);

  toJson() => _$VideoGroupItemToJson(this);
}
