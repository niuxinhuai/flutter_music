import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/podcast/models/detail_list.dart';
import 'package:flutter_music/sections/podcast/widget/detail_header.dart';
import 'package:flutter_music/sections/podcast/widget/detail_item.dart';
import 'package:flutter_music/sections/podcast/widget/detail_sticky_bar.dart';
import 'package:flutter_music/widgets/appbar.dart';
import 'package:flutter_music/widgets/effect.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';
import 'package:flutter_music/widgets/sliver/sliver_header.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    PodcastDetailState state, Dispatch dispatch, ViewService viewService) {
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
                dispatch(PodcastDetailActionCreator.onTapErrorAction()),
          ),
        ),
      ],
    ),
  );
}

GpAppBar _buildAppbar(
    PodcastDetailState state, Dispatch dispatch, ViewService viewService) {
  return GpAppBar(
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
    PodcastDetailState state, Dispatch dispatch, ViewService viewService) {
  return CustomScrollView(
    shrinkWrap: true,
    slivers: [
      SliverToBoxAdapter(
        child: Container(
          width: double.infinity,
//          height: 300,
          child: DetailHeaderWidget(
            wrap: state.detailWrap,
            playCount: state.playCount,
          ),
        ),
      ),
      _buildStickyBar(state, dispatch, viewService),
      _buildList(state, dispatch, viewService)
    ],
  );
}

Widget _buildStickyBar(
    PodcastDetailState state, Dispatch dispatch, ViewService viewService) {
  return SliverPersistentHeader(
    pinned: true, //是否固定在顶部
    floating: true,
    delegate: SliverAppBarDelegate(
        minHeight: 50, //收起的高度
        maxHeight: 50, //展开的最大高度
        child: DetailStickyWidget(
          count: state.items?.length,
        )),
  );
}

Widget _buildList(
    PodcastDetailState state, Dispatch dispatch, ViewService viewService) {
  return SliverList(
      delegate: SliverChildBuilderDelegate(
    (context, index) {
      DetailProgramsItem item = state.items![index];
      return Container(
        color: Colors.white,
        child: DjCatelistDetailItemWidget(
          item: item,
          dispatch: dispatch,
          rewardCount: state.detailWrap?.data?.dj?.rewardCount,
        ),
      );
    },
    childCount: state.items?.length ?? 0,
  ));
}
