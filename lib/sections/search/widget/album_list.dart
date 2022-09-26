import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/Leaderboard/models/leaderboard.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/utils/time_utl.dart';
import 'package:flutter_music/widgets/search_text.dart';

class SearchAlbumWidget extends StatelessWidget {
  final List<BoardListItem>? albums;
  final String? searchKey;

  SearchAlbumWidget({this.albums, this.searchKey});
  @override
  Widget build(BuildContext context) {
    return _buildListView(context);
  }

  Widget _buildListView(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(left: 20, right: 20),
      itemCount: albums?.length,
      itemBuilder: (BuildContext context, int index) {
        BoardListItem artistsItem = albums![index];
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
                CustomSearchText(
                  searchContent: item.name,
                  searchKey: searchKey,
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
}
