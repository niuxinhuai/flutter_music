// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyric.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongLyric _$SongLyricFromJson(Map json) => SongLyric()
  ..code = json['code'] as int?
  ..sgc = json['sgc'] as bool?
  ..sfy = json['sfy'] as bool?
  ..qfy = json['qfy'] as bool?
  ..lyricUser = json['lyricUser'] == null
      ? null
      : LyricUser.fromJson(Map<String, dynamic>.from(json['lyricUser'] as Map))
  ..lrc = json['lrc'] == null
      ? null
      : LrcData.fromJson(Map<String, dynamic>.from(json['lrc'] as Map))
  ..klyric = json['klyric'] == null
      ? null
      : LrcData.fromJson(Map<String, dynamic>.from(json['klyric'] as Map))
  ..tlyric = json['tlyric'] == null
      ? null
      : LrcData.fromJson(Map<String, dynamic>.from(json['tlyric'] as Map))
  ..romalrc = json['romalrc'] == null
      ? null
      : LrcData.fromJson(Map<String, dynamic>.from(json['romalrc'] as Map));

Map<String, dynamic> _$SongLyricToJson(SongLyric instance) => <String, dynamic>{
      'code': instance.code,
      'sgc': instance.sgc,
      'sfy': instance.sfy,
      'qfy': instance.qfy,
      'lyricUser': instance.lyricUser,
      'lrc': instance.lrc,
      'klyric': instance.klyric,
      'tlyric': instance.tlyric,
      'romalrc': instance.romalrc,
    };

LyricUser _$LyricUserFromJson(Map json) => LyricUser()
  ..id = json['id'] as int?
  ..status = json['status'] as int?
  ..userid = json['userid'] as int?
  ..nickname = json['nickname'] as String?
  ..uptime = json['uptime'] as int?;

Map<String, dynamic> _$LyricUserToJson(LyricUser instance) => <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'userid': instance.userid,
      'nickname': instance.nickname,
      'uptime': instance.uptime,
    };

LrcData _$LrcDataFromJson(Map json) => LrcData()
  ..version = json['version'] as int?
  ..lyric = json['lyric'] as String?;

Map<String, dynamic> _$LrcDataToJson(LrcData instance) => <String, dynamic>{
      'version': instance.version,
      'lyric': instance.lyric,
    };
