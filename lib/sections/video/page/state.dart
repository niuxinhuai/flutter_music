import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/video/models/detail.dart';
import 'package:flutter_music/sections/video/models/info.dart';
import 'package:flutter_music/sections/video/models/url.dart';
import 'package:flutter_music/sections/village/models/source.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

class VideoDetailState implements Cloneable<VideoDetailState> {
  String? vid;
  String? url;
  String? sourceUrl;
  VideoItemData? sourceData;

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
      ..sourceUrl = sourceUrl
      ..sourceData = sourceData
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
  VideoItemData? sourceData;
  if (args != null && args["sourceData"] is VideoItemData) {
    sourceData = args["sourceData"];
  }

  return VideoDetailState()
    ..vid = vid
    ..sourceData = sourceData
    ..loadingState = LoadingState.isLoading
    ..progress = 0.0;
}
