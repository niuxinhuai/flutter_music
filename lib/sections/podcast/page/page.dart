import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PodcastPage extends Page<PodcastState, Map<String, dynamic>> {
  PodcastPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PodcastState>(
                adapter: null,
                slots: <String, Dependent<PodcastState>>{
                }),
            middleware: <Middleware<PodcastState>>[
            ],);

}
