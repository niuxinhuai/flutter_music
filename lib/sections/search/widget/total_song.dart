import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/iconfont.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/music/models/recommend.dart';
import 'package:flutter_music/sections/search/models/search_result.dart';
import 'package:flutter_music/sections/search/widget/singer_list.dart';
import 'package:flutter_music/sections/search/widget/total_bottom.dart';
import 'package:flutter_music/utils/span_util.dart';
import 'package:flutter_music/widgets/card.dart';
import 'package:flutter_music/widgets/search_text.dart';

class SearchTotalSongWidget extends StatelessWidget {
  final SearchResultItem? item;
  final String? searchKey;

  SearchTotalSongWidget({this.item, this.searchKey});

  @override
  Widget build(BuildContext context) {
    if (item == null) {
      return Container();
    }
    return GpCard(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
            child: _buildHeader(context),
          ),
          if (item?.songs != null && item?.songs?.isNotEmpty == true)
            SearchSingerWidget(
              songs: item!.songs,
              searchKey: searchKey,
            ),
          TotalBottomWidget(
            text: item?.moreText,
          )
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "单曲",
          style: GpOtherTheme.size17(context)!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        _buildPlayWidget(context)
      ],
    );
  }

  Widget _buildPlayWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: CommonColors.divider),
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      padding: EdgeInsets.only(left: 10, right: 10, top: 1, bottom: 1),
      child: Row(
        children: [
          Icon(
            Icons.play_arrow,
            color: Colors.black,
          ),
          Text(
            "播放",
            style: GpOtherTheme.size13(context)!
                .copyWith(color: CommonColors.onSurfaceTextColor),
          )
        ],
      ),
    );
  }
}
