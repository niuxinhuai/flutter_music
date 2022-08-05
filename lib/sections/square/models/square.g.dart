// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'square.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SquareHotWrap _$SquareHotWrapFromJson(Map json) => SquareHotWrap()
  ..tags = (json['tags'] as List<dynamic>?)
      ?.map((e) => SquareStage.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..code = json['code'] as int?;

Map<String, dynamic> _$SquareHotWrapToJson(SquareHotWrap instance) =>
    <String, dynamic>{
      'tags': instance.tags,
      'code': instance.code,
    };

SquareStage _$SquareStageFromJson(Map json) => SquareStage()
  ..playlistTag = json['playlistTag'] == null
      ? null
      : PlaylistTag.fromJson(
          Map<String, dynamic>.from(json['playlistTag'] as Map))
  ..activity = json['activity'] as bool?
  ..usedCount = json['usedCount'] as int?
  ..hot = json['hot'] as bool?
  ..createTime = json['createTime'] as int?
  ..position = json['position'] as int?
  ..category = json['category'] as int?
  ..name = json['name'] as String?
  ..id = json['id'] as int?
  ..type = json['type'] as int?;

Map<String, dynamic> _$SquareStageToJson(SquareStage instance) =>
    <String, dynamic>{
      'playlistTag': instance.playlistTag,
      'activity': instance.activity,
      'usedCount': instance.usedCount,
      'hot': instance.hot,
      'createTime': instance.createTime,
      'position': instance.position,
      'category': instance.category,
      'name': instance.name,
      'id': instance.id,
      'type': instance.type,
    };

PlaylistTag _$PlaylistTagFromJson(Map json) => PlaylistTag()
  ..createTime = json['createTime'] as int?
  ..position = json['position'] as int?
  ..category = json['category'] as int?
  ..usedCount = json['usedCount'] as int?
  ..name = json['name'] as String?
  ..id = json['id'] as int?
  ..type = json['type'] as int?;

Map<String, dynamic> _$PlaylistTagToJson(PlaylistTag instance) =>
    <String, dynamic>{
      'createTime': instance.createTime,
      'position': instance.position,
      'category': instance.category,
      'usedCount': instance.usedCount,
      'name': instance.name,
      'id': instance.id,
      'type': instance.type,
    };
