// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoDetailWrap _$VideoDetailWrapFromJson(Map json) => VideoDetailWrap()
  ..message = json['message'] as String?
  ..code = json['code'] as int?
  ..data = json['data'] == null
      ? null
      : VideoItemData.fromJson(Map<String, dynamic>.from(json['data'] as Map));

Map<String, dynamic> _$VideoDetailWrapToJson(VideoDetailWrap instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
