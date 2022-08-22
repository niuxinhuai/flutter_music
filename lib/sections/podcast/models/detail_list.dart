import 'package:flutter_music/sections/podcast/models/personalize.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detail_list.g.dart';

@JsonSerializable()
class PodcastDetailListWrap {
  PodcastDetailListWrap();

  int? count;
  int? code;
  List<DetailProgramsItem>? programs;

  factory PodcastDetailListWrap.fromJson(Map<String, dynamic> json) =>
      _$PodcastDetailListWrapFromJson(json);

  toJson() => _$PodcastDetailListWrapToJson(this);
}

@JsonSerializable()
class DetailProgramsItem {
  DetailProgramsItem();

  int? id;
  String? name;
  String? coverUrl;
  String? description;
  //点赞数量
  int? likedCount;
  int? shareCount;
  int? commentCount;
  int? listenerCount;
  int? createTime;
  int? categoryId;
  int? duration;
  int? secondCategoryId;
  DetailRadio? radio;
  int? scheduledPublishTime;
  PersonalizeDJ? dj;

  factory DetailProgramsItem.fromJson(Map<String, dynamic> json) =>
      _$DetailProgramsItemFromJson(json);

  toJson() => _$DetailProgramsItemToJson(this);
}

@JsonSerializable()
class DetailRadio {
  DetailRadio();

  int? id;
  String? name;
  int? subCount;
  int? lastProgramCreateTime;

  factory DetailRadio.fromJson(Map<String, dynamic> json) =>
      _$DetailRadioFromJson(json);

  toJson() => _$DetailRadioToJson(this);
}
