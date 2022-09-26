import 'package:flutter_music/models/common_model.dart';
import 'package:flutter_music/sections/podcast/models/personalize.dart';

import 'package:json_annotation/json_annotation.dart';

part 'search_voice.g.dart';

@JsonSerializable()
class SearchVoiceWrap extends CommonModel<SearchVoiceDataItem> {
  SearchVoiceWrap();

  factory SearchVoiceWrap.fromJson(Map<String, dynamic> json) =>
      _$SearchVoiceWrapFromJson(json);

  toJson() => _$SearchVoiceWrapToJson(this);
}

@JsonSerializable()
class SearchVoiceDataItem {
  SearchVoiceDataItem();

  int? totalCount;
  bool? hasMore;
  List<String>? hlWords;
  List<SearchVoiceResourceItem>? resources;

  factory SearchVoiceDataItem.fromJson(Map<String, dynamic> json) =>
      _$SearchVoiceDataItemFromJson(json);

  toJson() => _$SearchVoiceDataItemToJson(this);
}

@JsonSerializable()
class SearchVoiceResourceItem {
  SearchVoiceResourceItem();

  String? type;
  SearchVoiceBaseinfo? baseInfo;

  factory SearchVoiceResourceItem.fromJson(Map<String, dynamic> json) =>
      _$SearchVoiceResourceItemFromJson(json);

  toJson() => _$SearchVoiceResourceItemToJson(this);
}

@JsonSerializable()
class SearchVoiceBaseinfo {
  SearchVoiceBaseinfo();

  String? name;
  int? listenerCount;
  String? coverUrl;
  int? duration;
  PersonalizeDJ? dj;

  factory SearchVoiceBaseinfo.fromJson(Map<String, dynamic> json) =>
      _$SearchVoiceBaseinfoFromJson(json);

  toJson() => _$SearchVoiceBaseinfoToJson(this);
}
