import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/sections/podcast/models/personalize.dart';
import 'package:flutter_music/sections/podcast/page/podcast/action.dart';
import 'package:flutter_music/sections/podcast/widget/header.dart';
import 'package:flutter_music/sections/podcast/widget/personal_item.dart';

Widget buildView(
    PersonalizeWrap wrap, Dispatch dispatch, ViewService viewService) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PodcastHeaderWidget(
          dispatch: dispatch,
          wrap: wrap,
        ),
        GridView.builder(
            itemCount: wrap.data?.length ?? 0,
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
              PersonalizeItem item = wrap.data![index];
              return GestureDetector(
                onTap: () => dispatch(
                    PodcastActionCreator.onTapPersonalItemAction(item)),
                child: PersonalItemWidget(
                  dispatch: dispatch,
                  item: item,
                ),
              );
            }),
      ],
    ),
  );
}
