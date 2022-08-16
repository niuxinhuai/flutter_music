import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/widgets/appbar.dart';
import 'package:flutter_music/widgets/button.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(LoginState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    color: CommonColors.foregroundColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTop(state, dispatch, viewService),
        _buildContent(state, dispatch, viewService),
      ],
    ),
  );
}

Widget _buildTop(LoginState state, Dispatch dispatch, ViewService viewService) {
  double height = MediaQuery.of(viewService.context).size.height;
  double size = height / 3.0;

  return Stack(
    children: [
      Image.asset(
        'assets/images/att_pupup_kol_pic_bg~iphone.png',
        fit: BoxFit.fill,
        width: double.infinity,
        height: size,
      ),
      Container(
        width: double.infinity,
        height: size,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/icon_logo.png',
              width: 80,
              height: 80,
            )
          ],
        ),
      ),
      GpAppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingColors: Colors.white,
        leadingAction: () {
          print(">>>>>>>>>点击le返回键");
          dispatch(LoginActionCreator.onLeadingAction());
        },
      ),
    ],
  );
}

Widget _buildContent(
    LoginState state, Dispatch dispatch, ViewService viewService) {
  return Expanded(
    child: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          padding: EdgeInsets.only(left: 42, right: 43),
          width: double.infinity,
          child: GPRedCornerButton(
            child: Text("邮箱登录"),
            onPressed: () => dispatch(LoginActionCreator.onTapLoginAction()),
          ),
        ),
        Positioned(
          bottom: 50,
          child: Row(
            children: state.assets
                .map((e) => _buildIcon(state, dispatch, viewService, e))
                .toList(),
          ),
        )
      ],
    ),
  );
}

Widget _buildIcon(LoginState state, Dispatch dispatch, ViewService viewService,
    String asset) {
  bool last = state.assets.last == asset;
  return Container(
    width: 36,
    height: 36,
    margin: EdgeInsets.only(right: last ? 0 : 15),
    decoration: BoxDecoration(
        border: Border.all(color: CommonColors.divider),
        borderRadius: BorderRadius.all(Radius.circular(18.0))),
    child: Image.asset(
      'assets/images/$asset',
    ),
  );
}
