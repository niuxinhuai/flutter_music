// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personalize.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalizeWrap _$PersonalizeWrapFromJson(Map json) => PersonalizeWrap()
  ..message = json['message'] as String?
  ..code = json['code'] as int?
  ..data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) => PersonalizeItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();

Map<String, dynamic> _$PersonalizeWrapToJson(PersonalizeWrap instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };

PersonalizeItem _$PersonalizeItemFromJson(Map json) => PersonalizeItem()
  ..id = json['id'] as int?
  ..name = json['name'] as String?
  ..desc = json['desc'] as String?
  ..picUrl = json['picUrl'] as String?
  ..subCount = json['subCount'] as int?
  ..programCount = json['programCount'] as int?
  ..categoryId = json['categoryId'] as int?
  ..category = json['category'] as String?
  ..secondCategoryId = json['secondCategoryId'] as int?
  ..secondCategory = json['secondCategory'] as String?
  ..dj = json['dj'] == null
      ? null
      : PersonalizeDJ.fromJson(Map<String, dynamic>.from(json['dj'] as Map));

Map<String, dynamic> _$PersonalizeItemToJson(PersonalizeItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'desc': instance.desc,
      'picUrl': instance.picUrl,
      'subCount': instance.subCount,
      'programCount': instance.programCount,
      'categoryId': instance.categoryId,
      'category': instance.category,
      'secondCategoryId': instance.secondCategoryId,
      'secondCategory': instance.secondCategory,
      'dj': instance.dj,
    };

PersonalizeDJ _$PersonalizeDJFromJson(Map json) => PersonalizeDJ()
  ..userId = json['userId'] as int?
  ..userType = json['userType'] as int?
  ..avatarUrl = json['avatarUrl'] as String?
  ..nickname = json['nickname'] as String?
  ..backgroundUrl = json['backgroundUrl'] as String?
  ..rewardCount = json['rewardCount'] as int?
  ..followed = json['followed'] as bool?
  ..gender = json['gender'] as int?;

Map<String, dynamic> _$PersonalizeDJToJson(PersonalizeDJ instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userType': instance.userType,
      'avatarUrl': instance.avatarUrl,
      'nickname': instance.nickname,
      'backgroundUrl': instance.backgroundUrl,
      'rewardCount': instance.rewardCount,
      'followed': instance.followed,
      'gender': instance.gender,
    };
