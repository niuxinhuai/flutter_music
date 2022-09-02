import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/village/models/source.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class VideoWaterfallState implements Cloneable<VideoWaterfallState> {
  int? id;
  LoadingState? loadingState;
  int offset = 0;
  VideoSourceWrap? wrap;
  List<VideoSourceItem>? items;
  RefreshController? refreshController;
  bool? loadNoMoreData;

  @override
  VideoWaterfallState clone() {
    return VideoWaterfallState()
      ..id = id
      ..loadingState = loadingState
      ..offset = offset
      ..wrap = wrap
      ..items = items
      ..refreshController = refreshController
      ..loadNoMoreData = loadNoMoreData;
  }
}

VideoWaterfallState initState(Map<String, dynamic>? args) {
  int id = 0;
  if (args != null && args.containsKey("id")) {
    id = args["id"];
  }

  return VideoWaterfallState()
    ..id = id
    ..loadingState = LoadingState.isLoading
    ..items = []
    ..refreshController = RefreshController(initialRefresh: false)
    ..loadNoMoreData = false;
}
