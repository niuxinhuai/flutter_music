import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PodcastDetailPage extends Page<PodcastDetailState, Map<String, dynamic>> {
  PodcastDetailPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PodcastDetailState>(
                adapter: null,
                slots: <String, Dependent<PodcastDetailState>>{
                }),
            middleware: <Middleware<PodcastDetailState>>[
            ],);

}
