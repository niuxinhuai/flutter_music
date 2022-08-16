import 'dart:math';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/iconfont.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/sections/music/models/recommend.dart';
import 'package:flutter_music/sections/music/widget/song_item.dart';
import 'package:flutter_music/widgets/appbar.dart';
import 'package:flutter_music/widgets/effect.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';
import 'package:flutter_music/widgets/sliver/sliver_header.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    RecommendListState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: CommonColors.foregroundColor,
    appBar: GpAppBar(
      elevation: 0,
      title: Text("每日推荐"),
    ),
    body: LoadingWrap(
      loadingState: state.loadingState,
      successChild: Builder(
        builder: (context) {
          return _buildBody(state, dispatch, viewService);
        },
      ),
    ),
  );
}

Widget _buildBody(
    RecommendListState state, Dispatch dispatch, ViewService viewService) {
  return CustomScrollView(
    slivers: [
      _buildBgView(state, dispatch, viewService),
      _buildStickyBar(state, dispatch, viewService),
      _buildList(state, dispatch, viewService)
    ],
  );
}

Widget _buildBgView(
    RecommendListState state, Dispatch dispatch, ViewService viewService) {
  return SliverToBoxAdapter(
    child: Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
          image: DecorationImage(
        image:
            NetworkImage(state.wrap!.data!.dailySongs!.first.al?.picUrl ?? ""),
        fit: BoxFit.fill,
      )),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0,
                0.7,
                1
              ],
              colors: [
                Colors.transparent,
                Colors.white.withOpacity(0.5),
                Colors.white
              ]),
        ),
      ),
    ),
  );
}

Widget _buildStickyBar(
    RecommendListState state, Dispatch dispatch, ViewService viewService) {
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
        )),
  );
}

Widget _buildList(
    RecommendListState state, Dispatch dispatch, ViewService viewService) {
  return SliverList(
      delegate: SliverChildBuilderDelegate(
    (context, index) {
      DailySongItem item = state.wrap!.data!.dailySongs![index];
      return SongItemWidget(
        item: item,
        dispatch: dispatch,
      );
    },
    childCount: state.wrap?.data?.dailySongs?.length ?? 0,
  ));
}
