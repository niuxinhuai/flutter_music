import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/sections/home/page/drawer/page.dart';
import 'package:flutter_music/sections/home/widget/search.dart';
import 'package:flutter_music/widgets/appbar.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';
import 'package:flutter_music/widgets/smart_drawer.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    PodcastState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: CommonColors.foregroundColor,
    key: state.globalKey,
    appBar: GpAppBar(
      elevation: 0,
      backgroundColor: CommonColors.backgroundColor,
      titleSpacing: 0,
      title: SearchWidget(),
      leading: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => dispatch(PodcastActionCreator.onTapLeadingAction()),
        child: Container(
          width: 44,
          height: 44,
          child: Image.asset(
              'assets/images/cm8_nav_icn_setting_normal~iphone.png'),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => dispatch(PodcastActionCreator.onTapNavActionAction()),
          child: Container(
            width: 44,
            height: 44,
            child:
                Image.asset('assets/images/cm4_applewatch_add_btn~iphone.png'),
          ),
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
      onErrorTap: () => dispatch(PodcastActionCreator.onTapErrorAction()),
    ),
  );
}

Widget _buildBody(
    PodcastState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter? adapter = viewService.buildAdapter();
  return ListView.builder(
    padding: EdgeInsets.only(top: 0, bottom: 20),
    physics: AlwaysScrollableScrollPhysics(),
    itemCount: adapter!.itemCount,
    itemBuilder: adapter.itemBuilder!,
  );
}
