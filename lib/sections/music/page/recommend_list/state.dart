import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/music/models/recommend.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

class RecommendListState implements Cloneable<RecommendListState> {
  RecommendListWrap? wrap;
  LoadingState? loadingState;

  @override
  RecommendListState clone() {
    return RecommendListState()
      ..wrap = wrap
      ..loadingState = loadingState;
  }
}

RecommendListState initState(Map<String, dynamic>? args) {
  return RecommendListState()..loadingState = LoadingState.isLoading;
}
