import 'package:json_annotation/json_annotation.dart';

part 'lyric.g.dart';

@JsonSerializable()
class SongLyric {
  SongLyric();

  int? code;
  bool? sgc;
  bool? sfy;
  bool? qfy;
  LyricUser? lyricUser;
  LrcData? lrc;
  LrcData? klyric;
  LrcData? tlyric;
  LrcData? romalrc;

  factory SongLyric.fromJson(Map<String, dynamic> json) =>
      _$SongLyricFromJson(json);

  toJson() => _$SongLyricToJson(this);
}

@JsonSerializable()
class LyricUser {
  LyricUser();

  int? id;
  int? status;
  int? userid;
  String? nickname;
  int? uptime;

  factory LyricUser.fromJson(Map<String, dynamic> json) =>
      _$LyricUserFromJson(json);

  toJson() => _$LyricUserToJson(this);
}

@JsonSerializable()
class LrcData {
  LrcData();

  int? version;
  String? lyric;

  factory LrcData.fromJson(Map<String, dynamic> json) =>
      _$LrcDataFromJson(json);

  toJson() => _$LrcDataToJson(this);
}

class AudioLyricModel {
  AudioLyricModel();

  String? lyric;
  int start = 0;
  int? end;
  bool selected = false;
}
