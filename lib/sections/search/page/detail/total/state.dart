import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/search/models/search_multimatch.dart';
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
  SearchMultimatchWrap? multimatchWrap;

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
      ..multimatchWrap = multimatchWrap
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

///?????????????????????
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

///?????????????????????
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

///?????????????????????
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

///?????????????????????
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

///???????????????????????????
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

///?????????????????????
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
