import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/video/models/detail.dart';
import 'package:flutter_music/sections/video/models/info.dart';
import 'package:flutter_music/sections/video/models/url.dart';

enum VideoDetailAction {
  action,
  onTapError,
  onPlayerProgress,
  onTapBottomCommentFloor,
  didPlayerProgress,
  didError,
  didFetchData
}

class VideoDetailActionCreator {
  static Action onAction() {
    return const Action(VideoDetailAction.action);
  }

  static Action onTapErrorAction() {
    return const Action(VideoDetailAction.onTapError);
  }

  static Action onPlayerProgressAction(double progress, Duration position) {
    return Action(VideoDetailAction.onPlayerProgress,
        payload: Tuple2(progress, position));
  }

  static Action onTapBottomCommentFloorAction() {
    return const Action(VideoDetailAction.onTapBottomCommentFloor);
  }

  static Action didPlayerProgressAction(double progress, Duration position) {
    return Action(VideoDetailAction.didPlayerProgress,
        payload: Tuple2(progress, position));
  }

  static Action didErrorAction() {
    return const Action(VideoDetailAction.didError);
  }

  static Action didFetchDataAction(VideoDetailWrap detailWrap,
      VideoUrlWrap urlWrap, VideoDetailInfoWrap infoWrap) {
    return Action(VideoDetailAction.didFetchData,
        payload: Tuple3(detailWrap, urlWrap, infoWrap));
  }
}
