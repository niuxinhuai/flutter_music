import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/iconfont.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/music/models/recommend.dart';
import 'package:flutter_music/sections/search/models/search_result.dart';
import 'package:flutter_music/sections/search/widget/total_bottom.dart';
import 'package:flutter_music/widgets/card.dart';

class SearchTotalSongWidget extends StatelessWidget {
  final SearchResultItem? item;

  SearchTotalSongWidget({this.item});

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
            _buildList(context),
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

  Widget _buildList(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: item?.songs?.length,
      padding: EdgeInsets.only(left: 20, right: 20),
      itemBuilder: (BuildContext context, int index) {
        DailySongItem songItem = item!.songs![index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 1,
              color: CommonColors.divider,
            ),
            Padding(
              padding: EdgeInsets.only(top: 12, bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRowWidget(context, songItem),
                  if (songItem.officialTags != null &&
                      songItem.officialTags?.isNotEmpty == true)
                    Row(
                      children: songItem.officialTags!
                          .map((e) => Container(
                                decoration: BoxDecoration(
                                  color: Colors.orange.withOpacity(0.1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                ),
                                padding: EdgeInsets.all(3.0),
                                margin: EdgeInsets.only(right: 10),
                                child: Text(
                                  e,
                                  style: GpOtherTheme.size12(context)!.copyWith(
                                      fontSize: 9, color: Colors.orange),
                                ),
                              ))
                          .toList(),
                    )
                ],
              ),
            )
          ],
        );
      },
    );
  }

  Widget _buildRowWidget(BuildContext context, DailySongItem songItem) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  songItem.name ?? "",
                  softWrap: true,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GpOtherTheme.size17(context)!
                      .copyWith(color: Colors.blue),
                ),
                Row(
                  children: [
                    _buildIndicator(songItem, context),
                    Expanded(
                        child: Text(
                      songItem.getSongString(),
                      softWrap: true,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GpOtherTheme.size13(context)!
                          .copyWith(color: CommonColors.textColor999),
                    ))
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          width: 40,
          height: 40,
//            color: Colors.red,
          child: songItem.hasMV()
              ? Image.asset(
                  'assets/images/cm6_list_tag_mv~iphone.png',
                  color: CommonColors.textColor999,
                )
              : Container(
                  width: 0,
                ),
        ),
        Container(
          width: 30,
//            color: Colors.cyan,
          child: Icon(
            IconF.music_menu,
            color: CommonColors.textColor999,
          ),
        )
      ],
    );
  }

  Widget _buildIndicator(DailySongItem songItem, BuildContext context) {
    if (songItem.canShowSQ()) {
      List<Widget> widgets = [];

      if (songItem.canShowAuthSinger()) {
        widgets.add(_buildNormalIndicator(context, "原唱"));
      }

      if (songItem.canShowVipState()) {
        widgets.add(_buildNormalIndicator(context, "VIP"));

        if (songItem.canShowTryListening()) {
          widgets.add(_buildNormalIndicator(context, "试听"));
        }
      }

      widgets.add(_buildNormalIndicator(context, "SQ"));
      return Row(
        children: widgets.toList(),
      );
    }

    if (songItem.canShowNoRcmd()) {
      ///显示无音乐
      return _buildNormalIndicator(context, "无音源", sq: false);
    }
    return Container(
      width: 0,
      height: 0,
    );
  }

  ///vip
  Widget _buildNormalIndicator(BuildContext context, String text,
      {bool sq = true}) {
    return Container(
      padding: EdgeInsets.only(left: 1, right: 1),
      margin: EdgeInsets.only(right: 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
          border:
              Border.all(color: sq ? Colors.red : CommonColors.textColor999)),
      child: Text(
        text,
        style: GpOtherTheme.size12(context)!.copyWith(
            color: sq ? Colors.red : CommonColors.textColor999, fontSize: 8),
      ),
    );
  }
}
