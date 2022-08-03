import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/models/home.dart';
import 'package:flutter_music/sections/home/page/action.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/utils/time_utl.dart';

class CalendarItemWidget extends StatelessWidget {
  final ResourcesItem? item;
  final Dispatch? dispatch;

  CalendarItemWidget({this.item, this.dispatch});

  @override
  Widget build(BuildContext context) {
    double endTime = item?.resourceExtInfo?.endTime ?? 0;

    return GestureDetector(
      onTap: () {
        if (dispatch != null) {
          dispatch!(HomeMusicActionCreator.onTapCalendarItemAction(item!));
        }
      },
      child: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      TimeUtils.timeByString(endTime.ceil()),
                      style: GpOtherTheme.size12(context)!
                          .copyWith(color: CommonColors.textColor999),
                    ),
                    _buildIndicator(context)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    item?.uiElement?.mainTitle?.title ?? "",
                    softWrap: true,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: GpOtherTheme.size17(context),
                  ),
                ),
              ],
            )),
            _buildSubscriptionWidget(context),
            ImageItemWidget(
              url: item?.uiElement?.image?.imageUrl,
              width: 70,
              height: 70,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildIndicator(BuildContext context) {
    String? text = item?.uiElement?.labelTexts?.join("");
    if (text == null) {
      return Container(
        width: 0,
        height: 0,
      );
    }
    return Container(
      margin: EdgeInsets.only(left: 10),
      padding: EdgeInsets.only(left: 3, right: 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          color: Color(0xFFFEF8F5)),
      child: Text(
        text,
        style: GpOtherTheme.size12(context)!.copyWith(color: Color(0xFFFE9955)),
      ),
    );
  }

  Widget _buildSubscriptionWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 15, left: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 30,
            height: 30,
            margin: EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
                border: Border.all(color: CommonColors.divider),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Icon(Icons.lock_clock),
          ),
          Text(
            "62",
            style: GpOtherTheme.size12(context)!
                .copyWith(color: CommonColors.textColor999),
          )
        ],
      ),
    );
  }
}
