import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/square/models/playlist.dart';

enum PlaylistDetailAction { action, onTapError, didFetchData, didError }

class PlaylistDetailActionCreator {
  static Action onAction() {
    return const Action(PlaylistDetailAction.action);
  }

  static Action onTapErrorAction() {
    return const Action(PlaylistDetailAction.onTapError);
  }

  static Action didFetchDataAction(PlaylistSquareWrap squareWrap) {
    return Action(PlaylistDetailAction.didFetchData, payload: squareWrap);
  }

  static Action didErrorAction() {
    return const Action(PlaylistDetailAction.didError);
  }
}
