import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PlaylistAction { action }

class PlaylistActionCreator {
  static Action onAction() {
    return const Action(PlaylistAction.action);
  }
}
