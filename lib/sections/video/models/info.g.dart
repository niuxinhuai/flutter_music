// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoDetailInfoWrap _$VideoDetailInfoWrapFromJson(Map json) =>
    VideoDetailInfoWrap()
      ..code = json['code'] as int?
      ..likedCount = json['likedCount'] as int?
      ..shareCount = json['shareCount'] as int?
      ..commentCount = json['commentCount'] as int?
      ..liked = json['liked'] as bool?;

Map<String, dynamic> _$VideoDetailInfoWrapToJson(
        VideoDetailInfoWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'likedCount': instance.likedCount,
      'shareCount': instance.shareCount,
      'commentCount': instance.commentCount,
      'liked': instance.liked,
    };

VideoUrlItem _$VideoUrlItemFromJson(Map json) => VideoUrlItem()
  ..id = json['id'] as String?
  ..url = json['url'] as String?
  ..size = json['size'] as int?
  ..validityTime = json['validityTime'] as int?
  ..needPay = json['needPay'] as bool?
  ..r = (json['r'] as num?)?.toDouble();

Map<String, dynamic> _$VideoUrlItemToJson(VideoUrlItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'size': instance.size,
      'validityTime': instance.validityTime,
      'needPay': instance.needPay,
      'r': instance.r,
    };
