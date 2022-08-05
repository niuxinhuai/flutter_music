import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SquareEditPage extends Page<SquareEditState, Map<String, dynamic>> {
  SquareEditPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SquareEditState>(
                adapter: null,
                slots: <String, Dependent<SquareEditState>>{
                }),
            middleware: <Middleware<SquareEditState>>[
            ],);

}
