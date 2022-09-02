import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/square/models/recommend.dart';

enum SquareRecommendAction { action, didFetchData }

class SquareRecommendActionCreator {
  static Action onAction() {
    return const Action(SquareRecommendAction.action);
  }

  static Action didFetchDataAction(
      SquareEveryDayRecommendWrap everyDayRecommendWrap,
      SquareRecommendWrap recommendWrap) {
    return Action(SquareRecommendAction.didFetchData,
        payload: Tuple2(everyDayRecommendWrap, recommendWrap));
  }
}
