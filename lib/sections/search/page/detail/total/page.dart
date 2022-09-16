import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/search/page/detail/total/album/component.dart';
import 'package:flutter_music/sections/search/page/detail/total/artist/component.dart';
import 'package:flutter_music/sections/search/page/detail/total/playlist/component.dart';
import 'package:flutter_music/sections/search/page/detail/total/sim/component.dart';
import 'package:flutter_music/sections/search/page/detail/total/singer/component.dart';
import 'package:flutter_music/sections/search/page/detail/total/user/component.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SearchResultTotalPage
    extends Page<SearchResultTotalState, Map<String, dynamic>> {
  SearchResultTotalPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<SearchResultTotalState>(
              adapter: null,
              slots: <String, Dependent<SearchResultTotalState>>{
                "song": SearchSingerConnector() + SingerComponent(),
                "playList": SearchPlaylistConnector() + PlaylistComponent(),
                "artist": SearchArtistConnector() + ArtistComponent(),
                "album": SearchAlbumConnector() + AlbumComponent(),
                "sim_query": SearchSimQueryConnector() + SimQueryComponent(),
                "user": SearchUserConnector() + UserComponent(),
              }),
          middleware: <Middleware<SearchResultTotalState>>[],
        );
}
