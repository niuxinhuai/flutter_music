import 'package:json_annotation/json_annotation.dart';

part 'square.g.dart';

///热门歌单分类
@JsonSerializable()
class SquareHotWrap {
  SquareHotWrap();

  List<SquareStage>? tags;
  int? code;

  factory SquareHotWrap.fromJson(Map<String, dynamic> json) =>
      _$SquareHotWrapFromJson(json);

  toJson() => _$SquareHotWrapToJson(this);
}

@JsonSerializable()
class SquareStage {
  SquareStage();

  PlaylistTag? playlistTag;
  bool? activity;
  int? usedCount;
  bool? hot;
  int? createTime;
  int? position;
  int? category;
  String? name;
  int? id;
  int? type;

  factory SquareStage.fromJson(Map<String, dynamic> json) =>
      _$SquareStageFromJson(json);

  toJson() => _$SquareStageToJson(this);
}

@JsonSerializable()
class PlaylistTag {
  PlaylistTag();

  int? createTime;
  int? position;
  int? category;
  int? usedCount;
  String? name;
  int? id;
  int? type;

  factory PlaylistTag.fromJson(Map<String, dynamic> json) =>
      _$PlaylistTagFromJson(json);

  toJson() => _$PlaylistTagToJson(this);
}
