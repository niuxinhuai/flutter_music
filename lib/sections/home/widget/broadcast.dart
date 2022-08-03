import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/models/home.dart';
import 'package:flutter_music/sections/home/page/action.dart';
import 'package:flutter_music/sections/home/widget/image.dart';

class BroadcastItemWidget extends StatelessWidget {
  final ResourcesItem? item;
  final double? itemSize;
  final Dispatch? dispatch;

  BroadcastItemWidget({this.item, this.itemSize, this.dispatch});

  @override
  Widget build(BuildContext context) {
    if (item?.uiElement == null) {
      return Container(
        width: 0,
        height: 0,
      );
    }
    return GestureDetector(
      onTap: () {
        if (dispatch != null) {
          dispatch!(HomeMusicActionCreator.onTapBroadcastItemAction(item!));
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageItemWidget(
            url: item!.uiElement!.image?.imageUrl ?? "",
            width: itemSize,
            height: itemSize,
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: itemSize,
            height: 42,
            child: Text(
              item!.uiElement?.mainTitle?.title ?? "",
              maxLines: 2,
              style: GpOtherTheme.size13(context)!.copyWith(
                  color: CommonColors.onPrimaryTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
