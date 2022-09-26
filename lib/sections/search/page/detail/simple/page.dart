import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SearchSimplePage extends Page<SearchSimpleState, Map<String, dynamic>> {
  SearchSimplePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SearchSimpleState>(
                adapter: null,
                slots: <String, Dependent<SearchSimpleState>>{
                }),
            middleware: <Middleware<SearchSimpleState>>[
            ],);

}
