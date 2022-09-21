import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/utils/mathUtil.dart';

class CollectWidget extends StatefulWidget {
  final bool? hasCollect;
  final int? collectCount;
  final bool? showRedBg;
  final VoidCallback? callback;

  CollectWidget(
      {this.hasCollect = false,
      this.collectCount,
      this.showRedBg = true,
      this.callback});

  @override
  _CollectWidgetState createState() => _CollectWidgetState();
}

class _CollectWidgetState extends State<CollectWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.callback != null) {
          widget.callback!();
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: widget.showRedBg == true
                ? Colors.red
                : Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.all(Radius.circular(22.0))),
        padding: EdgeInsets.only(top: 8, bottom: 8, left: 18, right: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/cm8_mlog_playlist_collection_normal~iphone.png",
              width: 30,
              color: Colors.white,
            ),
            Text(
              "收藏(${MathUtils.getPlayNumberStr(widget.collectCount ?? 0)})",
              style: GpOtherTheme.size15(context)!
                  .copyWith(color: CommonColors.onPrimaryTextColor),
            )
          ],
        ),
      ),
    );
  }
}
