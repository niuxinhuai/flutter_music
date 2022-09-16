import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ArtistAction { action }

class ArtistActionCreator {
  static Action onAction() {
    return const Action(ArtistAction.action);
  }
}
