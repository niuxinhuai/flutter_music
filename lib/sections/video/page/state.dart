import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/video/models/detail.dart';
import 'package:flutter_music/sections/video/models/info.dart';
import 'package:flutter_music/sections/video/models/url.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

class VideoDetailState implements Cloneable<VideoDetailState> {
  String? vid;
  String? url;

  LoadingState? loadingState;
  VideoDetailWrap? detailWrap;
  VideoUrlWrap? urlWrap;
  VideoDetailInfoWrap? infoWrap;
  double? progress;
  Duration? position;

  @override
  VideoDetailState clone() {
    return VideoDetailState()
      ..vid = vid
      ..url = url
      ..loadingState = loadingState
      ..detailWrap = detailWrap
      ..urlWrap = urlWrap
      ..infoWrap = infoWrap
      ..progress = progress
      ..position = position;
  }
}

VideoDetailState initState(Map<String, dynamic>? args) {
  String vid = "";
  if (args != null && args.containsKey("vid")) {
    vid = args["vid"];
  }

  return VideoDetailState()
    ..vid = vid
    ..loadingState = LoadingState.isLoading
    ..progress = 0.0;
}
