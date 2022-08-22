import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/utils/mathUtil.dart';

class CommentWidget extends StatelessWidget {
  final int? count;

  CommentWidget({this.count});

  @override
  Widget build(BuildContext context) {
    bool noComment = count == null || count == 0;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(22.0))),
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/cm8_mlog_playlist_comment~iphone.png",
            width: 30,
          ),
          Text(
            noComment ? "评论" : "${MathUtils.getPlayNumberStr(count ?? 0)}",
            style: GpOtherTheme.size15(context)!
                .copyWith(color: CommonColors.onSurfaceTextColor),
          )
        ],
      ),
    );
  }
}
