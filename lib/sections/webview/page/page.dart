import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CustomWebViewPage extends Page<CustomWebViewState, Map<String, dynamic>> {
  CustomWebViewPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CustomWebViewState>(
                adapter: null,
                slots: <String, Dependent<CustomWebViewState>>{
                }),
            middleware: <Middleware<CustomWebViewState>>[
            ],);

}
