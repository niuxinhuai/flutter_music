import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SimQueryComponent extends Component<SimQueryState> {
  SimQueryComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SimQueryState>(
                adapter: null,
                slots: <String, Dependent<SimQueryState>>{
                }),);

}
