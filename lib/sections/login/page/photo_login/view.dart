import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/widgets/appbar.dart';
import 'package:flutter_music/widgets/button.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    PhotoLoginState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: CommonColors.foregroundColor,
    appBar: GpAppBar(
      elevation: 0,
      title: Text('手机号登录'),
    ),
    body: _buildBody(state, dispatch, viewService),
  );
}

Widget _buildBody(
    PhotoLoginState state, Dispatch dispatch, ViewService viewService) {
  var border = UnderlineInputBorder();
  return Padding(
    padding: EdgeInsets.only(top: 0, left: 15, right: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
            controller: state.emailController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.streetAddress,
            decoration: InputDecoration(
                labelText: '请输入邮箱',
                border: border,
                suffix: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () =>
                      dispatch(PhotoLoginActionCreator.onTapClearAction()),
                ),
                contentPadding: EdgeInsets.all(8))),
        TextField(
          controller: state.passwordController,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
              labelText: '请输入密码',
              border: border,
              contentPadding: EdgeInsets.all(8)),
//          obscureText: state.hideText,
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 40),
          padding: EdgeInsets.only(left: 42, right: 43),
          child: GPRedCornerButton(
              child: Text('登录'),
              onPressed: () =>
                  dispatch(PhotoLoginActionCreator.onTapLoginAction())),
        )
      ],
    ),
  );
}
