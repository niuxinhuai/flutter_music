import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';

class BottomCommentWidget extends StatelessWidget {
  final VoidCallback? callback;

  BottomCommentWidget({this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (callback != null) {
          callback!();
        }
      },
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "听说爱评论的人粉丝多",
              style: GpOtherTheme.size15(context)!
                  .copyWith(color: CommonColors.textColor666),
            ),
            Image.asset(
                "assets/images/cm6_square_publish_scalelarge~iphone.png")
          ],
        ),
      ),
    );
  }
}
