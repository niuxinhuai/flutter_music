import 'package:flutter_music/models/common_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';

@JsonSerializable()
class PodcastBannerWrap extends CommonModel<List<PodcastBannerItem>> {
  PodcastBannerWrap();

  factory PodcastBannerWrap.fromJson(Map<String, dynamic> json) =>
      _$PodcastBannerWrapFromJson(json);

  toJson() => _$PodcastBannerWrapToJson(this);
}

@JsonSerializable()
class PodcastBannerItem {
  PodcastBannerItem();

  int? targetId;
  int? targetType;
  String? pic;
  String? url;
  String? typeTitle;
  bool? exclusive;

  factory PodcastBannerItem.fromJson(Map<String, dynamic> json) =>
      _$PodcastBannerItemFromJson(json);

  toJson() => _$PodcastBannerItemToJson(this);
}
