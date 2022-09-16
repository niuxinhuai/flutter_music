import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/sections/Leaderboard/models/leaderboard.dart';
import 'package:flutter_music/sections/Leaderboard/models/toplist.dart';
import 'package:flutter_music/sections/Leaderboard/page/action.dart';
import 'package:flutter_music/sections/home/widget/image.dart';

class GridCountWidget extends StatelessWidget {
  final int? count;
  final ToplistDetailSection? section;
  final Dispatch? dispatch;

  GridCountWidget({this.count = 3, this.section, this.dispatch});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: section?.items.length ?? 0,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 15, bottom: 20, right: 15, left: 15),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.0),
        itemBuilder: (BuildContext context, int index) {
          BoardListItem item = section!.items[index];
          return _buildWidget(context, item);
        });
  }

  Widget _buildWidget(BuildContext context, BoardListItem item) {
    return GestureDetector(
      onTap: () {
        if (dispatch != null) {
          dispatch!(LeaderboardActionCreator.onTapGridItemAction(item));
        }
      },
      child: ImageItemWidget(
        url: item.coverImgUrl,
      ),
    );
  }
}
