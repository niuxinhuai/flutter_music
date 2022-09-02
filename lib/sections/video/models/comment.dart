import 'package:flutter_music/sections/square/models/playlist.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class VideoCommentWrap {
  VideoCommentWrap();

  int? code;
  bool? isMusician;
  int? userId;
  bool? moreHot;
  bool? more;
  int? total;
  List<VideoCommentItem>? topComments;
  List<VideoCommentItem>? hotComments;
  List<VideoCommentItem>? comments;

  factory VideoCommentWrap.fromJson(Map<String, dynamic> json) =>
      _$VideoCommentWrapFromJson(json);

  toJson() => _$VideoCommentWrapToJson(this);
}

@JsonSerializable()
class VideoCommentItem {
  VideoCommentItem();

  PlaylistCreator? user;
  List<VideoBeRepliedItem>? beReplied;
  VideoPendantData? pendantData;
  int? status;
  int? commentId;
  String? content;
  int? time;
  String? timeStr;
  bool? needDisplayTime;
  int? likedCount;
  int? parentCommentId;
  bool? liked;

  factory VideoCommentItem.fromJson(Map<String, dynamic> json) =>
      _$VideoCommentItemFromJson(json);

  toJson() => _$VideoCommentItemToJson(this);
}

//被回复数
@JsonSerializable()
class VideoBeRepliedItem {
  VideoBeRepliedItem();

  PlaylistCreator? user;
  int? beRepliedCommentId;
  String? content;
  int? status;

  factory VideoBeRepliedItem.fromJson(Map<String, dynamic> json) =>
      _$VideoBeRepliedItemFromJson(json);

  toJson() => _$VideoBeRepliedItemToJson(this);
}

@JsonSerializable()
class VideoPendantData {
  VideoPendantData();

  int? id;
  String? imageUrl;

  factory VideoPendantData.fromJson(Map<String, dynamic> json) =>
      _$VideoPendantDataFromJson(json);

  toJson() => _$VideoPendantDataToJson(this);
}
