import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/sections/podcast/models/personalize.dart';
import 'package:flutter_music/utils/mathUtil.dart';

class CatelistChildItemWidget extends StatelessWidget {
  final PersonalizeItem? item;

  CatelistChildItemWidget({this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20, left: 10),
      child: Row(
        children: [
          ImageItemWidget(
            url: item?.picUrl,
            width: 90,
            height: 90,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item?.name ?? "",
                    softWrap: true,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: GpOtherTheme.size17(context),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3, bottom: 5),
                    child: Text(
                      item?.desc ?? "",
                      softWrap: true,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GpOtherTheme.size17(context)!.copyWith(
                          fontSize: 14, color: CommonColors.textColor999),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: _buildChildIconRow(item!.programCount!,
                            "cm6_square_feed_audio~iphone.png", context),
                      ),
                      _buildChildIconRow(item!.subCount!,
                          "cm6_square_feed_video~iphone.png", context),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildChildIconRow(int count, String assetName, BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/images/$assetName"),
        Text(
          MathUtils.getPlayNumberStr(count),
          style: GpOtherTheme.size13(context)!
              .copyWith(color: CommonColors.textColor999, fontSize: 12),
        )
      ],
    );
  }
}
