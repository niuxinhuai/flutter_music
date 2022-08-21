import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/podcast/models/catelist.dart';

enum CatelistAction { action, onTapError, didError, didFetchData }

class CatelistActionCreator {
  static Action onAction() {
    return const Action(CatelistAction.action);
  }

  static Action onTapErrorAction() {
    return const Action(CatelistAction.onTapError);
  }

  static Action didErrorAction() {
    return const Action(CatelistAction.didError);
  }

  static Action didFetchDataAction(CatelistWrap wrap) {
    return Action(CatelistAction.didFetchData, payload: wrap);
  }
}
