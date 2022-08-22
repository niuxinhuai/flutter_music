import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/sections/music/widget/detail_sheet.dart';
import 'package:flutter_music/sections/podcast/models/detail_list.dart';
import 'package:flutter_music/sections/podcast/page/detail/action.dart';
import 'package:flutter_music/sections/podcast/widget/message_sheet.dart';
import 'package:flutter_music/utils/mathUtil.dart';
import 'package:flutter_music/utils/time_utl.dart';

class DjCatelistDetailItemWidget extends StatefulWidget {
  final DetailProgramsItem? item;
  //被赞赏次数
  final int? rewardCount;
  final Dispatch? dispatch;

  DjCatelistDetailItemWidget({this.item, this.dispatch, this.rewardCount});

  @override
  _DjCatelistDetailItemWidgetState createState() =>
      _DjCatelistDetailItemWidgetState();
}

class _DjCatelistDetailItemWidgetState
    extends State<DjCatelistDetailItemWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        if (widget.dispatch != null) {
          widget.dispatch!(
              PodcastDetailActionCreator.onTapItemAction(widget.item!));
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
        child: Row(
          children: [
            ImageItemWidget(
              url: widget.item?.coverUrl,
              width: 80,
              height: 80,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item?.name ?? "",
                      style: GpOtherTheme.size17(context),
                      maxLines: 2,
                      softWrap: true,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Text(
                          TimeUtils.getFormat1(
                              time: widget.item?.createTime ?? 0),
                          style: GpOtherTheme.size12(context)!
                              .copyWith(color: CommonColors.textColor999),
                        ),
                        _buildRowIcon(
                            MathUtils.getPlayNumberStr(
                                widget.item?.listenerCount ?? 0),
                            "cm4_discover_play_cnt_icn~iphone.png"),
                        _buildRowIcon(
                            TimeUtils.getMinuteFromMillSecond(
                                widget.item?.duration ?? 0),
                            "cm2_list_search_time~iphone.png")
                      ],
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                print(">>>>>>>>>>点击了");
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return PodcastDetailMessageSheet(
                        item: widget.item,
                        rewardCount: widget.rewardCount,
                        width: size.width,
                      );
                    },
                    backgroundColor: Colors.transparent);
              },
              child: Container(
                width: 30,
                height: 30,
//                color: Colors.cyan,
                child: Image.asset(
                  "assets/images/cm8_my_music_more_playlist~iphone.png",
                  color: CommonColors.textColor999,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRowIcon(String text, String imgName) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, right: 4),
          child: Image.asset(
            "assets/images/$imgName",
            width: 10,
            color: CommonColors.textColor999,
          ),
        ),
        Text(
          text,
          style: GpOtherTheme.size12(context)!
              .copyWith(color: CommonColors.textColor999),
        )
      ],
    );
  }
}
