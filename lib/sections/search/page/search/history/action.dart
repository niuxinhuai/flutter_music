import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/models/db/db_model.dart';

enum SearchHistoryAction { action, onRefresh,onTapItem,onClean,didFetchData }

class SearchHistoryActionCreator {
  static Action onAction() {
    return const Action(SearchHistoryAction.action);
  }

  static Action onRefreshAction() {
    return const Action(SearchHistoryAction.onRefresh);
  }

  static Action onCleanAction() {
    return const Action(SearchHistoryAction.onClean);
  }

  static Action onTapItemAction(UserSearchLog searchLog) {
    return Action(SearchHistoryAction.onTapItem,payload: searchLog);
  }

  static Action didFetchDataAction(List<UserSearchLog> logs) {
    return Action(SearchHistoryAction.didFetchData, payload: logs);
  }
}
