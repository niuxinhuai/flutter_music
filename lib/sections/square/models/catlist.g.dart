// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatlistWrap _$CatlistWrapFromJson(Map json) => CatlistWrap()
  ..all = json['all'] == null
      ? null
      : CatlistAll.fromJson(Map<String, dynamic>.from(json['all'] as Map))
  ..code = json['code'] as int?
  ..categories = (json['categories'] as Map?)?.map(
    (k, e) => MapEntry(k as String, e as String),
  )
  ..sub = (json['sub'] as List<dynamic>?)
      ?.map((e) => CatlistSubItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();

Map<String, dynamic> _$CatlistWrapToJson(CatlistWrap instance) =>
    <String, dynamic>{
      'all': instance.all,
      'code': instance.code,
      'categories': instance.categories,
      'sub': instance.sub,
    };

CatlistAll _$CatlistAllFromJson(Map json) => CatlistAll()
  ..name = json['name'] as String?
  ..resourceCount = json['resourceCount'] as int?
  ..type = json['type'] as int?
  ..category = json['category'] as int?
  ..resourceType = json['resourceType'] as int?
  ..hot = json['hot'] as bool?
  ..activity = json['activity'] as bool?;

Map<String, dynamic> _$CatlistAllToJson(CatlistAll instance) =>
    <String, dynamic>{
      'name': instance.name,
      'resourceCount': instance.resourceCount,
      'type': instance.type,
      'category': instance.category,
      'resourceType': instance.resourceType,
      'hot': instance.hot,
      'activity': instance.activity,
    };

CatlistSubItem _$CatlistSubItemFromJson(Map json) => CatlistSubItem()
  ..name = json['name'] as String?
  ..resourceCount = json['resourceCount'] as int?
  ..imgId = json['imgId'] as int?
  ..imgUrl = json['imgUrl'] as String?
  ..type = json['type'] as int?
  ..category = json['category'] as int?
  ..resourceType = json['resourceType'] as int?
  ..hot = json['hot'] as bool?
  ..activity = json['activity'] as bool?
  ..canMove = json['canMove'] as bool? ?? true
  ..inTop = json['inTop'] as bool? ?? false;

Map<String, dynamic> _$CatlistSubItemToJson(CatlistSubItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'resourceCount': instance.resourceCount,
      'imgId': instance.imgId,
      'imgUrl': instance.imgUrl,
      'type': instance.type,
      'category': instance.category,
      'resourceType': instance.resourceType,
      'hot': instance.hot,
      'activity': instance.activity,
      'canMove': instance.canMove,
      'inTop': instance.inTop,
    };
