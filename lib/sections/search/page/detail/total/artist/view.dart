import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/sections/search/models/search_result.dart';
import 'package:flutter_music/sections/search/widget/artist_list.dart';
import 'package:flutter_music/sections/search/widget/total_bottom.dart';
import 'package:flutter_music/widgets/card.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ArtistState state, Dispatch dispatch, ViewService viewService) {
  return GpCard(
    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            "艺人",
            style: GpOtherTheme.size17(viewService.context)!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        if (state.item?.artists != null &&
            state.item?.artists?.isNotEmpty == true)
          //state.item?.artists
          SearchArtistWidget(
            artists: state.item?.artists,
          ),
        TotalBottomWidget(
          text: state.item?.moreText,
        )
      ],
    ),
  );
}
