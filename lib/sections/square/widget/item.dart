import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/sections/square/models/playlist.dart';
import 'package:flutter_music/sections/square/models/recommend.dart';
import 'package:flutter_music/utils/mathUtil.dart';

class SquareItemWidget extends StatefulWidget {
  final PlaylistStage? stage;
  final double? size;
  final SquareRecommendItem? recommendItem;

  SquareItemWidget({this.stage, this.recommendItem, this.size});

  @override
  _SquareItemWidgetState createState() => _SquareItemWidgetState();
}

class _SquareItemWidgetState extends State<SquareItemWidget> {
  int count = 0;
  String pic = "";
  String name = "";

  @override
  void initState() {
    super.initState();

    if (widget.stage != null) {
      count = widget.stage?.playCount ?? 0;
      pic = widget.stage?.coverImgUrl ?? "";
      name = widget.stage?.name ?? "";
    } else if (widget.recommendItem != null) {
      count = widget.recommendItem?.playcount ?? 0;
      pic = widget.recommendItem?.picUrl ?? "";
      name = widget.recommendItem?.name ?? "";
      if (count == 0) {
        count = widget.recommendItem?.playCount ?? 0;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ImageItemWidget(
                url: pic,
                fit: BoxFit.fill,
                width: widget.size,
                height: widget.size,
              ),
              Positioned(
                right: 0,
                top: 0,
                child: _buildCount(context, count),
              )
            ],
          ),
          if (widget.recommendItem != null)
            Container(
              height: 42,
              padding: EdgeInsets.only(top: 3),
              child: Text(
                name,
                maxLines: 2,
                style: GpOtherTheme.size13(context)!
                    .copyWith(color: CommonColors.onSurfaceTextColor),
              ),
            ),
          if (widget.stage != null)
            Padding(
              padding: EdgeInsets.only(top: 3),
              child: Text(
                name,
                maxLines: 2,
                softWrap: true,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: GpOtherTheme.size13(context)!.copyWith(
                    color: CommonColors.onSurfaceTextColor,
//              fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
            )
        ],
      ),
    );
  }

  ///count
  Widget _buildCount(BuildContext context, int count) {
    return Container(
      padding: const EdgeInsets.only(left: 4, right: 4, top: 1, bottom: 1),
      margin: const EdgeInsets.only(right: 4, top: 3),
      decoration: BoxDecoration(
          color: Color(0xFF848484).withOpacity(0.8),
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: Row(
        children: [
          Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 19,
          ),
          Text(
            MathUtils.getPlayNumberStr(count),
            style: GpOtherTheme.size13(context)!
                .copyWith(color: CommonColors.onPrimaryTextColor, fontSize: 12),
          )
        ],
      ),
    );
  }
}
