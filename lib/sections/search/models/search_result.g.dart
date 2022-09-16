// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultWrap _$SearchResultWrapFromJson(Map json) => SearchResultWrap()
  ..code = json['code'] as int?
  ..result = json['result'] == null
      ? null
      : SearchResult.fromJson(Map<String, dynamic>.from(json['result'] as Map));

Map<String, dynamic> _$SearchResultWrapToJson(SearchResultWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'result': instance.result,
    };

SearchResult _$SearchResultFromJson(Map json) => SearchResult()
  ..code = json['code'] as int?
  ..order = (json['order'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..song = json['song'] == null
      ? null
      : SearchResultItem.fromJson(
          Map<String, dynamic>.from(json['song'] as Map))
  ..playList = json['playList'] == null
      ? null
      : SearchResultItem.fromJson(
          Map<String, dynamic>.from(json['playList'] as Map))
  ..artist = json['artist'] == null
      ? null
      : SearchResultItem.fromJson(
          Map<String, dynamic>.from(json['artist'] as Map))
  ..album = json['album'] == null
      ? null
      : SearchResultItem.fromJson(
          Map<String, dynamic>.from(json['album'] as Map))
  ..sim_query = json['sim_query'] == null
      ? null
      : SearchResultItem.fromJson(
          Map<String, dynamic>.from(json['sim_query'] as Map))
  ..user = json['user'] == null
      ? null
      : SearchResultItem.fromJson(
          Map<String, dynamic>.from(json['user'] as Map));

Map<String, dynamic> _$SearchResultToJson(SearchResult instance) =>
    <String, dynamic>{
      'code': instance.code,
      'order': instance.order,
      'song': instance.song,
      'playList': instance.playList,
      'artist': instance.artist,
      'album': instance.album,
      'sim_query': instance.sim_query,
      'user': instance.user,
    };

SearchResultItem _$SearchResultItemFromJson(Map json) => SearchResultItem()
  ..moreText = json['moreText'] as String?
  ..more = json['more'] as bool?
  ..resourceIds =
      (json['resourceIds'] as List<dynamic>?)?.map((e) => e as int).toList()
  ..songs = (json['songs'] as List<dynamic>?)
      ?.map((e) => DailySongItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..playLists = (json['playLists'] as List<dynamic>?)
      ?.map((e) => PlaylistStage.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..artists = (json['artists'] as List<dynamic>?)
      ?.map((e) => ArtistsItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..albums = (json['albums'] as List<dynamic>?)
      ?.map((e) => BoardListItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..sim_querys = (json['sim_querys'] as List<dynamic>?)
      ?.map((e) => SimqueryItem.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..users = (json['users'] as List<dynamic>?)
      ?.map((e) => PersonalizeDJ.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();

Map<String, dynamic> _$SearchResultItemToJson(SearchResultItem instance) =>
    <String, dynamic>{
      'moreText': instance.moreText,
      'more': instance.more,
      'resourceIds': instance.resourceIds,
      'songs': instance.songs,
      'playLists': instance.playLists,
      'artists': instance.artists,
      'albums': instance.albums,
      'sim_querys': instance.sim_querys,
      'users': instance.users,
    };

SimqueryItem _$SimqueryItemFromJson(Map json) => SimqueryItem()
  ..keyword = json['keyword'] as String?
  ..alg = json['alg'] as String?;

Map<String, dynamic> _$SimqueryItemToJson(SimqueryItem instance) =>
    <String, dynamic>{
      'keyword': instance.keyword,
      'alg': instance.alg,
    };

ArtistsItem _$ArtistsItemFromJson(Map json) => ArtistsItem()
  ..id = json['id'] as int?
  ..name = json['name'] as String?
  ..img1v1Url = json['img1v1Url'] as String?
  ..identityIconUrl = json['identityIconUrl'] as String?
  ..followed = json['followed'] as bool?
  ..accountId = json['accountId'] as int?
  ..alias = (json['alias'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$ArtistsItemToJson(ArtistsItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'img1v1Url': instance.img1v1Url,
      'identityIconUrl': instance.identityIconUrl,
      'followed': instance.followed,
      'accountId': instance.accountId,
      'alias': instance.alias,
    };
