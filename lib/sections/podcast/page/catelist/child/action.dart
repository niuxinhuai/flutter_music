import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/podcast/models/catelist.dart';

enum CatelistRecommendAction { action, onTapError, didError, didFetchData }

class CatelistRecommendActionCreator {
  static Action onAction() {
    return const Action(CatelistRecommendAction.action);
  }

  static Action onTapErrorAction() {
    return const Action(CatelistRecommendAction.onTapError);
  }

  static Action didErrorAction() {
    return const Action(CatelistRecommendAction.didError);
  }

  static Action didFetchDataAction(CatelistRecommendWrap wrap) {
    return Action(CatelistRecommendAction.didFetchData, payload: wrap);
  }
}
