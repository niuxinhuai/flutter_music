import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/widgets/appbar.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    LeaderboardState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: CommonColors.backgroundColor,
    appBar: GpAppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        "排行榜",
        style: GpOtherTheme.size17(viewService.context)!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      elevation: 0,
      actions: [
        UnconstrainedBox(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  border: Border.all(color: CommonColors.textColor999)),
              child: Text(
                "定制首页榜单",
                style: GpOtherTheme.size13(viewService.context)!
                    .copyWith(color: CommonColors.onSurfaceTextColor),
              ),
            ),
          ),
        )
      ],
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
    LeaderboardState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter? adapter = viewService.buildAdapter();
  return ListView.builder(
    padding: EdgeInsets.only(top: 0, bottom: 20),
    physics: AlwaysScrollableScrollPhysics(),
    itemCount: adapter!.itemCount,
    itemBuilder: adapter.itemBuilder!,
  );
}
