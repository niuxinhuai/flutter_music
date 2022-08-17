import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/Leaderboard/models/Leaderboard.dart';
import 'package:flutter_music/sections/Leaderboard/models/toplist.dart';

enum LeaderboardAction {
  action,
  onTapError,
  onTapGridItem,
  didFetchData,
  didError
}

class LeaderboardActionCreator {
  static Action onTapErrorAction() {
    return const Action(LeaderboardAction.onTapError);
  }

  static Action onTapGridItemAction(BoardListItem item) {
    return Action(LeaderboardAction.onTapGridItem, payload: item);
  }

  static Action didFetchDataAction(
      LeaderboardWrap wrap, List<ToplistDetailSection> sections) {
    return Action(LeaderboardAction.didFetchData,
        payload: Tuple2(wrap, sections));
  }

  static Action didErrorAction() {
    return const Action(LeaderboardAction.didError);
  }

  static Action onAction() {
    return const Action(LeaderboardAction.action);
  }
}
