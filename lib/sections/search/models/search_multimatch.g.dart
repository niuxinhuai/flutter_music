// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_multimatch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchMultimatchWrap _$SearchMultimatchWrapFromJson(Map json) =>
    SearchMultimatchWrap()
      ..code = json['code'] as int?
      ..result = json['result'] == null
          ? null
          : SearchMultimatchResult.fromJson(
              Map<String, dynamic>.from(json['result'] as Map));

Map<String, dynamic> _$SearchMultimatchWrapToJson(
        SearchMultimatchWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'result': instance.result,
    };

SearchMultimatchResult _$SearchMultimatchResultFromJson(Map json) =>
    SearchMultimatchResult()
      ..orders =
          (json['orders'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..artist = (json['artist'] as List<dynamic>?)
          ?.map((e) => MultimatchArtistItem.fromJson(
              Map<String, dynamic>.from(e as Map)))
          .toList();

Map<String, dynamic> _$SearchMultimatchResultToJson(
        SearchMultimatchResult instance) =>
    <String, dynamic>{
      'orders': instance.orders,
      'artist': instance.artist,
    };

MultimatchArtistItem _$MultimatchArtistItemFromJson(Map json) =>
    MultimatchArtistItem()
      ..name = json['name'] as String?
      ..id = json['id'] as int?
      ..picUrl = json['picUrl'] as String?
      ..img1v1Url = json['img1v1Url'] as String?
      ..albumSize = json['albumSize'] as int?
      ..alias =
          (json['alias'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..musicSize = json['musicSize'] as int?
      ..mvSize = json['mvSize'] as int?
      ..fansSize = json['fansSize'] as int?
      ..videoSize = json['videoSize'] as int?
      ..occupation = json['occupation'] as String?
      ..searchCircle = json['searchCircle'] == null
          ? null
          : SearchCircle.fromJson(
              Map<String, dynamic>.from(json['searchCircle'] as Map));

Map<String, dynamic> _$MultimatchArtistItemToJson(
        MultimatchArtistItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'picUrl': instance.picUrl,
      'img1v1Url': instance.img1v1Url,
      'albumSize': instance.albumSize,
      'alias': instance.alias,
      'musicSize': instance.musicSize,
      'mvSize': instance.mvSize,
      'fansSize': instance.fansSize,
      'videoSize': instance.videoSize,
      'occupation': instance.occupation,
      'searchCircle': instance.searchCircle,
    };

SearchCircle _$SearchCircleFromJson(Map json) => SearchCircle()
  ..id = json['id'] as String?
  ..entranceText = json['entranceText'] as String?
  ..entranceUrl = json['entranceUrl'] as String?;

Map<String, dynamic> _$SearchCircleToJson(SearchCircle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'entranceText': instance.entranceText,
      'entranceUrl': instance.entranceUrl,
    };
