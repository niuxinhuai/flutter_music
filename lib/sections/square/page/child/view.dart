import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
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
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildHeader(state, dispatch, viewService),
      Expanded(
          child: CustomRefreshIndicator(
        controller: state.refreshController,
        enablePullUp: state.loadNoMoreData! ? false : true,
        onLoading: () => dispatch(SquareChildActionCreator.onLoadingAction()),
        child: GridView.builder(
            itemCount: state.stages?.length ?? 0,
            physics: const AlwaysScrollableScrollPhysics(),
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 20),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 8, childAspectRatio: 0.7),
            itemBuilder: (BuildContext context, int index) {
              PlaylistStage stage = state.stages![index];
              return GestureDetector(
                onTap: () =>
                    dispatch(SquareChildActionCreator.onTapItemAction(stage)),
                child: SquareItemWidget(
                  stage: stage,
                ),
              );
            }),
      ))
    ],
  );
}

Widget _buildHeader(
    SquareChildState state, Dispatch dispatch, ViewService viewService) {
  if (state.tag == "精品") {
    String title = state.childCat?.isEmpty == true ? "全部精品" : state.childCat!;
    return Container(
      height: 70,
      color: CommonColors.foregroundColor,
      padding: const EdgeInsets.only(left: 15, right: 15),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GpOtherTheme.size15(viewService.context)!
                .copyWith(color: CommonColors.textColor666),
          ),
          GestureDetector(
            onTap: () => dispatch(SquareChildActionCreator.onFilterTapAction()),
            child: Row(
              children: [
                Container(
                  child: Image.asset(
                    'assets/images/cm_btn_filter~iphone.png',
                    color: CommonColors.textColor666,
                    width: 18,
                    height: 16,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Text(
                  "筛选",
                  style: GpOtherTheme.size15(viewService.context)!
                      .copyWith(color: CommonColors.textColor666),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  return Container(
    width: 0,
    height: 0,
  );
}
