import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/sections/search/models/search_result.dart';
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
          _buildListView(state, dispatch, viewService),
        TotalBottomWidget(
          text: state.item?.moreText,
        )
      ],
    ),
  );
}

Widget _buildListView(
    ArtistState state, Dispatch dispatch, ViewService viewService) {
  return ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    padding: EdgeInsets.only(left: 20, right: 20),
    itemCount: state.item?.artists?.length,
    itemBuilder: (BuildContext context, int index) {
      ArtistsItem artistsItem = state.item!.artists![index];
      return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: _buildItem(context, artistsItem),
      );
    },
  );
}

Widget _buildItem(BuildContext context, ArtistsItem artistsItem) {
  return Row(
    children: [
      Stack(
        children: [
          ImageItemWidget(
            url: artistsItem.img1v1Url,
            width: 50,
            height: 50,
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
          if (artistsItem.identityIconUrl != null)
            Positioned(
              bottom: 0,
              right: 0,
              child: CachedNetworkImage(
                width: 20,
                height: 20,
                imageUrl: artistsItem.identityIconUrl ?? "",
              ),
            )
        ],
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(text: artistsItem.name, children: [
                  if (artistsItem.alias != null &&
                      artistsItem.alias?.isNotEmpty == true)
                    TextSpan(
                        text: "（${artistsItem.alias!.join(" | ")}）",
                        style: GpOtherTheme.size15(context)!
                            .copyWith(color: CommonColors.textColor999)),
                ]),
                softWrap: true,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: GpOtherTheme.size15(context),
              ),
              Text(
                '粉丝：322.2 万',
                style: GpOtherTheme.size12(context)!
                    .copyWith(color: CommonColors.textColor999),
              )
            ],
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        padding: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
        child: Row(
          children: [
            Icon(
              Icons.add,
              color: Colors.red,
              size: 13,
            ),
            Text(
              "关注",
              style: GpOtherTheme.size13(context)!.copyWith(color: Colors.red),
            )
          ],
        ),
      )
    ],
  );
}
