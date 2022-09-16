import 'package:flutter_music/repository/database/database_keys.dart';
import 'package:json_annotation/json_annotation.dart';

part 'db_model.g.dart';

@JsonSerializable()
class UserSearchLog {
  UserSearchLog();

  @JsonKey(name: TUserSearchHistoryProperty.cKeyWord)
  String? keyWords;

  @JsonKey(name: TUserSearchHistoryProperty.cTime)
  int? time;

  factory UserSearchLog.fromJson(Map<String, dynamic> json) =>
      _$UserSearchLogFromJson(json);

  toJson() => _$UserSearchLogToJson(this);
}

@JsonSerializable()
class UserWeatherLog {
  UserWeatherLog();
  @JsonKey(name: TUserWeatherProperty.cId)
  String? city_id;
  @JsonKey(name: TUserWeatherProperty.cCity)
  String? city;
  @JsonKey(name: TUserWeatherProperty.cLat)
  String? lat;
  @JsonKey(name: TUserWeatherProperty.cLng)
  String? lng;
  @JsonKey(name: TUserWeatherProperty.cInd)
  int? ind;

  factory UserWeatherLog.fromJson(Map<String, dynamic> json) =>
      _$UserWeatherLogFromJson(json);

  toJson() => _$UserWeatherLogToJson(this);
}
