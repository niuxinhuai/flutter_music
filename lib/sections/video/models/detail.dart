import 'package:flutter_music/models/common_model.dart';
import 'package:flutter_music/sections/village/models/source.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detail.g.dart';

@JsonSerializable()
class VideoDetailWrap extends CommonModel<VideoItemData> {
  VideoDetailWrap();

  factory VideoDetailWrap.fromJson(Map<String, dynamic> json) =>
      _$VideoDetailWrapFromJson(json);

  toJson() => _$VideoDetailWrapToJson(this);
}
