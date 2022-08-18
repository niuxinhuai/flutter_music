// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'podcast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PodcastWrap _$PodcastWrapFromJson(Map json) => PodcastWrap()
  ..message = json['message'] as String?
  ..code = json['code'] as int?
  ..data = (json['data'] as List<dynamic>?)
      ?.map((e) => PodcastStage.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();

Map<String, dynamic> _$PodcastWrapToJson(PodcastWrap instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };

PodcastPerferedWrap _$PodcastPerferedWrapFromJson(Map json) =>
    PodcastPerferedWrap()
      ..message = json['message'] as String?
      ..code = json['code'] as int?
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => RadiosItem.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();

Map<String, dynamic> _$PodcastPerferedWrapToJson(
        PodcastPerferedWrap instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };

PodcastStage _$PodcastStageFromJson(Map json) => PodcastStage()
  ..categoryId = json['categoryId'] as int?
  ..categoryName = json['categoryName'] as String?
  ..radios = (json['radios'] as List<dynamic>?)
      ?.map((e) => RadiosItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();

Map<String, dynamic> _$PodcastStageToJson(PodcastStage instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'radios': instance.radios,
    };

RadiosItem _$RadiosItemFromJson(Map json) => RadiosItem()
  ..id = json['id'] as int?
  ..name = json['name'] as String?
  ..rcmdText = json['rcmdText'] as String?
  ..radioFeeType = json['radioFeeType'] as int?
  ..feeScope = json['feeScope'] as int?
  ..picUrl = json['picUrl'] as String?
  ..programCount = json['programCount'] as int?
  ..subCount = json['subCount'] as int?
  ..subed = json['subed'] as bool?
  ..playCount = json['playCount'] as int?
  ..lastProgramName = json['lastProgramName'] as String?
  ..icon = json['icon'] == null
      ? null
      : RadiosIcon.fromJson(Map<String, dynamic>.from(json['icon'] as Map));

Map<String, dynamic> _$RadiosItemToJson(RadiosItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rcmdText': instance.rcmdText,
      'radioFeeType': instance.radioFeeType,
      'feeScope': instance.feeScope,
      'picUrl': instance.picUrl,
      'programCount': instance.programCount,
      'subCount': instance.subCount,
      'subed': instance.subed,
      'playCount': instance.playCount,
      'lastProgramName': instance.lastProgramName,
      'icon': instance.icon,
    };

RadiosIcon _$RadiosIconFromJson(Map json) => RadiosIcon()
  ..type = json['type'] as String?
  ..value = json['value'] as String?
  ..color = json['color'] as String?;

Map<String, dynamic> _$RadiosIconToJson(RadiosIcon instance) =>
    <String, dynamic>{
      'type': instance.type,
      'value': instance.value,
      'color': instance.color,
    };
