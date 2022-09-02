import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/square/page/recommend/flow_adpater/adapter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SquareRecommendPage
    extends Page<SquareRecommendState, Map<String, dynamic>> {
  SquareRecommendPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<SquareRecommendState>(
              adapter: NoneConn<SquareRecommendState>() + adapter,
              slots: <String, Dependent<SquareRecommendState>>{}),
          middleware: <Middleware<SquareRecommendState>>[],
        );
}
