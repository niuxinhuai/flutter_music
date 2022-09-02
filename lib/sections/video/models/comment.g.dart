// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoCommentWrap _$VideoCommentWrapFromJson(Map json) => VideoCommentWrap()
  ..code = json['code'] as int?
  ..isMusician = json['isMusician'] as bool?
  ..userId = json['userId'] as int?
  ..moreHot = json['moreHot'] as bool?
  ..more = json['more'] as bool?
  ..total = json['total'] as int?
  ..topComments = (json['topComments'] as List<dynamic>?)
      ?.map(
          (e) => VideoCommentItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..hotComments = (json['hotComments'] as List<dynamic>?)
      ?.map(
          (e) => VideoCommentItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..comments = (json['comments'] as List<dynamic>?)
      ?.map(
          (e) => VideoCommentItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();

Map<String, dynamic> _$VideoCommentWrapToJson(VideoCommentWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'isMusician': instance.isMusician,
      'userId': instance.userId,
      'moreHot': instance.moreHot,
      'more': instance.more,
      'total': instance.total,
      'topComments': instance.topComments,
      'hotComments': instance.hotComments,
      'comments': instance.comments,
    };

VideoCommentItem _$VideoCommentItemFromJson(Map json) => VideoCommentItem()
  ..user = json['user'] == null
      ? null
      : PlaylistCreator.fromJson(Map<String, dynamic>.from(json['user'] as Map))
  ..beReplied = (json['beReplied'] as List<dynamic>?)
      ?.map((e) =>
          VideoBeRepliedItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..pendantData = json['pendantData'] == null
      ? null
      : VideoPendantData.fromJson(
          Map<String, dynamic>.from(json['pendantData'] as Map))
  ..status = json['status'] as int?
  ..commentId = json['commentId'] as int?
  ..content = json['content'] as String?
  ..time = json['time'] as int?
  ..timeStr = json['timeStr'] as String?
  ..needDisplayTime = json['needDisplayTime'] as bool?
  ..likedCount = json['likedCount'] as int?
  ..parentCommentId = json['parentCommentId'] as int?
  ..liked = json['liked'] as bool?;

Map<String, dynamic> _$VideoCommentItemToJson(VideoCommentItem instance) =>
    <String, dynamic>{
      'user': instance.user,
      'beReplied': instance.beReplied,
      'pendantData': instance.pendantData,
      'status': instance.status,
      'commentId': instance.commentId,
      'content': instance.content,
      'time': instance.time,
      'timeStr': instance.timeStr,
      'needDisplayTime': instance.needDisplayTime,
      'likedCount': instance.likedCount,
      'parentCommentId': instance.parentCommentId,
      'liked': instance.liked,
    };

VideoBeRepliedItem _$VideoBeRepliedItemFromJson(Map json) =>
    VideoBeRepliedItem()
      ..user = json['user'] == null
          ? null
          : PlaylistCreator.fromJson(
              Map<String, dynamic>.from(json['user'] as Map))
      ..beRepliedCommentId = json['beRepliedCommentId'] as int?
      ..content = json['content'] as String?
      ..status = json['status'] as int?;

Map<String, dynamic> _$VideoBeRepliedItemToJson(VideoBeRepliedItem instance) =>
    <String, dynamic>{
      'user': instance.user,
      'beRepliedCommentId': instance.beRepliedCommentId,
      'content': instance.content,
      'status': instance.status,
    };

VideoPendantData _$VideoPendantDataFromJson(Map json) => VideoPendantData()
  ..id = json['id'] as int?
  ..imageUrl = json['imageUrl'] as String?;

Map<String, dynamic> _$VideoPendantDataToJson(VideoPendantData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
    };
