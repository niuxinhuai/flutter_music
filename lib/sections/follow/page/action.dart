import 'package:fish_redux/fish_redux.dart';

enum MyFocusAction { action, viewPortShow, didRefresh, didRefreshImage }

class MyFocusActionCreator {
  static Action onAction() {
    return const Action(MyFocusAction.action);
  }

  static Action viewPortShowAction(int first, int last) {
    return Action(MyFocusAction.viewPortShow, payload: Tuple2(first, last));
  }

  static Action didRefreshImageAction() {
    return const Action(MyFocusAction.didRefreshImage);
  }

  static Action didRefreshAction(String path) {
    return Action(MyFocusAction.didRefresh, payload: path);
  }
}
