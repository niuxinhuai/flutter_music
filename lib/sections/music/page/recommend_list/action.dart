import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/music/models/recommend.dart';

enum RecommendListAction { action, onTapItem, didFetchData }

class RecommendListActionCreator {
  static Action onAction() {
    return const Action(RecommendListAction.action);
  }

  static Action onTapItemAction(DailySongItem item) {
    return Action(RecommendListAction.onTapItem, payload: item);
  }

  static Action didFetchDataAction(RecommendListWrap wrap) {
    return Action(RecommendListAction.didFetchData, payload: wrap);
  }
}
