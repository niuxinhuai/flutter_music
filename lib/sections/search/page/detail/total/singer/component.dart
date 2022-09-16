import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SingerComponent extends Component<SingerState> {
  SingerComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SingerState>(
                adapter: null,
                slots: <String, Dependent<SingerState>>{
                }),);

}
