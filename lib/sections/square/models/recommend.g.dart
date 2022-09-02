// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SquareEveryDayRecommendWrap _$SquareEveryDayRecommendWrapFromJson(Map json) =>
    SquareEveryDayRecommendWrap()
      ..code = json['code'] as int?
      ..featureFirst = json['featureFirst'] as bool?
      ..haveRcmdSongs = json['haveRcmdSongs'] as bool?
      ..recommend = (json['recommend'] as List<dynamic>?)
          ?.map((e) =>
              SquareRecommendItem.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();

Map<String, dynamic> _$SquareEveryDayRecommendWrapToJson(
        SquareEveryDayRecommendWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'featureFirst': instance.featureFirst,
      'haveRcmdSongs': instance.haveRcmdSongs,
      'recommend': instance.recommend,
    };

SquareRecommendItem _$SquareRecommendItemFromJson(Map json) =>
    SquareRecommendItem()
      ..id = json['id'] as int?
      ..type = json['type'] as int?
      ..name = json['name'] as String?
      ..picUrl = json['picUrl'] as String?
      ..playcount = json['playcount'] as int?
      ..playCount = json['playCount'] as int?
      ..createTime = json['createTime'] as int?
      ..trackCount = json['trackCount'] as int?
      ..userId = json['userId'] as int?
      ..creator = json['creator'] == null
          ? null
          : PlaylistCreator.fromJson(
              Map<String, dynamic>.from(json['creator'] as Map));

Map<String, dynamic> _$SquareRecommendItemToJson(
        SquareRecommendItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'picUrl': instance.picUrl,
      'playcount': instance.playcount,
      'playCount': instance.playCount,
      'createTime': instance.createTime,
      'trackCount': instance.trackCount,
      'userId': instance.userId,
      'creator': instance.creator,
    };

SquareRecommendWrap _$SquareRecommendWrapFromJson(Map json) =>
    SquareRecommendWrap()
      ..code = json['code'] as int?
      ..category = json['category'] as int?
      ..result = (json['result'] as List<dynamic>?)
          ?.map((e) =>
              SquareRecommendItem.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();

Map<String, dynamic> _$SquareRecommendWrapToJson(
        SquareRecommendWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'category': instance.category,
      'result': instance.result,
    };
