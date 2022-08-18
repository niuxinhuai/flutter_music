import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/podcast/page/flow_adapter/adapter.dart';

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
              adapter: NoneConn<PodcastState>() + adapter,
              slots: <String, Dependent<PodcastState>>{}),
          middleware: <Middleware<PodcastState>>[],
        );
}
