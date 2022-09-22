// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singer_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSingerCategoryWrap _$SearchSingerCategoryWrapFromJson(Map json) =>
    SearchSingerCategoryWrap()
      ..more = json['more'] as bool?
      ..artists = (json['artists'] as List<dynamic>?)
          ?.map(
              (e) => ArtistsItem.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList()
      ..code = json['code'] as int?;

Map<String, dynamic> _$SearchSingerCategoryWrapToJson(
        SearchSingerCategoryWrap instance) =>
    <String, dynamic>{
      'more': instance.more,
      'artists': instance.artists,
      'code': instance.code,
    };
