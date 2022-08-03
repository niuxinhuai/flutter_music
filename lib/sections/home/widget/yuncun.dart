import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/models/home.dart';
import 'package:flutter_music/sections/home/page/action.dart';
import 'package:flutter_music/sections/home/widget/image.dart';

class YuncunItemWidget extends StatelessWidget {
  final double? imageSize;
  final CreativesItem? item;
  final Dispatch? dispatch;

  YuncunItemWidget({this.item, this.imageSize, this.dispatch});

  @override
  Widget build(BuildContext context) {
    if (item?.resources == null || item?.resources?.isEmpty == true) {
      return Container(
        width: 0,
        height: 0,
      );
    }

    ResourcesItem resourcesItem = item!.resources!.first;
    return GestureDetector(
      onTap: () {
        if (dispatch != null) {
          dispatch!(
              HomeMusicActionCreator.onTapYuncunItemAction(resourcesItem));
        }
      },
      child: Container(
        width: imageSize,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageItemWidget(
              url: resourcesItem.uiElement?.image?.imageUrl ?? "",
              fit: BoxFit.fill,
              width: imageSize,
              height: 100,
            ),
            Container(
              height: 42,
              padding: EdgeInsets.only(top: 3),
              child: Text(
                resourcesItem.uiElement?.mainTitle?.title ?? "",
                maxLines: 2,
                style: GpOtherTheme.size13(context)!
                    .copyWith(color: CommonColors.onSurfaceTextColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
