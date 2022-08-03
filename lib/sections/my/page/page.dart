import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class UserCenterPage extends Page<UserCenterState, Map<String, dynamic>> {
  UserCenterPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<UserCenterState>(
                adapter: null,
                slots: <String, Dependent<UserCenterState>>{
                }),
            middleware: <Middleware<UserCenterState>>[
            ],);

}
