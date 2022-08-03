import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';
import 'flow_adapter/adapter.dart';

class HomeMusicPage extends Page<HomeMusicState, Map<String, dynamic>> {
  HomeMusicPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HomeMusicState>(
              adapter: NoneConn<HomeMusicState>() + adapter,
              slots: <String, Dependent<HomeMusicState>>{}),
          middleware: <Middleware<HomeMusicState>>[],
        );
}
