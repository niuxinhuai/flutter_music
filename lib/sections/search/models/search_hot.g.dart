// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_hot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchHotWrap _$SearchHotWrapFromJson(Map json) => SearchHotWrap()
  ..message = json['message'] as String?
  ..code = json['code'] as int?
  ..data = (json['data'] as List<dynamic>?)
      ?.map((e) =>
          SearchHotDataItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();

Map<String, dynamic> _$SearchHotWrapToJson(SearchHotWrap instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };

SearchHotDataItem _$SearchHotDataItemFromJson(Map json) => SearchHotDataItem()
  ..searchWord = json['searchWord'] as String?
  ..content = json['content'] as String?
  ..score = json['score'] as int?
  ..iconUrl = json['iconUrl'] as String?
  ..source = json['source'] as int?
  ..iconType = json['iconType'] as int?;

Map<String, dynamic> _$SearchHotDataItemToJson(SearchHotDataItem instance) =>
    <String, dynamic>{
      'searchWord': instance.searchWord,
      'content': instance.content,
      'score': instance.score,
      'iconUrl': instance.iconUrl,
      'source': instance.source,
      'iconType': instance.iconType,
    };
