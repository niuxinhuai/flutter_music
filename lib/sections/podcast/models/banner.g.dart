// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PodcastBannerWrap _$PodcastBannerWrapFromJson(Map json) => PodcastBannerWrap()
  ..message = json['message'] as String?
  ..code = json['code'] as int?
  ..data = (json['data'] as List<dynamic>?)
      ?.map((e) =>
          PodcastBannerItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();

Map<String, dynamic> _$PodcastBannerWrapToJson(PodcastBannerWrap instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };

PodcastBannerItem _$PodcastBannerItemFromJson(Map json) => PodcastBannerItem()
  ..targetId = json['targetId'] as int?
  ..targetType = json['targetType'] as int?
  ..pic = json['pic'] as String?
  ..url = json['url'] as String?
  ..typeTitle = json['typeTitle'] as String?
  ..exclusive = json['exclusive'] as bool?;

Map<String, dynamic> _$PodcastBannerItemToJson(PodcastBannerItem instance) =>
    <String, dynamic>{
      'targetId': instance.targetId,
      'targetType': instance.targetType,
      'pic': instance.pic,
      'url': instance.url,
      'typeTitle': instance.typeTitle,
      'exclusive': instance.exclusive,
    };
