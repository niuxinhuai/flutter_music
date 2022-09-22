import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SearchTopicComponent extends Component<SearchTopicState> {
  SearchTopicComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SearchTopicState>(
                adapter: null,
                slots: <String, Dependent<SearchTopicState>>{
                }),);

}
