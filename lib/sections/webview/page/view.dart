import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/widgets/webview.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CustomWebViewState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text('这是webview'),
    ),
    body: Stack(
      children: [
        WebViewWidget(
          url: state.url,
          onProgress: (int progress) =>
              dispatch(CustomWebViewActionCreator.onProgressAction(progress)),
          onPageFinished: (String url) =>
              dispatch(CustomWebViewActionCreator.onPageFinishedAction(url)),
        ),
        if (state.showProgress)
          LinearProgressIndicator(
            backgroundColor: Colors.grey,
            valueColor: new AlwaysStoppedAnimation(Colors.blue),
            value: state.progress.toDouble() * 0.01,
          )
      ],
    ),
  );
}
