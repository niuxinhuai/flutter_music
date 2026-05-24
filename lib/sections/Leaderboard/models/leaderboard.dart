import 'package:json_annotation/json_annotation.dart';
part 'leaderboard.g.dart';

@JsonSerializable()
class LeaderboardWrap {
  LeaderboardWrap();

  int? code;
  List<BoardListItem>? list;
  ArtistToplist? artistToplist;

  factory LeaderboardWrap.fromJson(Map<String, dynamic> json) =>
      _$LeaderboardWrapFromJson(json);

  toJson() => _$LeaderboardWrapToJson(this);
}

///list
@JsonSerializable()
class BoardListItem {
  BoardListItem();

  List<TracksItem>? tracks;
  String? updateFrequency;
  int? trackNumberUpdateTime;
  int? userId;
  int? createTime;
  int? subscribedCount;
  int? specialType;
  int? trackCount;
  String? coverImgUrl;
  int? updateTime;
  int? trackUpdateTime;
  String? description;
  int? id;
  String? name;
  String? picUrl;
  int? publishTime;
  AlbumArtist? artist;

  factory BoardListItem.fromJson(Map<String, dynamic> json) =>
      _$BoardListItemFromJson(json);

  toJson() => _$BoardListItemToJson(this);
}

///track
@JsonSerializable()
class TracksItem {
  TracksItem();

  String? first;
  String? second;
  int? thrid;

  factory TracksItem.fromJson(Map<String, dynamic> json) =>
      _$TracksItemFromJson(json);

  toJson() => _$TracksItemToJson(this);
}

///artistToplistitem
@JsonSerializable()
class ArtistToplist {
  ArtistToplist();

  String? coverUrl;
  List<TracksItem>? artists;
  String? name;
  String? updateFrequency;
  int? position;

  factory ArtistToplist.fromJson(Map<String, dynamic> json) =>
      _$ArtistToplistFromJson(json);

  toJson() => _$ArtistToplistToJson(this);
}

@JsonSerializable()
class AlbumArtist {
  AlbumArtist();

  String? name;
  int? id;

  factory AlbumArtist.fromJson(Map<String, dynamic> json) =>
      _$AlbumArtistFromJson(json);

  toJson() => _$AlbumArtistToJson(this);
}
