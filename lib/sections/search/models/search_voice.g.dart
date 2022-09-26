// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_voice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchVoiceWrap _$SearchVoiceWrapFromJson(Map json) => SearchVoiceWrap()
  ..message = json['message'] as String?
  ..code = json['code'] as int?
  ..data = json['data'] == null
      ? null
      : SearchVoiceDataItem.fromJson(
          Map<String, dynamic>.from(json['data'] as Map));

Map<String, dynamic> _$SearchVoiceWrapToJson(SearchVoiceWrap instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };

SearchVoiceDataItem _$SearchVoiceDataItemFromJson(Map json) =>
    SearchVoiceDataItem()
      ..totalCount = json['totalCount'] as int?
      ..hasMore = json['hasMore'] as bool?
      ..hlWords =
          (json['hlWords'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..resources = (json['resources'] as List<dynamic>?)
          ?.map((e) => SearchVoiceResourceItem.fromJson(
              Map<String, dynamic>.from(e as Map)))
          .toList();

Map<String, dynamic> _$SearchVoiceDataItemToJson(
        SearchVoiceDataItem instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'hasMore': instance.hasMore,
      'hlWords': instance.hlWords,
      'resources': instance.resources,
    };

SearchVoiceResourceItem _$SearchVoiceResourceItemFromJson(Map json) =>
    SearchVoiceResourceItem()
      ..type = json['type'] as String?
      ..baseInfo = json['baseInfo'] == null
          ? null
          : SearchVoiceBaseinfo.fromJson(
              Map<String, dynamic>.from(json['baseInfo'] as Map));

Map<String, dynamic> _$SearchVoiceResourceItemToJson(
        SearchVoiceResourceItem instance) =>
    <String, dynamic>{
      'type': instance.type,
      'baseInfo': instance.baseInfo,
    };

SearchVoiceBaseinfo _$SearchVoiceBaseinfoFromJson(Map json) =>
    SearchVoiceBaseinfo()
      ..name = json['name'] as String?
      ..listenerCount = json['listenerCount'] as int?
      ..coverUrl = json['coverUrl'] as String?
      ..duration = json['duration'] as int?
      ..dj = json['dj'] == null
          ? null
          : PersonalizeDJ.fromJson(
              Map<String, dynamic>.from(json['dj'] as Map));

Map<String, dynamic> _$SearchVoiceBaseinfoToJson(
        SearchVoiceBaseinfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'listenerCount': instance.listenerCount,
      'coverUrl': instance.coverUrl,
      'duration': instance.duration,
      'dj': instance.dj,
    };
