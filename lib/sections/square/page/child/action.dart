import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/square/models/playlist.dart';

enum SquareChildAction {
  action,
  onLoading,
  onErrorTap,
  onFilterTap,
  onTapItem,
  didFilterAndRefresh,
  didLoading,
  didFetchData,
  didError
}

class SquareChildActionCreator {
  static Action onAction() {
    return const Action(SquareChildAction.action);
  }

  static Action onTapItemAction(PlaylistStage playlistStage) {
    return Action(SquareChildAction.onTapItem, payload: playlistStage);
  }

  static Action onErrorTapAction() {
    return const Action(SquareChildAction.onErrorTap);
  }

  static Action onLoadingAction() {
    return const Action(SquareChildAction.onLoading);
  }

  static Action onFilterTapAction() {
    return const Action(SquareChildAction.onFilterTap);
  }

  static Action didLoadingAction(PlaylistSquareWrap squareWrap) {
    return Action(SquareChildAction.didLoading, payload: squareWrap);
  }

  static Action didFetchDataAction(PlaylistSquareWrap squareWrap) {
    return Action(SquareChildAction.didFetchData, payload: squareWrap);
  }

  static Action didFilterAndRefreshAction() {
    return const Action(SquareChildAction.didFilterAndRefresh);
  }

  static Action didErrorAction() {
    return const Action(SquareChildAction.didError);
  }
}
