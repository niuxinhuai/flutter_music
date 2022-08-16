// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongWrap _$SongWrapFromJson(Map json) => SongWrap()
  ..message = json['message'] as String?
  ..code = json['code'] as int?
  ..data = (json['data'] as List<dynamic>?)
      ?.map((e) => SongData.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();

Map<String, dynamic> _$SongWrapToJson(SongWrap instance) => <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };

SongData _$SongDataFromJson(Map json) => SongData()
  ..id = json['id'] as int?
  ..url = json['url'] as String?
  ..br = json['br'] as int?
  ..size = json['size'] as int?
  ..md5 = json['md5'] as String?
  ..code = json['code'] as int?
  ..type = json['type'] as String?
  ..level = json['level'] as String?;

Map<String, dynamic> _$SongDataToJson(SongData instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'br': instance.br,
      'size': instance.size,
      'md5': instance.md5,
      'code': instance.code,
      'type': instance.type,
      'level': instance.level,
    };
