// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catelist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatelistWrap _$CatelistWrapFromJson(Map json) => CatelistWrap()
  ..code = json['code'] as int?
  ..categories = (json['categories'] as List<dynamic>?)
      ?.map((e) =>
          CatelistCategoryItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();

Map<String, dynamic> _$CatelistWrapToJson(CatelistWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'categories': instance.categories,
    };

CatelistCategoryItem _$CatelistCategoryItemFromJson(Map json) =>
    CatelistCategoryItem()
      ..id = json['id'] as int?
      ..name = json['name'] as String?;

Map<String, dynamic> _$CatelistCategoryItemToJson(
        CatelistCategoryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

CatelistRecommendWrap _$CatelistRecommendWrapFromJson(Map json) =>
    CatelistRecommendWrap()
      ..code = json['code'] as int?
      ..hasMore = json['hasMore'] as bool?
      ..djRadios = (json['djRadios'] as List<dynamic>?)
          ?.map((e) =>
              PersonalizeItem.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();

Map<String, dynamic> _$CatelistRecommendWrapToJson(
        CatelistRecommendWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'hasMore': instance.hasMore,
      'djRadios': instance.djRadios,
    };
