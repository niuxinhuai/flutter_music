// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoSourceWrap _$VideoSourceWrapFromJson(Map json) => VideoSourceWrap()
  ..msg = json['msg'] as String?
  ..code = json['code'] as int?
  ..hasmore = json['hasmore'] as bool?
  ..rcmdLimit = json['rcmdLimit'] as int?
  ..datas = (json['datas'] as List<dynamic>?)
      ?.map(
          (e) => VideoSourceItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();

Map<String, dynamic> _$VideoSourceWrapToJson(VideoSourceWrap instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'code': instance.code,
      'hasmore': instance.hasmore,
      'rcmdLimit': instance.rcmdLimit,
      'datas': instance.datas,
    };

VideoSourceItem _$VideoSourceItemFromJson(Map json) => VideoSourceItem()
  ..type = json['type'] as int?
  ..data = json['data'] == null
      ? null
      : VideoItemData.fromJson(Map<String, dynamic>.from(json['data'] as Map));

Map<String, dynamic> _$VideoSourceItemToJson(VideoSourceItem instance) =>
    <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
    };

VideoItemData _$VideoItemDataFromJson(Map json) => VideoItemData()
  ..coverUrl = json['coverUrl'] as String?
  ..height = (json['height'] as num?)?.toDouble()
  ..width = (json['width'] as num?)?.toDouble()
  ..title = json['title'] as String?
  ..description = json['description'] as String?
  ..commentCount = json['commentCount'] as int?
  ..shareCount = json['shareCount'] as int?
  ..praisedCount = json['praisedCount'] as int?
  ..playTime = json['playTime'] as int?
  ..creator = json['creator'] == null
      ? null
      : PlaylistCreator.fromJson(
          Map<String, dynamic>.from(json['creator'] as Map))
  ..previewUrl = json['previewUrl'] as String?
  ..vid = json['vid'] as String?
  ..resolutions = (json['resolutions'] as List<dynamic>?)
      ?.map(
          (e) => ResolutionsItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..videoGroup = (json['videoGroup'] as List<dynamic>?)
      ?.map((e) => VideoGroupItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();

Map<String, dynamic> _$VideoItemDataToJson(VideoItemData instance) =>
    <String, dynamic>{
      'coverUrl': instance.coverUrl,
      'height': instance.height,
      'width': instance.width,
      'title': instance.title,
      'description': instance.description,
      'commentCount': instance.commentCount,
      'shareCount': instance.shareCount,
      'praisedCount': instance.praisedCount,
      'playTime': instance.playTime,
      'creator': instance.creator,
      'previewUrl': instance.previewUrl,
      'vid': instance.vid,
      'resolutions': instance.resolutions,
      'videoGroup': instance.videoGroup,
    };

ResolutionsItem _$ResolutionsItemFromJson(Map json) => ResolutionsItem()
  ..size = json['size'] as int?
  ..resolution = json['resolution'] as int?;

Map<String, dynamic> _$ResolutionsItemToJson(ResolutionsItem instance) =>
    <String, dynamic>{
      'size': instance.size,
      'resolution': instance.resolution,
    };

VideoGroupItem _$VideoGroupItemFromJson(Map json) => VideoGroupItem()
  ..id = json['id'] as int?
  ..name = json['name'] as String?;

Map<String, dynamic> _$VideoGroupItemToJson(VideoGroupItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
