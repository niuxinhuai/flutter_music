// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HighqualityTagsWrap _$HighqualityTagsWrapFromJson(Map json) =>
    HighqualityTagsWrap()
      ..code = json['code'] as int?
      ..tags = (json['tags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();

Map<String, dynamic> _$HighqualityTagsWrapToJson(
        HighqualityTagsWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'tags': instance.tags,
    };

Tag _$TagFromJson(Map json) => Tag()
  ..id = json['id'] as int?
  ..name = json['name'] as String?
  ..type = json['type'] as int?
  ..category = json['category'] as int?
  ..hot = json['hot'] as bool?;

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'category': instance.category,
      'hot': instance.hot,
    };
