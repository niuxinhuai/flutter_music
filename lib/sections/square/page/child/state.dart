import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/square/models/playlist.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SquareChildState implements Cloneable<SquareChildState> {
  String? tag;
  PlaylistSquareWrap? squareWrap;
  LoadingState? loadingState;
  int? limit;
  int offset = 0;

  RefreshController? refreshController;
  bool? loadNoMoreData;

  List<PlaylistStage>? stages;

  @override
  SquareChildState clone() {
    return SquareChildState()
      ..tag = tag
      ..squareWrap = squareWrap
      ..loadingState = loadingState
      ..limit = limit
      ..offset = offset
      ..refreshController = refreshController
      ..loadNoMoreData = loadNoMoreData
      ..stages = stages;
  }
}

SquareChildState initState(Map<String, dynamic>? args) {
  String tag = "全部";
  String key = "name";
  print(">>>>>>>>>>>>>>args:$args");
  if (args?.isNotEmpty == true && args!.containsKey(key)) {
    tag = args[key];
  }
  return SquareChildState()
    ..tag = tag
    ..loadingState = LoadingState.isLoading
    ..limit = 10
    ..offset = 0
    ..refreshController = RefreshController()
    ..loadNoMoreData = false
    ..stages = [];
}
