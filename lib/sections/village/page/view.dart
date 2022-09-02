import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/sections/home/page/drawer/page.dart';
import 'package:flutter_music/sections/home/widget/search.dart';
import 'package:flutter_music/sections/village/page/child/page.dart';
import 'package:flutter_music/widgets/appbar.dart';
import 'package:flutter_music/widgets/child/nav_add.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';
import 'package:flutter_music/widgets/segment.dart';
import 'package:flutter_music/widgets/smart_drawer.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    VillageState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: CommonColors.backgroundColor,
    key: state.globalKey,
    appBar: GpAppBar(
      elevation: 0,
      backgroundColor: CommonColors.backgroundColor,
      titleSpacing: 0,
      title: SearchWidget(),
      leading: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => dispatch(VillageActionCreator.onTapLeadingAction()),
        child: Container(
          width: 44,
          height: 44,
          child: Image.asset(
              'assets/images/cm8_nav_icn_setting_normal~iphone.png'),
        ),
      ),
      actions: [
        NavAddWidget(
          callback: () => dispatch(VillageActionCreator.onTapNavAction()),
        )
      ],
    ),
    drawer: SmartDrawer(
      widthPercent: 0.8,
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
      onErrorTap: () => dispatch(VillageActionCreator.onTapErrorAction()),
    ),
  );
}

Widget _buildBody(
    VillageState state, Dispatch dispatch, ViewService viewService) {
  if (state.categoryWrap?.data != null &&
      state.categoryWrap?.data?.isNotEmpty == true) {
    return TabBarSegmentController(
      tabTitles: state.categoryWrap!.data!.map((e) => e.name ?? "").toList(),
      children: state.categoryWrap!.data!
          .map((e) => VideoWaterfallPage().buildPage({"id": e.id}))
          .toList(),
      useScaffold: false,
    );
  }
  return Container(
    width: 0,
    height: 0,
  );
}
