// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_hot_topic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchHotTopicWrap _$SearchHotTopicWrapFromJson(Map json) =>
    SearchHotTopicWrap()
      ..code = json['code'] as int?
      ..hot = (json['hot'] as List<dynamic>?)
          ?.map((e) =>
              SearchHotTopicItem.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();

Map<String, dynamic> _$SearchHotTopicWrapToJson(SearchHotTopicWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'hot': instance.hot,
    };

SearchHotTopicItem _$SearchHotTopicItemFromJson(Map json) =>
    SearchHotTopicItem()
      ..title = json['title'] as String?
      ..text =
          (json['text'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..actId = json['actId'] as int?
      ..participateCount = json['participateCount'] as int?
      ..sharePicUrl = json['sharePicUrl'] as String?;

Map<String, dynamic> _$SearchHotTopicItemToJson(SearchHotTopicItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'text': instance.text,
      'actId': instance.actId,
      'participateCount': instance.participateCount,
      'sharePicUrl': instance.sharePicUrl,
    };
