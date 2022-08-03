import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MyFocusPage extends Page<MyFocusState, Map<String, dynamic>> {
  MyFocusPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MyFocusState>(
                adapter: null,
                slots: <String, Dependent<MyFocusState>>{
                }),
            middleware: <Middleware<MyFocusState>>[
            ],);

}
