import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/sections/square/models/playlist.dart';
import 'package:flutter_music/sections/square/widget/item.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';
import 'package:flutter_music/widgets/refresh_indicator.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SquareChildState state, Dispatch dispatch, ViewService viewService) {
  return LoadingWrap(
    loadingState: state.loadingState,
    successChild: Builder(
      builder: (context) {
        return _buildBody(state, dispatch, viewService);
      },
    ),
    onErrorTap: () => dispatch(SquareChildActionCreator.onErrorTapAction()),
  );
}

Widget _buildBody(
    SquareChildState state, Dispatch dispatch, ViewService viewService) {
//  ListAdapter? adapter = viewService.buildAdapter();
  return CustomRefreshIndicator(
    controller: state.refreshController,
    enablePullUp: state.loadNoMoreData! ? false : true,
    onLoading: () => dispatch(SquareChildActionCreator.onLoadingAction()),
    child: GridView.builder(
        itemCount: state.stages?.length ?? 0,
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 20),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 8, childAspectRatio: 0.7),
        itemBuilder: (BuildContext context, int index) {
          PlaylistStage stage = state.stages![index];
          return SquareItemWidget(
            stage: stage,
          );
        }),
//    child: ListView.builder(
//      padding: EdgeInsets.only(top: 0, bottom: 20),
//      physics: AlwaysScrollableScrollPhysics(),
//      itemCount: state.squareWrap?.playlists?.length ?? 0,
//      itemBuilder: (BuildContext context, int index) {
//        return Container();
//      },
//    ),
  );
}
