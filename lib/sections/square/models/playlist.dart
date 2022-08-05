import 'package:json_annotation/json_annotation.dart';

part 'playlist.g.dart';

///歌单分类下的内容
@JsonSerializable()
class PlaylistSquareWrap {
  PlaylistSquareWrap();

  //对应的tag分类
  String? cat;
  int? total;
  int? code;
  bool? more;
  List<PlaylistStage>? playlists;

  factory PlaylistSquareWrap.fromJson(Map<String, dynamic> json) =>
      _$PlaylistSquareWrapFromJson(json);

  toJson() => _$PlaylistSquareWrapToJson(this);
}

@JsonSerializable()
class PlaylistStage {
  PlaylistStage();

  String? name;
  int? id;
  String? coverImgUrl;
  int? userId;
  int? status;
  int? coverImgId;
  String? description;
  List<String>? tags;
  int? playCount;
  PlaylistCreator? creator;
  List<SubscribersItem>? subscribers;

  factory PlaylistStage.fromJson(Map<String, dynamic> json) =>
      _$PlaylistStageFromJson(json);

  toJson() => _$PlaylistStageToJson(this);
}

@JsonSerializable()
class PlaylistCreator {
  PlaylistCreator();

  String? avatarUrl;
  int? userId;
  String? backgroundUrl;

  factory PlaylistCreator.fromJson(Map<String, dynamic> json) =>
      _$PlaylistCreatorFromJson(json);

  toJson() => _$PlaylistCreatorToJson(this);
}

@JsonSerializable()
class SubscribersItem {
  SubscribersItem();
  String? nickname;
  String? signature;
  int? userId;
  String? backgroundUrl;

  factory SubscribersItem.fromJson(Map<String, dynamic> json) =>
      _$SubscribersItemFromJson(json);

  toJson() => _$SubscribersItemToJson(this);
}
