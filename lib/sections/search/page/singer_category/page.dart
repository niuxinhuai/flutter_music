import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SingerCategoryPage extends Page<SingerCategoryState, Map<String, dynamic>> {
  SingerCategoryPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SingerCategoryState>(
                adapter: null,
                slots: <String, Dependent<SingerCategoryState>>{
                }),
            middleware: <Middleware<SingerCategoryState>>[
            ],);

}
