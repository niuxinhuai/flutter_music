// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PodcastDetailWrap _$PodcastDetailWrapFromJson(Map json) => PodcastDetailWrap()
  ..message = json['message'] as String?
  ..code = json['code'] as int?
  ..data = json['data'] == null
      ? null
      : PodcastDetailData.fromJson(
          Map<String, dynamic>.from(json['data'] as Map));

Map<String, dynamic> _$PodcastDetailWrapToJson(PodcastDetailWrap instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };

PodcastDetailData _$PodcastDetailDataFromJson(Map json) => PodcastDetailData()
  ..id = json['id'] as int?
  ..name = json['name'] as String?
  ..picUrl = json['picUrl'] as String?
  ..desc = json['desc'] as String?
  ..subCount = json['subCount'] as int?
  ..shareCount = json['shareCount'] as int?
  ..commentCount = json['commentCount'] as int?
  ..playCount = json['playCount'] as int?
  ..category = json['category'] as String?
  ..categoryId = json['categoryId'] as int?
  ..secondCategory = json['secondCategory'] as String?
  ..secondCategoryId = json['secondCategoryId'] as int?
  ..dj = json['dj'] == null
      ? null
      : PersonalizeDJ.fromJson(Map<String, dynamic>.from(json['dj'] as Map))
  ..icon = json['icon'] == null
      ? null
      : RadiosIcon.fromJson(Map<String, dynamic>.from(json['icon'] as Map));

Map<String, dynamic> _$PodcastDetailDataToJson(PodcastDetailData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picUrl': instance.picUrl,
      'desc': instance.desc,
      'subCount': instance.subCount,
      'shareCount': instance.shareCount,
      'commentCount': instance.commentCount,
      'playCount': instance.playCount,
      'category': instance.category,
      'categoryId': instance.categoryId,
      'secondCategory': instance.secondCategory,
      'secondCategoryId': instance.secondCategoryId,
      'dj': instance.dj,
      'icon': instance.icon,
    };
