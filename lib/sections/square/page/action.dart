import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/square/models/catlist.dart';

enum PlaylistSquareAction { action, onTapEditButton, didFeatchData }

class PlaylistSquareActionCreator {
  static Action onAction() {
    return const Action(PlaylistSquareAction.action);
  }

  static Action onTapEditButtonAction() {
    return const Action(PlaylistSquareAction.onTapEditButton);
  }

  static Action didFeatchDataAction(List<CatlistSubItem> items) {
    return Action(PlaylistSquareAction.didFeatchData, payload: items);
  }
}
