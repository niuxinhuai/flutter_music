import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/Leaderboard/page/flow_adapter/adapter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class LeaderboardPage extends Page<LeaderboardState, Map<String, dynamic>> {
  LeaderboardPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<LeaderboardState>(
              adapter: NoneConn<LeaderboardState>() + adapter,
              slots: <String, Dependent<LeaderboardState>>{}),
          middleware: <Middleware<LeaderboardState>>[],
        );
}
