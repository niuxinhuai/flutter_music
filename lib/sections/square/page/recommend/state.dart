import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/square/models/recommend.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

class SquareRecommendState extends ItemListLike
    implements Cloneable<SquareRecommendState> {
  //每日推荐歌单
  SquareEveryDayRecommendWrap? everyDayRecommendWrap;
  RecommendSectionModel? everyDayRecommendMode;

  //推荐歌单
  SquareRecommendWrap? recommendWrap;
  RecommendSectionModel? recommendModel;

  LoadingState? loadingState;

  @override
  SquareRecommendState clone() {
    return SquareRecommendState()
      ..everyDayRecommendWrap = everyDayRecommendWrap
      ..recommendWrap = recommendWrap
      ..everyDayRecommendMode = everyDayRecommendMode
      ..recommendModel = recommendModel
      ..loadingState = loadingState;
  }

  @override
  Object getItemData(int index) {
    if (index == 1) {
      if (everyDayRecommendMode != null) {
        return everyDayRecommendMode!;
      }
      return "";
    }
    if (index == 2) {
      if (recommendModel != null) {
        return recommendModel!;
      }
      return "";
    }
    return "";
  }

  @override
  String getItemType(int index) {
    if (index == 0) return "exclusive";
    if (index == 1) return "compiler";
    if (index == 2) return "official";
    if (index == 3) return "Leaderboard";
    if (index == 4) return "recommend";
    return "next";
  }

  @override
  int get itemCount => 5;

  @override
  ItemListLike updateItemData(int index, Object data, bool isStateCopied) {
    if (index == 1) {
      everyDayRecommendWrap = data as SquareEveryDayRecommendWrap;
    }
    return this;
  }
}

SquareRecommendState initState(Map<String, dynamic>? args) {
  return SquareRecommendState()..loadingState = LoadingState.isLoading;
}
