import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/utils/mathUtil.dart';

class PlayCountWidget extends StatelessWidget {
  final int? count;

  PlayCountWidget({this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 4, right: 4),
      margin: const EdgeInsets.only(right: 4, top: 3),
      decoration: BoxDecoration(
          color: Color(0xFF848484).withOpacity(0.5),
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: Row(
        children: [
          Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 19,
          ),
          Text(
            MathUtils.getPlayNumberStr(count ?? 0),
            style: GpOtherTheme.size13(context)!
                .copyWith(color: CommonColors.onPrimaryTextColor, fontSize: 12),
          )
        ],
      ),
    );
  }
}
