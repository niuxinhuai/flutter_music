import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/sections/podcast/models/podcast.dart';
import 'package:flutter_music/utils/mathUtil.dart';

class RowItemWidget extends StatelessWidget {
  final Dispatch? dispatch;
  final RadiosItem? item;

  RowItemWidget({this.item, this.dispatch});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageItemWidget(
            url: item?.picUrl,
            width: 80,
            height: 80,
            fit: BoxFit.fill,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item?.rcmdText ?? "",
                    style: GpOtherTheme.size17(context),
                    maxLines: 2,
                  ),
                  _buildIndicator(context),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            item?.name ?? "",
                            style: GpOtherTheme.size14(context)
                                .copyWith(color: CommonColors.textColor999),
                          ),
                          constraints: BoxConstraints(maxWidth: 180),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: _buildChildIconRow(item!.playCount!,
                              "cm6_square_feed_video~iphone.png", context),
                        ),
                        _buildChildIconRow(item!.programCount!,
                            "cm6_square_feed_audio~iphone.png", context),
                      ],
                    ),
                  )
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

  Widget _buildIndicator(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
          border: Border.all(color: CommonColors.textColor999)),
      child: Text(
        "情感故事",
        style: GpOtherTheme.size13(context)!
            .copyWith(color: CommonColors.textColor999, fontSize: 11),
      ),
    );
  }
}
