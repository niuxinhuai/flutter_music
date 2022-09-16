// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_recommend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchRecommendWrap _$SearchRecommendWrapFromJson(Map json) =>
    SearchRecommendWrap()
      ..code = json['code'] as int?
      ..result = json['result'] == null
          ? null
          : SearchRecommendResult.fromJson(
              Map<String, dynamic>.from(json['result'] as Map));

Map<String, dynamic> _$SearchRecommendWrapToJson(
        SearchRecommendWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'result': instance.result,
    };

SearchRecommendResult _$SearchRecommendResultFromJson(Map json) =>
    SearchRecommendResult()
      ..hots = (json['hots'] as List<dynamic>?)
          ?.map((e) => SearchRecommendHotsItem.fromJson(
              Map<String, dynamic>.from(e as Map)))
          .toList();

Map<String, dynamic> _$SearchRecommendResultToJson(
        SearchRecommendResult instance) =>
    <String, dynamic>{
      'hots': instance.hots,
    };

SearchRecommendHotsItem _$SearchRecommendHotsItemFromJson(Map json) =>
    SearchRecommendHotsItem()
      ..first = json['first'] as String?
      ..second = json['second'] as int?
      ..iconType = json['iconType'] as int?;

Map<String, dynamic> _$SearchRecommendHotsItemToJson(
        SearchRecommendHotsItem instance) =>
    <String, dynamic>{
      'first': instance.first,
      'second': instance.second,
      'iconType': instance.iconType,
    };
