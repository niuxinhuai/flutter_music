import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CatelistRecommendPage extends Page<CatelistRecommendState, Map<String, dynamic>> {
  CatelistRecommendPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CatelistRecommendState>(
                adapter: null,
                slots: <String, Dependent<CatelistRecommendState>>{
                }),
            middleware: <Middleware<CatelistRecommendState>>[
            ],);

}
