import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/sections/music/widget/play_count.dart';
import 'package:flutter_music/sections/podcast/models/podcast.dart';
import 'package:flutter_music/utils/colorUtils.dart';

class GridItemWidget extends StatelessWidget {
  final RadiosItem? item;

  GridItemWidget({this.item});

  @override
  Widget build(BuildContext context) {
    return _buildlSingleItem(context);
  }

  Widget _buildlSingleItem(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              if (item?.picUrl != null)
                ImageItemWidget(
                  url: item?.picUrl,
                ),
              if (item?.playCount != null)
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (item!.icon != null) _buildIcon(item!.icon!, context),
                      if (item!.icon == null)
                        Container(
                          width: 30,
                          height: 10,
                        ),
                      _buildCount(context, item!.playCount!)
                    ],
                  ),
                )
            ],
          ),
          Container(
            height: 42,
            padding: EdgeInsets.only(top: 3),
            child: Text(
              item?.name ?? "",
              maxLines: 2,
              style: GpOtherTheme.size13(context)!
                  .copyWith(color: CommonColors.onSurfaceTextColor),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildIcon(RadiosIcon icon, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
      decoration: BoxDecoration(
          color: HexColor(icon.color!),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Text(
        icon.value ?? "",
        style: GpOtherTheme.size12(context)!
            .copyWith(color: CommonColors.onPrimaryTextColor, fontSize: 10),
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
