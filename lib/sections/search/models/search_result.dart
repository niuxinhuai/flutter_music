import 'package:flutter_music/sections/Leaderboard/models/leaderboard.dart';
import 'package:flutter_music/sections/music/models/recommend.dart';
import 'package:flutter_music/sections/podcast/models/personalize.dart';
import 'package:flutter_music/sections/square/models/playlist.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_result.g.dart';

@JsonSerializable()
class SearchResultWrap {
  SearchResultWrap();

  int? code;
  SearchResult? result;

  factory SearchResultWrap.fromJson(Map<String, dynamic> json) =>
      _$SearchResultWrapFromJson(json);

  toJson() => _$SearchResultWrapToJson(this);
}

@JsonSerializable()
class SearchResult {
  SearchResult();

  //分类下的数据
  List<DailySongItem>? songs;

  List<PlaylistStage>? playlists;

  //歌手/艺人
  List<ArtistsItem>? artists;

  List<BoardListItem>? albums;

  List<SimqueryItem>? sim_querys;

  List<PersonalizeDJ>? userprofiles;

  int? code;

  //排序
  List<String>? order;

  //单曲
  SearchResultItem? song;

  //歌单
  SearchResultItem? playList;

  //歌手/艺人
  SearchResultItem? artist;

  //专辑
  SearchResultItem? album;

  //相关搜索
  SearchResultItem? sim_query;

  //用户
  SearchResultItem? user;

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);

  toJson() => _$SearchResultToJson(this);
}

@JsonSerializable()
class SearchResultItem {
  SearchResultItem();

  String? moreText;
  bool? more;
  List<int>? resourceIds;
  List<DailySongItem>? songs;

  List<PlaylistStage>? playLists;

  //歌手/艺人
  List<ArtistsItem>? artists;

  List<BoardListItem>? albums;

  List<SimqueryItem>? sim_querys;

  List<PersonalizeDJ>? users;

  factory SearchResultItem.fromJson(Map<String, dynamic> json) =>
      _$SearchResultItemFromJson(json);

  toJson() => _$SearchResultItemToJson(this);
}

@JsonSerializable()
class SimqueryItem {
  SimqueryItem();

  String? keyword;
  String? alg;

  factory SimqueryItem.fromJson(Map<String, dynamic> json) =>
      _$SimqueryItemFromJson(json);

  toJson() => _$SimqueryItemToJson(this);
}

@JsonSerializable()
class ArtistsItem {
  ArtistsItem();

  int? id;
  String? name;
  String? img1v1Url;
  String? identityIconUrl;
  bool? followed;
  int? accountId;
  List<String>? alias;

  factory ArtistsItem.fromJson(Map<String, dynamic> json) =>
      _$ArtistsItemFromJson(json);

  toJson() => _$ArtistsItemToJson(this);
}
