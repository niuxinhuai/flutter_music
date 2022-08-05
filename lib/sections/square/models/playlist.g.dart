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
          .toList();

Map<String, dynamic> _$PlaylistSquareWrapToJson(PlaylistSquareWrap instance) =>
    <String, dynamic>{
      'cat': instance.cat,
      'total': instance.total,
      'code': instance.code,
      'more': instance.more,
      'playlists': instance.playlists,
    };

PlaylistStage _$PlaylistStageFromJson(Map json) => PlaylistStage()
  ..name = json['name'] as String?
  ..id = json['id'] as int?
  ..coverImgUrl = json['coverImgUrl'] as String?
  ..userId = json['userId'] as int?
  ..status = json['status'] as int?
  ..coverImgId = json['coverImgId'] as int?
  ..description = json['description'] as String?
  ..tags = (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..playCount = json['playCount'] as int?
  ..creator = json['creator'] == null
      ? null
      : PlaylistCreator.fromJson(
          Map<String, dynamic>.from(json['creator'] as Map))
  ..subscribers = (json['subscribers'] as List<dynamic>?)
      ?.map(
          (e) => SubscribersItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();

Map<String, dynamic> _$PlaylistStageToJson(PlaylistStage instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'coverImgUrl': instance.coverImgUrl,
      'userId': instance.userId,
      'status': instance.status,
      'coverImgId': instance.coverImgId,
      'description': instance.description,
      'tags': instance.tags,
      'playCount': instance.playCount,
      'creator': instance.creator,
      'subscribers': instance.subscribers,
    };

PlaylistCreator _$PlaylistCreatorFromJson(Map json) => PlaylistCreator()
  ..avatarUrl = json['avatarUrl'] as String?
  ..userId = json['userId'] as int?
  ..backgroundUrl = json['backgroundUrl'] as String?;

Map<String, dynamic> _$PlaylistCreatorToJson(PlaylistCreator instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl,
      'userId': instance.userId,
      'backgroundUrl': instance.backgroundUrl,
    };

SubscribersItem _$SubscribersItemFromJson(Map json) => SubscribersItem()
  ..nickname = json['nickname'] as String?
  ..signature = json['signature'] as String?
  ..userId = json['userId'] as int?
  ..backgroundUrl = json['backgroundUrl'] as String?;

Map<String, dynamic> _$SubscribersItemToJson(SubscribersItem instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'signature': instance.signature,
      'userId': instance.userId,
      'backgroundUrl': instance.backgroundUrl,
    };
