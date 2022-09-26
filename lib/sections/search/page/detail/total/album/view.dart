import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/search/widget/album_list.dart';
import 'package:flutter_music/sections/search/widget/total_bottom.dart';
import 'package:flutter_music/widgets/card.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(AlbumState state, Dispatch dispatch, ViewService viewService) {
  return GpCard(
    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            "专辑",
            style: GpOtherTheme.size17(viewService.context)!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        if (state.item?.albums != null &&
            state.item?.albums?.isNotEmpty == true)
          SearchAlbumWidget(
            albums: state.item?.albums,
            searchKey: state.searchKey,
          ),
        TotalBottomWidget(
          text: state.item?.moreText,
        )
      ],
    ),
  );
}
