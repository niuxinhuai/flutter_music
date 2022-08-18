import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/sections/application/models/application.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    ApplicationState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: PageView(
      physics: NeverScrollableScrollPhysics(),
      children: state.children.toList(),
      onPageChanged: (int index) =>
          dispatch(ApplicationActionCreator.onPageChangedAction(index)),
      controller: state.pageController,
    ),
    bottomNavigationBar: BottomNavigationBar(
      backgroundColor: CommonColors.foregroundColor,
      unselectedItemColor: CommonColors.textColor999,
      selectedItemColor: Colors.red,
      items: ApplicationModule.bottomTabs,
      currentIndex: state.page!,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) =>
          dispatch(ApplicationActionCreator.onTapAction(index)),
    ),
  );
}
