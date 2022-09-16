import 'package:fish_redux/fish_redux.dart';

enum SearchDetailAction { action, onTapClean, onTapSubmit }

class SearchDetailActionCreator {
  static Action onAction() {
    return const Action(SearchDetailAction.action);
  }

  static Action onTapSubmitAction(String text) {
    return Action(SearchDetailAction.onTapSubmit, payload: text);
  }

  static Action onTapCleanAction() {
    return const Action(SearchDetailAction.onTapClean);
  }
}
