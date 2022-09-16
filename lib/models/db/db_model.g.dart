// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSearchLog _$UserSearchLogFromJson(Map json) => UserSearchLog()
  ..keyWords = json['key_wrod'] as String?
  ..time = json['time'] as int?;

Map<String, dynamic> _$UserSearchLogToJson(UserSearchLog instance) =>
    <String, dynamic>{
      'key_wrod': instance.keyWords,
      'time': instance.time,
    };

UserWeatherLog _$UserWeatherLogFromJson(Map json) => UserWeatherLog()
  ..city_id = json['city_id'] as String?
  ..city = json['city'] as String?
  ..lat = json['lat'] as String?
  ..lng = json['lng'] as String?
  ..ind = json['ind'] as int?;

Map<String, dynamic> _$UserWeatherLogToJson(UserWeatherLog instance) =>
    <String, dynamic>{
      'city_id': instance.city_id,
      'city': instance.city,
      'lat': instance.lat,
      'lng': instance.lng,
      'ind': instance.ind,
    };
