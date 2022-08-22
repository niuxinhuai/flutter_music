// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PodcastDetailListWrap _$PodcastDetailListWrapFromJson(Map json) =>
    PodcastDetailListWrap()
      ..count = json['count'] as int?
      ..code = json['code'] as int?
      ..programs = (json['programs'] as List<dynamic>?)
          ?.map((e) =>
              DetailProgramsItem.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();

Map<String, dynamic> _$PodcastDetailListWrapToJson(
        PodcastDetailListWrap instance) =>
    <String, dynamic>{
      'count': instance.count,
      'code': instance.code,
      'programs': instance.programs,
    };

DetailProgramsItem _$DetailProgramsItemFromJson(Map json) =>
    DetailProgramsItem()
      ..id = json['id'] as int?
      ..name = json['name'] as String?
      ..coverUrl = json['coverUrl'] as String?
      ..description = json['description'] as String?
      ..likedCount = json['likedCount'] as int?
      ..shareCount = json['shareCount'] as int?
      ..commentCount = json['commentCount'] as int?
      ..listenerCount = json['listenerCount'] as int?
      ..createTime = json['createTime'] as int?
      ..categoryId = json['categoryId'] as int?
      ..duration = json['duration'] as int?
      ..secondCategoryId = json['secondCategoryId'] as int?
      ..radio = json['radio'] == null
          ? null
          : DetailRadio.fromJson(
              Map<String, dynamic>.from(json['radio'] as Map))
      ..scheduledPublishTime = json['scheduledPublishTime'] as int?
      ..dj = json['dj'] == null
          ? null
          : PersonalizeDJ.fromJson(
              Map<String, dynamic>.from(json['dj'] as Map));

Map<String, dynamic> _$DetailProgramsItemToJson(DetailProgramsItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coverUrl': instance.coverUrl,
      'description': instance.description,
      'likedCount': instance.likedCount,
      'shareCount': instance.shareCount,
      'commentCount': instance.commentCount,
      'listenerCount': instance.listenerCount,
      'createTime': instance.createTime,
      'categoryId': instance.categoryId,
      'duration': instance.duration,
      'secondCategoryId': instance.secondCategoryId,
      'radio': instance.radio,
      'scheduledPublishTime': instance.scheduledPublishTime,
      'dj': instance.dj,
    };

DetailRadio _$DetailRadioFromJson(Map json) => DetailRadio()
  ..id = json['id'] as int?
  ..name = json['name'] as String?
  ..subCount = json['subCount'] as int?
  ..lastProgramCreateTime = json['lastProgramCreateTime'] as int?;

Map<String, dynamic> _$DetailRadioToJson(DetailRadio instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'subCount': instance.subCount,
      'lastProgramCreateTime': instance.lastProgramCreateTime,
    };
