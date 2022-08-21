import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/sections/podcast/models/podcast.dart';
import 'package:flutter_music/sections/podcast/widget/header.dart';
import 'package:flutter_music/sections/podcast/widget/row_item.dart';

Widget buildView(
    PodcastStage stage, Dispatch dispatch, ViewService viewService) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PodcastHeaderWidget(
          dispatch: dispatch,
          stage: stage,
        ),
        Container(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: stage.radios!
                .map((e) => RowItemWidget(
                      dispatch: dispatch,
                      item: e,
                    ))
                .toList(),
          ),
        ),
      ],
    ),
  );
}
