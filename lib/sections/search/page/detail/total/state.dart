import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/search/models/search_result.dart';
import 'package:flutter_music/sections/search/page/detail/total/album/state.dart';
import 'package:flutter_music/sections/search/page/detail/total/artist/state.dart';
import 'package:flutter_music/sections/search/page/detail/total/playlist/state.dart';
import 'package:flutter_music/sections/search/page/detail/total/sim/state.dart';
import 'package:flutter_music/sections/search/page/detail/total/singer/state.dart';
import 'package:flutter_music/sections/search/page/detail/total/user/state.dart';
import 'package:flutter_music/sections/square/models/playlist.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

class SearchResultTotalState implements Cloneable<SearchResultTotalState> {
  LoadingState? loadingState;
  int? type;
  String? text;
  SearchResultWrap? wrap;

  SingerState? songState;
  PlaylistState? playListState;
  ArtistState? artistState;
  AlbumState? albumState;
  SimQueryState? simQueryState;
  UserState? userState;

  @override
  SearchResultTotalState clone() {
    return SearchResultTotalState()
      ..loadingState = loadingState
      ..type = type
      ..text = text
      ..wrap = wrap
      ..songState = songState
      ..playListState = playListState
      ..artistState = artistState
      ..albumState = albumState
      ..simQueryState = simQueryState
      ..userState = userState;
  }
}

SearchResultTotalState initState(Map<String, dynamic>? args) {
  int type = 1;
  if (args != null && args.containsKey("type")) {
    type = args["type"];
  }
  String text = "";
  if (args != null && args.containsKey("text")) {
    text = args["text"];
  }

  return SearchResultTotalState()
    ..loadingState = LoadingState.isLoading
    ..type = type
    ..text = text
    ..songState = SingerState()
    ..playListState = PlaylistState()
    ..artistState = ArtistState()
    ..albumState = AlbumState()
    ..simQueryState = SimQueryState()
    ..userState = UserState();
}

///单曲组件连接器
class SearchSingerConnector
    extends ConnOp<SearchResultTotalState, SingerState> {
  @override
  SingerState? get(SearchResultTotalState? state) {
    return state?.songState;
  }

  @override
  void set(SearchResultTotalState state, SingerState subState) {
    state.songState = subState;
  }
}

///歌单组件连接器
class SearchPlaylistConnector
    extends ConnOp<SearchResultTotalState, PlaylistState> {
  @override
  PlaylistState? get(SearchResultTotalState? state) {
    return state?.playListState;
  }

  @override
  void set(SearchResultTotalState state, PlaylistState subState) {
    state.playListState = subState;
  }
}

///艺人组件连接器
class SearchArtistConnector
    extends ConnOp<SearchResultTotalState, ArtistState> {
  @override
  ArtistState? get(SearchResultTotalState? state) {
    return state?.artistState;
  }

  @override
  void set(SearchResultTotalState state, ArtistState subState) {
    state.artistState = subState;
  }
}

///专辑组件连接器
class SearchAlbumConnector extends ConnOp<SearchResultTotalState, AlbumState> {
  @override
  AlbumState? get(SearchResultTotalState? state) {
    return state?.albumState;
  }

  @override
  void set(SearchResultTotalState state, AlbumState subState) {
    state.albumState = subState;
  }
}

///相关搜索组件连接器
class SearchSimQueryConnector
    extends ConnOp<SearchResultTotalState, SimQueryState> {
  @override
  SimQueryState? get(SearchResultTotalState? state) {
    return state?.simQueryState;
  }

  @override
  void set(SearchResultTotalState state, SimQueryState subState) {
    state.simQueryState = subState;
  }
}

///用户组件连接器
class SearchUserConnector extends ConnOp<SearchResultTotalState, UserState> {
  @override
  UserState? get(SearchResultTotalState? state) {
    return state?.userState;
  }

  @override
  void set(SearchResultTotalState state, UserState subState) {
    state.userState = subState;
  }
}
