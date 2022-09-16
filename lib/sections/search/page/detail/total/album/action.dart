import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum AlbumAction { action }

class AlbumActionCreator {
  static Action onAction() {
    return const Action(AlbumAction.action);
  }
}
