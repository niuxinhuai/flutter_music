import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/sections/music/widget/user_focus.dart';
import 'package:flutter_music/sections/village/models/source.dart';
import 'package:flutter_music/widgets/child/praised_widget.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';
import 'package:flutter_music/widgets/refresh_indicator.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    VideoWaterfallState state, Dispatch dispatch, ViewService viewService) {
  return LoadingWrap(
    loadingState: state.loadingState,
    successChild: Builder(
      builder: (context) {
        return _buildBody(state, dispatch, viewService);
      },
    ),
    onErrorTap: () => dispatch(VideoWaterfallActionCreator.onTapErrorAction()),
  );
}

Widget _buildBody(
    VideoWaterfallState state, Dispatch dispatch, ViewService viewService) {
  return CustomRefreshIndicator(
      controller: state.refreshController,
      enablePullUp: true,
      enablePullDown: true,
      onRefresh: () => dispatch(VideoWaterfallActionCreator.onRefreshAction()),
      onLoading: () => dispatch(VideoWaterfallActionCreator.onLoadingAction()),
      child: SingleChildScrollView(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: state.items!
                .map((e) => _buildItem(state, dispatch, viewService, e))
                .toList(),
          )));
}

Widget _buildItem(VideoWaterfallState state, Dispatch dispatch,
    ViewService viewService, VideoSourceItem item) {
  double width = MediaQuery.of(viewService.context).size.width;
  double imageWidth = (width - 3 * 10) / 2.0;
  double radio = (item.data?.height ?? 0.0) / (item.data?.width ?? 1.0);
  double imageHeight = radio * imageWidth;
  return GestureDetector(
    onTap: () => dispatch(VideoWaterfallActionCreator.onTapItemAction(item)),
    child: Container(
      width: imageWidth,
      decoration: BoxDecoration(
          color: CommonColors.foregroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(8.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ImageItemWidget(
                url: item.data?.coverUrl,
                fit: BoxFit.fitWidth,
//            width: imageWidth,
//            height: imageHeight,
              ),
              if (item.data?.vid != null)
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0))),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.data?.title ?? "",
                  style: GpOtherTheme.size17(viewService.context),
                  softWrap: true,
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: DetailUserFocusWidget(
                      hasFocus: true,
                      avatarUrl: item.data?.creator?.avatarUrl,
                      name: item.data?.creator?.nickname,
                    )),
                    PraisedWidget(
                      count: item.data?.praisedCount,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
