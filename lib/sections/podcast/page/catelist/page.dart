import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CatelistPage extends Page<CatelistState, Map<String, dynamic>> {
  CatelistPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CatelistState>(
                adapter: null,
                slots: <String, Dependent<CatelistState>>{
                }),
            middleware: <Middleware<CatelistState>>[
            ],);

}
