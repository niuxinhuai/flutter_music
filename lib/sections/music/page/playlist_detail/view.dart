import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/music/models/recommend.dart';
import 'package:flutter_music/sections/music/widget/playlist_header.dart';
import 'package:flutter_music/sections/music/widget/song_item.dart';
import 'package:flutter_music/widgets/appbar.dart';
import 'package:flutter_music/widgets/effect.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';
import 'package:flutter_music/widgets/sliver/sliver_header.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    PlaylistDetailState state, Dispatch dispatch, ViewService viewService) {
  print(">>>>>>>>>>>>top:${MediaQuery.of(viewService.context).padding.top}");
  return Container(
    color: CommonColors.foregroundColor,
    child: Stack(
      children: [
        if (state.coverImgUrl != null)
          CachedNetworkImage(
            imageUrl: state.coverImgUrl!,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        EffectWidget(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: _buildAppbar(state, dispatch, viewService),
          body: LoadingWrap(
            loadingState: state.loadingState,
            successChild: Builder(
              builder: (context) {
                return _buildBody(state, dispatch, viewService);
              },
            ),
            onErrorTap: () =>
                dispatch(PlaylistDetailActionCreator.onTapErrorAction()),
          ),
        ),
      ],
    ),
  );
}

GpAppBar _buildAppbar(
    PlaylistDetailState state, Dispatch dispatch, ViewService viewService) {
  return GpAppBar(
    title: Stack(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          child: Text(
            '歌单',
            style: GpOtherTheme.size17(viewService.context)!
                .copyWith(color: CommonColors.onPrimaryTextColor),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Image.asset(
            "assets/images/cm7_playlist_registered_trademark~iphone.png",
            color: CommonColors.textColor999,
            width: 10,
            height: 10,
          ),
        )
      ],
    ),
    leadingColors: CommonColors.onPrimaryTextColor,
    elevation: 0,
    backgroundColor: Colors.transparent,
    actions: [
      GestureDetector(
        onTap: () {},
        child: Image.asset(
          "assets/images/bar_navi_icn_search~iphone.png",
          color: Colors.white,
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: Image.asset(
          "assets/images/cm8_my_music_more_playlist~iphone.png",
          color: Colors.white,
        ),
      )
    ],
  );
}

Widget _buildBody(
    PlaylistDetailState state, Dispatch dispatch, ViewService viewService) {
  return CustomScrollView(
    shrinkWrap: true,
    slivers: [
      SliverToBoxAdapter(
        child: Container(
          width: double.infinity,
//          height: 300,
          child: PlaylistDetailHeaderWidget(
            stage: state.squareWrap?.playlist,
          ),
        ),
      ),
      _buildStickyBar(state, dispatch, viewService),
      _buildList(state, dispatch, viewService)
    ],
  );
}

Widget _buildStickyBar(
    PlaylistDetailState state, Dispatch dispatch, ViewService viewService) {
  return SliverPersistentHeader(
    pinned: true, //是否固定在顶部
    floating: true,
    delegate: SliverAppBarDelegate(
        minHeight: 50, //收起的高度
        maxHeight: 50, //展开的最大高度
        child: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    margin: EdgeInsets.only(left: 15, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        text: "播放全部",
                        style: GpOtherTheme.size15(viewService.context)!
                            .copyWith(
                                fontWeight: FontWeight.bold, fontSize: 18),
                        children: [
                          TextSpan(
                              text:
                                  " (${state.squareWrap?.playlist?.trackIds?.length ?? 0})",
                              style: GpOtherTheme.size13(viewService.context)!
                                  .copyWith(color: CommonColors.textColor999))
                        ]),
                  )
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
        )),
  );
}

Widget _buildList(
    PlaylistDetailState state, Dispatch dispatch, ViewService viewService) {
  return SliverList(
      delegate: SliverChildBuilderDelegate(
    (context, index) {
      DailySongItem item = state.squareWrap!.playlist!.tracks![index];
      return Container(
        color: Colors.white,
        child: SongItemWidget(
          item: item,
          dispatch: dispatch,
        ),
      );
    },
    childCount: state.squareWrap?.playlist?.tracks?.length ?? 0,
  ));
}
