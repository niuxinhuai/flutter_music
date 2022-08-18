import 'package:fish_redux/fish_redux.dart';

enum CustomWebViewAction {
  action,
  onProgress,
  onPageFinished,
  didProgress,
  didPageFinished
}

class CustomWebViewActionCreator {
  static Action onAction() {
    return const Action(CustomWebViewAction.action);
  }

  static Action onPageFinishedAction(String url) {
    return Action(CustomWebViewAction.onPageFinished, payload: url);
  }

  static Action onProgressAction(int progress) {
    return Action(CustomWebViewAction.onProgress, payload: progress);
  }

  static Action didProgressAction(int progress) {
    return Action(CustomWebViewAction.didProgress, payload: progress);
  }

  static Action didPageFinishedAction(String url) {
    return Action(CustomWebViewAction.didPageFinished, payload: url);
  }
}
