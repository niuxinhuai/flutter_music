// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendListWrap _$RecommendListWrapFromJson(Map json) => RecommendListWrap()
  ..message = json['message'] as String?
  ..code = json['code'] as int?
  ..data = json['data'] == null
      ? null
      : RecommendListData.fromJson(
          Map<String, dynamic>.from(json['data'] as Map));

Map<String, dynamic> _$RecommendListWrapToJson(RecommendListWrap instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };

RecommendListData _$RecommendListDataFromJson(Map json) => RecommendListData()
  ..dailySongs = (json['dailySongs'] as List<dynamic>?)
      ?.map((e) => DailySongItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..recommendReasons = (json['recommendReasons'] as List<dynamic>?)
      ?.map((e) =>
          RecommendReasonItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();

Map<String, dynamic> _$RecommendListDataToJson(RecommendListData instance) =>
    <String, dynamic>{
      'dailySongs': instance.dailySongs,
      'recommendReasons': instance.recommendReasons,
    };

DailySongItem _$DailySongItemFromJson(Map json) => DailySongItem()
  ..name = json['name'] as String?
  ..id = json['id'] as int?
  ..ar = (json['ar'] as List<dynamic>?)
      ?.map((e) => DailyArItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..al = json['al'] == null
      ? null
      : DailyAlItem.fromJson(Map<String, dynamic>.from(json['al'] as Map))
  ..alia = (json['alia'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..mv = json['mv'] as int?
  ..fee = json['fee'] as int?
  ..no = json['no'] as int?
  ..originCoverType = json['originCoverType'] as int?
  ..officialTags =
      (json['officialTags'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..noCopyrightRcmd = json['noCopyrightRcmd'] == null
      ? null
      : NoCopyrightRcmd.fromJson(
          Map<String, dynamic>.from(json['noCopyrightRcmd'] as Map));

Map<String, dynamic> _$DailySongItemToJson(DailySongItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'ar': instance.ar,
      'al': instance.al,
      'alia': instance.alia,
      'mv': instance.mv,
      'fee': instance.fee,
      'no': instance.no,
      'originCoverType': instance.originCoverType,
      'officialTags': instance.officialTags,
      'noCopyrightRcmd': instance.noCopyrightRcmd,
    };

DailyArItem _$DailyArItemFromJson(Map json) => DailyArItem()
  ..id = json['id'] as int?
  ..name = json['name'] as String?;

Map<String, dynamic> _$DailyArItemToJson(DailyArItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

DailyAlItem _$DailyAlItemFromJson(Map json) => DailyAlItem()
  ..id = json['id'] as int?
  ..name = json['name'] as String?
  ..picUrl = json['picUrl'] as String?;

Map<String, dynamic> _$DailyAlItemToJson(DailyAlItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picUrl': instance.picUrl,
    };

RecommendReasonItem _$RecommendReasonItemFromJson(Map json) =>
    RecommendReasonItem()
      ..songId = json['songId'] as int?
      ..reason = json['reason'] as String?;

Map<String, dynamic> _$RecommendReasonItemToJson(
        RecommendReasonItem instance) =>
    <String, dynamic>{
      'songId': instance.songId,
      'reason': instance.reason,
    };

NoCopyrightRcmd _$NoCopyrightRcmdFromJson(Map json) => NoCopyrightRcmd()
  ..type = json['type'] as int?
  ..typeDesc = json['typeDesc'] as String?;

Map<String, dynamic> _$NoCopyrightRcmdToJson(NoCopyrightRcmd instance) =>
    <String, dynamic>{
      'type': instance.type,
      'typeDesc': instance.typeDesc,
    };
