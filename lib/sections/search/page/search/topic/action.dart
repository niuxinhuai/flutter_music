import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SearchTopicAction { action }

class SearchTopicActionCreator {
  static Action onAction() {
    return const Action(SearchTopicAction.action);
  }
}
