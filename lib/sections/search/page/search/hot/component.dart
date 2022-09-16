import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SearchHotComponent extends Component<SearchHotState> {
  SearchHotComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SearchHotState>(
                adapter: null,
                slots: <String, Dependent<SearchHotState>>{
                }),);

}
