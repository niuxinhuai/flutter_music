import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PlaylistSquarePage extends Page<PlaylistSquareState, Map<String, dynamic>> {
  PlaylistSquarePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PlaylistSquareState>(
                adapter: null,
                slots: <String, Dependent<PlaylistSquareState>>{
                }),
            middleware: <Middleware<PlaylistSquareState>>[
            ],);

}
