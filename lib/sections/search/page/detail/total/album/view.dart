import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/Leaderboard/models/leaderboard.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/sections/search/widget/total_bottom.dart';
import 'package:flutter_music/utils/time_utl.dart';
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
          _buildListView(state, dispatch, viewService),
        TotalBottomWidget(
          text: state.item?.moreText,
        )
      ],
    ),
  );
}

Widget _buildListView(
    AlbumState state, Dispatch dispatch, ViewService viewService) {
  return ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    padding: EdgeInsets.only(left: 20, right: 20),
    itemCount: state.item?.albums?.length,
    itemBuilder: (BuildContext context, int index) {
      BoardListItem artistsItem = state.item!.albums![index];
      return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: _buildItem(context, artistsItem),
      );
    },
  );
}

Widget _buildItem(BuildContext context, BoardListItem item) {
  return Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Image.asset(
            "assets/images/ic_play_share_listen_together_blackcover~iphone.png",
            width: 40,
            height: 40,
          ),
          Container(
//            color: Colors.cyan,
            margin: EdgeInsets.only(top: 5),
            child: ImageItemWidget(
              url: item.picUrl,
              width: 50,
              height: 50,
            ),
          )
        ],
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name ?? "",
                style:
                    GpOtherTheme.size15(context)!.copyWith(color: Colors.blue),
              ),
              Row(
                children: [
                  Text(
                    item.artist?.name ?? "",
                    style: GpOtherTheme.size12(context)!
                        .copyWith(color: CommonColors.textColor999),
                  ),
                  Text(
                    TimeUtils.getFormat2(time: item.publishTime),
                    style: GpOtherTheme.size12(context)!.copyWith(
                        color: CommonColors.textColor999, fontSize: 10),
                  )
                ],
              )
            ],
          ),
        ),
      )
    ],
  );
}
