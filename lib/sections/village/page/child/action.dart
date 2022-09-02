import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/village/models/source.dart';

enum VideoWaterfallAction {
  action,
  onTapItem,
  onTapError,
  onRefresh,
  onLoading,
  didRefresh,
  didLoading,
  didError,
  didFetchData
}

class VideoWaterfallActionCreator {
  static Action onAction() {
    return const Action(VideoWaterfallAction.action);
  }

  static Action onTapItemAction(VideoSourceItem item) {
    return Action(VideoWaterfallAction.onTapItem, payload: item);
  }

  static Action onRefreshAction() {
    return const Action(VideoWaterfallAction.onRefresh);
  }

  static Action onLoadingAction() {
    return const Action(VideoWaterfallAction.onLoading);
  }

  static Action didErrorAction() {
    return const Action(VideoWaterfallAction.didError);
  }

  static Action onTapErrorAction() {
    return const Action(VideoWaterfallAction.onTapError);
  }

  static Action didRefreshAction(VideoSourceWrap wrap) {
    return Action(VideoWaterfallAction.didRefresh, payload: wrap);
  }

  static Action didLoadingAction(VideoSourceWrap wrap) {
    return Action(VideoWaterfallAction.didLoading, payload: wrap);
  }

  static Action didFetchDataAction(VideoSourceWrap wrap) {
    return Action(VideoWaterfallAction.didFetchData, payload: wrap);
  }
}
