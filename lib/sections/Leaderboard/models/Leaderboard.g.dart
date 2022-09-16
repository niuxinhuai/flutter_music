// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaderboardWrap _$LeaderboardWrapFromJson(Map json) => LeaderboardWrap()
  ..code = json['code'] as int?
  ..list = (json['list'] as List<dynamic>?)
      ?.map((e) => BoardListItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..artistToplist = json['artistToplist'] == null
      ? null
      : ArtistToplist.fromJson(
          Map<String, dynamic>.from(json['artistToplist'] as Map));

Map<String, dynamic> _$LeaderboardWrapToJson(LeaderboardWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'list': instance.list,
      'artistToplist': instance.artistToplist,
    };

BoardListItem _$BoardListItemFromJson(Map json) => BoardListItem()
  ..tracks = (json['tracks'] as List<dynamic>?)
      ?.map((e) => TracksItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..updateFrequency = json['updateFrequency'] as String?
  ..trackNumberUpdateTime = json['trackNumberUpdateTime'] as int?
  ..userId = json['userId'] as int?
  ..createTime = json['createTime'] as int?
  ..subscribedCount = json['subscribedCount'] as int?
  ..specialType = json['specialType'] as int?
  ..trackCount = json['trackCount'] as int?
  ..coverImgUrl = json['coverImgUrl'] as String?
  ..updateTime = json['updateTime'] as int?
  ..trackUpdateTime = json['trackUpdateTime'] as int?
  ..description = json['description'] as String?
  ..id = json['id'] as int?
  ..name = json['name'] as String?
  ..picUrl = json['picUrl'] as String?
  ..publishTime = json['publishTime'] as int?
  ..artist = json['artist'] == null
      ? null
      : AlbumArtist.fromJson(Map<String, dynamic>.from(json['artist'] as Map));

Map<String, dynamic> _$BoardListItemToJson(BoardListItem instance) =>
    <String, dynamic>{
      'tracks': instance.tracks,
      'updateFrequency': instance.updateFrequency,
      'trackNumberUpdateTime': instance.trackNumberUpdateTime,
      'userId': instance.userId,
      'createTime': instance.createTime,
      'subscribedCount': instance.subscribedCount,
      'specialType': instance.specialType,
      'trackCount': instance.trackCount,
      'coverImgUrl': instance.coverImgUrl,
      'updateTime': instance.updateTime,
      'trackUpdateTime': instance.trackUpdateTime,
      'description': instance.description,
      'id': instance.id,
      'name': instance.name,
      'picUrl': instance.picUrl,
      'publishTime': instance.publishTime,
      'artist': instance.artist,
    };

TracksItem _$TracksItemFromJson(Map json) => TracksItem()
  ..first = json['first'] as String?
  ..second = json['second'] as String?
  ..thrid = json['thrid'] as int?;

Map<String, dynamic> _$TracksItemToJson(TracksItem instance) =>
    <String, dynamic>{
      'first': instance.first,
      'second': instance.second,
      'thrid': instance.thrid,
    };

ArtistToplist _$ArtistToplistFromJson(Map json) => ArtistToplist()
  ..coverUrl = json['coverUrl'] as String?
  ..artists = (json['artists'] as List<dynamic>?)
      ?.map((e) => TracksItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..name = json['name'] as String?
  ..updateFrequency = json['updateFrequency'] as String?
  ..position = json['position'] as int?;

Map<String, dynamic> _$ArtistToplistToJson(ArtistToplist instance) =>
    <String, dynamic>{
      'coverUrl': instance.coverUrl,
      'artists': instance.artists,
      'name': instance.name,
      'updateFrequency': instance.updateFrequency,
      'position': instance.position,
    };

AlbumArtist _$AlbumArtistFromJson(Map json) => AlbumArtist()
  ..name = json['name'] as String?
  ..id = json['id'] as int?;

Map<String, dynamic> _$AlbumArtistToJson(AlbumArtist instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };
