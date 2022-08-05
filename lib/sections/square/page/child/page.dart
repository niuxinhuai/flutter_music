import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SquareChildPage extends Page<SquareChildState, Map<String, dynamic>> {
  SquareChildPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SquareChildState>(
                adapter: null,
                slots: <String, Dependent<SquareChildState>>{
                }),
            middleware: <Middleware<SquareChildState>>[
            ],);

}
