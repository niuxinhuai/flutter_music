import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/sections/search/widget/multimatch.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SearchResultTotalState state, Dispatch dispatch, ViewService viewService) {
  return LoadingWrap(
    loadingState: state.loadingState,
    successChild: Builder(
      builder: (context) {
        return _buildBody(state, dispatch, viewService);
      },
    ),
  );
}

Widget _buildBody(
    SearchResultTotalState state, Dispatch dispatch, ViewService viewService) {
  return SingleChildScrollView(
    padding: EdgeInsets.only(bottom: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (state.multimatchWrap?.result?.artist != null &&
            state.multimatchWrap?.result?.artist?.isNotEmpty == true)
          SearchMultimatchWidget(
            wrap: state.multimatchWrap,
            searchKey: state.text,
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: state.wrap!.result!.order!
              .map((e) => viewService.buildComponent(e))
              .toList(),
        )
      ],
    ),
  );
}
