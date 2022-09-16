import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/sections/search/widget/total_song.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SingerState state, Dispatch dispatch, ViewService viewService) {
  return SearchTotalSongWidget(
    item: state.item,
  );
}
