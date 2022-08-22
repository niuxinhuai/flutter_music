import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/podcast/models/detail.dart';
import 'package:flutter_music/sections/podcast/models/detail_list.dart';

enum PodcastDetailAction {
  action,
  onTapError,
  onTapItem,
  didError,
  didFetchData
}

class PodcastDetailActionCreator {
  static Action onAction() {
    return const Action(PodcastDetailAction.action);
  }

  static Action onTapErrorAction() {
    return const Action(PodcastDetailAction.onTapError);
  }

  static Action onTapItemAction(DetailProgramsItem item) {
    return Action(PodcastDetailAction.onTapItem, payload: item);
  }

  static Action didErrorAction() {
    return const Action(PodcastDetailAction.didError);
  }

  static Action didFetchDataAction(
      PodcastDetailWrap wrap, List<DetailProgramsItem> items) {
    return Action(PodcastDetailAction.didFetchData,
        payload: Tuple2(wrap, items));
  }
}
