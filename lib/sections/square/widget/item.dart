import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/sections/square/models/playlist.dart';
import 'package:flutter_music/utils/mathUtil.dart';

class SquareItemWidget extends StatelessWidget {
  final PlaylistStage? stage;

  SquareItemWidget({this.stage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ImageItemWidget(
              url: stage?.coverImgUrl ?? "",
              fit: BoxFit.fill,
            ),
            Positioned(
              right: 0,
              top: 0,
              child: _buildCount(context, stage?.playCount ?? 0),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 3),
          child: Text(
            stage?.name ?? "",
            maxLines: 2,
            softWrap: true,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: GpOtherTheme.size13(context)!.copyWith(
                color: CommonColors.onSurfaceTextColor,
//              fontWeight: FontWeight.bold,
                fontSize: 13),
          ),
        )
      ],
    );
  }

  ///count
  Widget _buildCount(BuildContext context, int count) {
    return Container(
      padding: const EdgeInsets.only(left: 4, right: 4, top: 1, bottom: 1),
      margin: const EdgeInsets.only(right: 4, top: 3),
      decoration: BoxDecoration(
          color: Color(0xFF848484).withOpacity(0.8),
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: Row(
        children: [
          Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 19,
          ),
          Text(
            MathUtils.getPlayNumberStr(count),
            style: GpOtherTheme.size13(context)!
                .copyWith(color: CommonColors.onPrimaryTextColor, fontSize: 12),
          )
        ],
      ),
    );
  }
}
