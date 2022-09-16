import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class UserComponent extends Component<UserState> {
  UserComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<UserState>(
                adapter: null,
                slots: <String, Dependent<UserState>>{
                }),);

}
