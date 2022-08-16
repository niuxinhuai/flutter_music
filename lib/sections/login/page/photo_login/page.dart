import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PhotoLoginPage extends Page<PhotoLoginState, Map<String, dynamic>> {
  PhotoLoginPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<PhotoLoginState>(
              adapter: null, slots: <String, Dependent<PhotoLoginState>>{}),
          middleware: <Middleware<PhotoLoginState>>[],
        );
}
