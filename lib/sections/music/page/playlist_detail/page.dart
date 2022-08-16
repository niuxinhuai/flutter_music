import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PlaylistDetailPage extends Page<PlaylistDetailState, Map<String, dynamic>> {
  PlaylistDetailPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PlaylistDetailState>(
                adapter: null,
                slots: <String, Dependent<PlaylistDetailState>>{
                }),
            middleware: <Middleware<PlaylistDetailState>>[
            ],);

}
