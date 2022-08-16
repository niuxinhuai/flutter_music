import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/iconfont.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/sections/music/models/recommend.dart';
import 'package:flutter_music/sections/music/page/recommend_list/action.dart';

class SongItemWidget extends StatefulWidget {
  final DailySongItem? item;
  final Dispatch? dispatch;

  SongItemWidget({this.item, this.dispatch});

  @override
  _SongItemWidgetState createState() => _SongItemWidgetState();
}

class _SongItemWidgetState extends State<SongItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.dispatch != null) {
          widget.dispatch!(
              RecommendListActionCreator.onTapItemAction(widget.item!));
        }
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 10, left: 15, right: 15, top: 10),
        child: Container(
          child: Row(
            children: [
              ImageItemWidget(
                url: widget.item?.al?.picUrl,
                width: 50,
                height: 50,
                fit: BoxFit.fill,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.item?.name ?? "",
                            softWrap: true,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: GpOtherTheme.size17(context)!.copyWith(
                                color: CommonColors.onSurfaceTextColor),
                          ),
                          if (widget.item?.alia != null &&
                              widget.item?.alia?.isNotEmpty == true)
                            Expanded(
                                child: Text(
                              widget.item!.gettrackName(),
                              style: GpOtherTheme.size15(context)!
                                  .copyWith(color: CommonColors.textColor999),
                              softWrap: true,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            )),
                          if (widget.item?.reason != null)
                            _buildReasonWidget(widget.item!.reason!, context),
                        ],
                      ),
                      Row(
                        children: [
                          _buildIndicator(),
                          Expanded(
                              child: Text(
                            widget.item!.getSongString(),
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
                child: widget.item!.hasMV()
                    ? Image.asset(
                        'assets/images/cm6_list_tag_mv~iphone.png',
                        color: CommonColors.textColor999,
                      )
                    : Container(
                        width: 0,
                      ),
              ),
//          Icon(Icons.all_inclusive),
              Container(
                width: 30,
//            color: Colors.cyan,
                child: Icon(
                  IconF.music_menu,
                  color: CommonColors.textColor999,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIndicator() {
    if (widget.item!.canShowSQ()) {
      List<Widget> widgets = [];
      if (widget.item!.canShowVipState()) {
        widgets.add(_buildNormalIndicator("VIP"));

        if (widget.item!.canShowTryListening()) {
          widgets.add(_buildNormalIndicator("试听"));
        }
      }

      widgets.add(_buildNormalIndicator("SQ"));
      return Row(
        children: widgets.toList(),
      );
    }

    if (widget.item!.canShowNoRcmd()) {
      ///显示无音乐
      return _buildNormalIndicator("无音源", sq: false);
    }
    return Container(
      width: 0,
      height: 0,
    );
  }

  Widget _buildReasonWidget(String reason, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 4),
      decoration: BoxDecoration(
          color: Color(0xFFFDE1E1),
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      padding: EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 3),
      child: Text(
        reason,
        softWrap: true,
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: GpOtherTheme.size13(context)!.copyWith(color: Color(0xFFFC514E)),
      ),
//    child: Text(
//      reason,
//      style: ,
//    ),
    );
  }

  ///vip
  Widget _buildNormalIndicator(String text, {bool sq = true}) {
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
