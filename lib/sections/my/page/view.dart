import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/widgets/appbar.dart';
//import 'package:hello/platform_view_test.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    UserCenterState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: GpAppBar(
      title: const Text("测试PlatformView"),
    ),
    body: _buildBody(),
  );
}

Widget _buildBody() {
  return Container();
//  return SafeArea(
//    child: Column(
//      children: [
//        Text("这里是flutter的Text"),
//        Expanded(
//          child: PlatformTextWidget(text: "123"),
//        ),
//        SizedBox(
//          width: 300,
//          height: 100,
//          child: PlatformTextWidget(
//            text: "这是原生的Text",
//          ),
//        ),
//        Text("这里是flutter的Text"),
//      ],
//    ),
//  );
}
