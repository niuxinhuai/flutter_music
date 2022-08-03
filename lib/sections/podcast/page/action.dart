import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PodcastAction { action }

class PodcastActionCreator {
  static Action onAction() {
    return const Action(PodcastAction.action);
  }
}
