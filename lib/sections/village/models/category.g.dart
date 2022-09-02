// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoCategoryWrap _$VideoCategoryWrapFromJson(Map json) => VideoCategoryWrap()
  ..message = json['message'] as String?
  ..code = json['code'] as int?
  ..data = (json['data'] as List<dynamic>?)
      ?.map((e) =>
          VideoCategoryItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();

Map<String, dynamic> _$VideoCategoryWrapToJson(VideoCategoryWrap instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };

VideoCategoryItem _$VideoCategoryItemFromJson(Map json) => VideoCategoryItem()
  ..id = json['id'] as int?
  ..name = json['name'] as String?
  ..relatedVideoType = json['relatedVideoType'] as String?
  ..selectTab = json['selectTab'] as bool?;

Map<String, dynamic> _$VideoCategoryItemToJson(VideoCategoryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'relatedVideoType': instance.relatedVideoType,
      'selectTab': instance.selectTab,
    };
