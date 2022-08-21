import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/sections/podcast/models/podcast.dart';
import 'package:flutter_music/sections/podcast/page/podcast/action.dart';
import 'package:flutter_music/sections/podcast/widget/grid_item.dart';
import 'package:flutter_music/sections/podcast/widget/header.dart';

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
        GridView.builder(
            itemCount: stage.radios?.length ?? 0,
            physics: const NeverScrollableScrollPhysics(),
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 20),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                childAspectRatio: 0.73),
            itemBuilder: (BuildContext context, int index) {
              RadiosItem item = stage.radios![index];
              return GestureDetector(
                onTap: () =>
                    dispatch(PodcastActionCreator.onTapGridItemAction(item)),
                child: GridItemWidget(
                  item: item,
                ),
              );
            }),
      ],
    ),
  );
}
