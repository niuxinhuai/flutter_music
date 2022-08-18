import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<CustomWebViewState>? buildEffect() {
  return combineEffects(<Object, Effect<CustomWebViewState>>{
    CustomWebViewAction.action: _onAction,
    CustomWebViewAction.onProgress: _onProgress,
    CustomWebViewAction.onPageFinished: _onPageFinished
  });
}

void _onProgress(Action action, Context<CustomWebViewState> ctx) {
  final int progress = action.payload;

  ctx.dispatch(CustomWebViewActionCreator.didProgressAction(progress));
}

void _onPageFinished(Action action, Context<CustomWebViewState> ctx) {
  ctx.dispatch(
      CustomWebViewActionCreator.didPageFinishedAction(action.payload));
}

void _onAction(Action action, Context<CustomWebViewState> ctx) {}
