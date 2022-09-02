import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/sections/video/widget/bottom_comment.dart';
import 'package:flutter_music/sections/video/widget/component.dart';
import 'package:flutter_music/sections/video/widget/music.dart';
import 'package:flutter_music/sections/video/widget/user_detail.dart';
import 'package:flutter_music/sections/video/widget/video_player.dart';
import 'package:flutter_music/widgets/appbar.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    VideoDetailState state, Dispatch dispatch, ViewService viewService) {
  return LoadingWrap(
    loadingState: state.loadingState,
    successChild: Builder(
      builder: (context) {
        return _buildBody(state, dispatch, viewService);
      },
    ),
    onErrorTap: () => dispatch(VideoDetailActionCreator.onTapErrorAction()),
  );
}

Widget _buildBody(
    VideoDetailState state, Dispatch dispatch, ViewService viewService) {
  double width = MediaQuery.of(viewService.context).size.width;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
          child: Stack(
        children: [
          Hero(
              tag: state.url!,
              child: VideoPlayerWidget(
                call: (double progress, Duration position) => dispatch(
                    VideoDetailActionCreator.onPlayerProgressAction(
                        progress, position)),
                url: state.url,
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GpAppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "assets/images/cm8_my_music_more_playlist~iphone.png",
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: width,
                    height: 250,
                    child: Row(
                      children: [
                        UserDetailWidget(
                          detailWrap: state.detailWrap,
                        ),
                        VideoComponentWidget(
                          infoWrap: state.infoWrap,
                        )
                      ],
                    ),
                  ),
                  VideoMusicWidget(
                    width: width,
                    coverUrl: state.detailWrap?.data?.coverUrl,
                    progressValue: state.progress,
                  ),
                ],
              )
            ],
          )
        ],
      )),
      BottomCommentWidget(
        callback: () =>
            dispatch(VideoDetailActionCreator.onTapBottomCommentFloorAction()),
      ),
    ],
  );
}
