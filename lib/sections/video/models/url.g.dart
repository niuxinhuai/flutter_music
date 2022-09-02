// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoUrlWrap _$VideoUrlWrapFromJson(Map json) => VideoUrlWrap()
  ..code = json['code'] as int?
  ..urls = (json['urls'] as List<dynamic>?)
      ?.map((e) => VideoUrlItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();

Map<String, dynamic> _$VideoUrlWrapToJson(VideoUrlWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'urls': instance.urls,
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
