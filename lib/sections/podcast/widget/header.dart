import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/podcast/models/personalize.dart';
import 'package:flutter_music/sections/podcast/models/podcast.dart';
import 'package:flutter_music/sections/podcast/page/podcast/action.dart';
import 'package:flutter_music/utils/podcast_util.dart';

class PodcastHeaderWidget extends StatelessWidget {
  final PodcastStage? stage;
  final PersonalizeWrap? wrap;
  final Dispatch? dispatch;

  PodcastHeaderWidget({this.stage, this.dispatch, this.wrap});
  @override
  Widget build(BuildContext context) {
    if (stage == null && wrap == null) {
      return Container(
        width: 0,
        height: 0,
      );
    }
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildLeftWidget(context), _buildRightWidget(context)],
      ),
    );
  }

  Widget _buildLeftWidget(BuildContext context) {
    if (wrap != null) {
      return Row(
        children: [
          Image.asset("assets/images/cm8_refresh_new_items~iphone.png"),
          Padding(
            padding: EdgeInsets.only(left: 3),
            child: Text(
              "猜你喜欢",
              style: GpOtherTheme.size15(context)!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          )
        ],
      );
    }
    return Text(
      stage?.categoryName ?? "",
      style: GpOtherTheme.size15(context)!
          .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
    );
  }

  Widget _buildRightWidget(BuildContext context) {
    String str = wrap != null ? "兴趣定制" : "更多";
    return GestureDetector(
      onTap: () {
        if (dispatch != null) {
          if (stage == null) {
            dispatch!(PodcastActionCreator.onTapHeaderMoreAction(
                PodcastStage()..categoryId = PodcastUtils.dj_perfered));
          } else {
            dispatch!(PodcastActionCreator.onTapHeaderMoreAction(stage!));
          }
        }
      },
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 4),
        decoration: BoxDecoration(
            border:
                Border.all(color: CommonColors.textColor999.withOpacity(0.5)),
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
