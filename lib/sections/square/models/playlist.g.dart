// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaylistSquareWrap _$PlaylistSquareWrapFromJson(Map json) =>
    PlaylistSquareWrap()
      ..cat = json['cat'] as String?
      ..total = json['total'] as int?
      ..code = json['code'] as int?
      ..more = json['more'] as bool?
      ..playlists = (json['playlists'] as List<dynamic>?)
          ?.map((e) =>
              PlaylistStage.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList()
      ..playlist = json['playlist'] == null
          ? null
          : PlaylistStage.fromJson(
              Map<String, dynamic>.from(json['playlist'] as Map));

Map<String, dynamic> _$PlaylistSquareWrapToJson(PlaylistSquareWrap instance) =>
    <String, dynamic>{
      'cat': instance.cat,
      'total': instance.total,
      'code': instance.code,
      'more': instance.more,
      'playlists': instance.playlists,
      'playlist': instance.playlist,
    };

PlaylistStage _$PlaylistStageFromJson(Map json) => PlaylistStage()
  ..name = json['name'] as String?
  ..id = json['id'] as int?
  ..coverImgUrl = json['coverImgUrl'] as String?
  ..createTime = json['createTime'] as int?
  ..updateTime = json['updateTime'] as int?
  ..userId = json['userId'] as int?
  ..status = json['status'] as int?
  ..coverImgId = json['coverImgId'] as int?
  ..description = json['description'] as String?
  ..tags = (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..playCount = json['playCount'] as int?
  ..shareCount = json['shareCount'] as int?
  ..commentCount = json['commentCount'] as int?
  ..subscribedCount = json['subscribedCount'] as int?
  ..creator = json['creator'] == null
      ? null
      : PlaylistCreator.fromJson(
          Map<String, dynamic>.from(json['creator'] as Map))
  ..subscribers = (json['subscribers'] as List<dynamic>?)
      ?.map(
          (e) => SubscribersItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..tracks = (json['tracks'] as List<dynamic>?)
      ?.map((e) => DailySongItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..trackIds = (json['trackIds'] as List<dynamic>?)
      ?.map((e) => TrackIdItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();

Map<String, dynamic> _$PlaylistStageToJson(PlaylistStage instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'coverImgUrl': instance.coverImgUrl,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'userId': instance.userId,
      'status': instance.status,
      'coverImgId': instance.coverImgId,
      'description': instance.description,
      'tags': instance.tags,
      'playCount': instance.playCount,
      'shareCount': instance.shareCount,
      'commentCount': instance.commentCount,
      'subscribedCount': instance.subscribedCount,
      'creator': instance.creator,
      'subscribers': instance.subscribers,
      'tracks': instance.tracks,
      'trackIds': instance.trackIds,
    };

PlaylistCreator _$PlaylistCreatorFromJson(Map json) => PlaylistCreator()
  ..avatarUrl = json['avatarUrl'] as String?
  ..userId = json['userId'] as int?
  ..backgroundUrl = json['backgroundUrl'] as String?
  ..nickname = json['nickname'] as String?;

Map<String, dynamic> _$PlaylistCreatorToJson(PlaylistCreator instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl,
      'userId': instance.userId,
      'backgroundUrl': instance.backgroundUrl,
      'nickname': instance.nickname,
    };

SubscribersItem _$SubscribersItemFromJson(Map json) => SubscribersItem()
  ..nickname = json['nickname'] as String?
  ..signature = json['signature'] as String?
  ..userId = json['userId'] as int?
  ..backgroundUrl = json['backgroundUrl'] as String?
  ..avatarUrl = json['avatarUrl'] as String?;

Map<String, dynamic> _$SubscribersItemToJson(SubscribersItem instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'signature': instance.signature,
      'userId': instance.userId,
      'backgroundUrl': instance.backgroundUrl,
      'avatarUrl': instance.avatarUrl,
    };

TrackIdItem _$TrackIdItemFromJson(Map json) => TrackIdItem()
  ..id = json['id'] as int?
  ..v = json['v'] as int?
  ..t = json['t'] as int?
  ..at = json['at'] as int?
  ..uid = json['uid'] as int?
  ..rcmdReason = json['rcmdReason'] as String?;

Map<String, dynamic> _$TrackIdItemToJson(TrackIdItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'v': instance.v,
      't': instance.t,
      'at': instance.at,
      'uid': instance.uid,
      'rcmdReason': instance.rcmdReason,
    };
