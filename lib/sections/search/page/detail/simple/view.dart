import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/search/widget/album_list.dart';
import 'package:flutter_music/sections/search/widget/artist_list.dart';
import 'package:flutter_music/sections/search/widget/lyric_list.dart';
import 'package:flutter_music/sections/search/widget/playlist_list.dart';
import 'package:flutter_music/sections/search/widget/singer_list.dart';
import 'package:flutter_music/sections/search/widget/user_list.dart';
import 'package:flutter_music/utils/search_util.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SearchSimpleState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    color: CommonColors.foregroundColor,
    child: LoadingWrap(
      loadingState: state.loadingState,
      successChild: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: _buildBody(state, dispatch, viewService),
          );
        },
      ),
    ),
  );
}

Widget _buildBody(
    SearchSimpleState state, Dispatch dispatch, ViewService viewService) {
  bool isSingle = state.type == SearchUtils.single;
  bool isPlayList = state.type == SearchUtils.song_list;
  bool isAlbum = state.type == SearchUtils.album;
  bool isSinger = state.type == SearchUtils.singer;
  bool isUser = state.type == SearchUtils.user;
  bool isLyric = state.type == SearchUtils.lyric;
  if (isSingle) {
    return _buildSearchSinger(state, dispatch, viewService);
  } else if (isPlayList) {
    return SearchplaylistWidget(
      searchKey: state.text,
      playLists: state.wrap?.result?.playlists,
    );
  } else if (isAlbum) {
    return SearchAlbumWidget(
      albums: state.wrap?.result?.albums,
      searchKey: state.text,
    );
  } else if (isSinger) {
    return SearchArtistWidget(
      artists: state.wrap?.result?.artists,
      showFans: false,
    );
  } else if (isUser) {
    return SearchUserWidget(
      users: state.wrap?.result?.userprofiles,
      searchKey: state.text,
    );
  } else if (isLyric) {
    return SearchLyricWidget(
      songs: state.wrap?.result?.songs,
      searchKey: state.text,
    );
  }
  return Container();
}

Widget _buildSearchSinger(
    SearchSimpleState state, Dispatch dispatch, ViewService viewService) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildSingerHeader(state, dispatch, viewService),
      SearchSingerWidget(
        searchKey: state.text,
        songs: state.wrap?.result?.songs,
      )
    ],
  );
}

Widget _buildSingerHeader(
    SearchSimpleState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 36,
              height: 36,
              margin: EdgeInsets.only(left: 15, right: 10),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(18.0)),
              ),
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
            ),
            Text("播放全部",
                style: GpOtherTheme.size15(viewService.context)!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 18))
          ],
        ),
        Container(
          width: 40,
          margin: EdgeInsets.only(right: 15),
          padding: EdgeInsets.only(left: 8, right: 8),
//            color: Colors.red,
          child: Image.asset(
            'assets/images/cm8_voicelist_icon_check~iphone.png',
            color: CommonColors.onSurfaceTextColor,
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    ),
  );
}
