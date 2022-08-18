import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/sections/music/widget/play_count.dart';
import 'package:flutter_music/sections/podcast/models/personalize.dart';

class PersonalItemWidget extends StatelessWidget {
  final Dispatch? dispatch;
  final PersonalizeItem? item;

  PersonalItemWidget({this.dispatch, this.item});

  @override
  Widget build(BuildContext context) {
    return _buildlSingleItem(context);
  }

  Widget _buildlSingleItem(BuildContext context) {
    return Container(
//        color: CommonColors.randomColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              if (item?.picUrl != null)
                ImageItemWidget(
                  url: item?.picUrl,
                ),
              if (item?.subCount != null)
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 30,
                        height: 10,
                      ),
                      _buildCount(context, item!.subCount!)
                    ],
                  ),
                )
            ],
          ),
          Container(
            height: 42,
            padding: EdgeInsets.only(top: 3),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: item!.secondCategory!,
                  style: GpOtherTheme.size13(context)!.copyWith(
                      color: CommonColors.textColor999,
                      fontSize: 8,
                      background: Paint()
                        ..style = PaintingStyle.stroke
                        ..color = CommonColors.textColor999),
                ),
                TextSpan(
                    text: " ${item?.name ?? ""}",
                    style: GpOtherTheme.size13(context)!
                        .copyWith(color: CommonColors.onSurfaceTextColor))
              ]),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildIndicator(BuildContext context, String text) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
          border: Border.all(color: CommonColors.textColor999)),
      child: Text(
        text,
        style: GpOtherTheme.size13(context)!
            .copyWith(color: CommonColors.textColor999, fontSize: 8),
      ),
    );
  }

  ///count
  Widget _buildCount(BuildContext context, int count) {
    return PlayCountWidget(
      count: count,
    );
  }
}
