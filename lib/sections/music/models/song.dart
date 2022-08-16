import 'package:flutter_music/models/common_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'song.g.dart';

@JsonSerializable()
class SongWrap extends CommonModel<List<SongData>> {
  SongWrap();

  factory SongWrap.fromJson(Map<String, dynamic> json) =>
      _$SongWrapFromJson(json);

  toJson() => _$SongWrapToJson(this);
}

@JsonSerializable()
class SongData {
  SongData();

  int? id;
  String? url;
  int? br;
  int? size;
  String? md5;
  int? code;
  String? type;
  String? level;

  factory SongData.fromJson(Map<String, dynamic> json) =>
      _$SongDataFromJson(json);

  toJson() => _$SongDataToJson(this);
}
