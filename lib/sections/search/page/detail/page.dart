import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SearchDetailPage extends Page<SearchDetailState, Map<String, dynamic>> {
  SearchDetailPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SearchDetailState>(
                adapter: null,
                slots: <String, Dependent<SearchDetailState>>{
                }),
            middleware: <Middleware<SearchDetailState>>[
            ],);

}
