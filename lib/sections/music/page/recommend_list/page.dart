import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class RecommendListPage extends Page<RecommendListState, Map<String, dynamic>> {
  RecommendListPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<RecommendListState>(
                adapter: null,
                slots: <String, Dependent<RecommendListState>>{
                }),
            middleware: <Middleware<RecommendListState>>[
            ],);

}
