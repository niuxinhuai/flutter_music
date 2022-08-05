import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/page/drawer/page.dart';
import 'package:flutter_music/widgets/appbar.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';
import 'package:flutter_music/widgets/refresh_indicator.dart';
import 'package:flutter_music/widgets/smart_drawer.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    HomeMusicState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    key: state.globalKey,
    appBar: GpAppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      titleSpacing: 0,
      title: Container(
        height: 44,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(22)),
            color: CommonColors.foregroundColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search),
            Text(
              "多远都要在一起~",
              style: GpOtherTheme.size15(viewService.context)!
                  .copyWith(color: CommonColors.textColor999),
            )
          ],
        ),
      ),
      leading: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => dispatch(HomeMusicActionCreator.onTapLeadingAction()),
        child: Container(
          width: 44,
          height: 44,
          child: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      actions: [
        Container(
          width: 44,
          height: 44,
          child: Icon(
            Icons.mic,
            color: Colors.black,
          ),
        )
      ],
    ),
    drawer: SmartDrawer(
      widthPercent: 0.7,
      semanticLabel: "Label",
      child: HomeDrawerPage().buildPage({}),
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
    HomeMusicState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter? adapter = viewService.buildAdapter();
  return CustomRefreshIndicator(
    controller: state.refreshController,
    enablePullUp: false,
    enablePullDown: true,
    onRefresh: () => dispatch(HomeMusicActionCreator.onRefreshAction()),
    child: ListView.builder(
      padding: EdgeInsets.only(top: 0, bottom: 20),
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: adapter!.itemCount,
      itemBuilder: adapter.itemBuilder!,
    ),
  );
}