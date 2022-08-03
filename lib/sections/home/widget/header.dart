import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/models/home.dart';
import 'package:flutter_music/sections/home/page/action.dart';

class RHeaderWidget extends StatelessWidget {
  final MusicItem? item;
  final Dispatch? dispatch;

  /*针对需要tabtitles*/
  final List<String>? titles;
  final int? index;
  final Function(int)? callback;
  final VoidCallback? buttonCallback;
  final String? buttonTitle;

  RHeaderWidget(
      {this.item,
      this.dispatch,
      this.titles,
      this.index,
      this.callback,
      this.buttonTitle,
      this.buttonCallback});

  @override
  Widget build(BuildContext context) {
    if (item != null && item!.uiElement != null) {
      return Container(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_buildLeftWidget(context), _buildRightWidget(context)],
        ),
      );
    } else if (titles != null && titles?.isNotEmpty == true) {
      return Container(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLeftSegmentTitleTab(context),
            _buildRightWidget(context)
          ],
        ),
      );
    }
    return Container();
  }

  Widget _buildLeftWidget(BuildContext context) {
    return Text(
      item?.uiElement?.subTitle?.title ?? "",
      style: GpOtherTheme.size15(context)!
          .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
    );
  }

  Widget _buildLeftSegmentTitleTab(BuildContext context) {
    return Row(
      children: titles!.map((e) {
        int idx = titles!.indexOf(e);
        bool last = titles!.last == e;
        Color textColor = CommonColors.textColor999;
        if (idx == index) {
          textColor = CommonColors.onSurfaceTextColor;
        }
        return GestureDetector(
          onTap: () {
            if (callback != null) {
              callback!(idx);
            }
          },
          child: Row(
            children: [
              Text(
                e,
                style: GpOtherTheme.size17(context)!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    fontSize: 20),
              ),
              if (last == false)
                Container(
                  width: 1,
                  height: 18,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  color: CommonColors.divider,
                )
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildRightWidget(BuildContext context) {
    String str = buttonTitle != null
        ? buttonTitle!
        : (item?.uiElement?.button?.text ?? "");
    return GestureDetector(
      onTap: () {
        if (dispatch != null) {
          dispatch!(HomeMusicActionCreator.onTapRecommendMoreAction(
              item!.uiElement!.button!));
        }
        if (buttonCallback != null) {
          buttonCallback!();
        }
      },
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 4),
        decoration: BoxDecoration(
            border: Border.all(color: CommonColors.divider),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              str,
              style: GpOtherTheme.size13(context)!
                  .copyWith(color: CommonColors.textColor666),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: CommonColors.textColor666,
            )
          ],
        ),
      ),
    );
  }
}
