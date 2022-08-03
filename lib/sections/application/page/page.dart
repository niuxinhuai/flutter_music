import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ApplicationPage extends Page<ApplicationState, Map<String, dynamic>> {
  ApplicationPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ApplicationState>(
                adapter: null,
                slots: <String, Dependent<ApplicationState>>{
                }),
            middleware: <Middleware<ApplicationState>>[
            ],);

}
