import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum AudioPlayerAction { action }

class AudioPlayerActionCreator {
  static Action onAction() {
    return const Action(AudioPlayerAction.action);
  }
}
