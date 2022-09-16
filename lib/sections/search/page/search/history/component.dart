import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SearchHistoryComponent extends Component<SearchHistoryState> {
  SearchHistoryComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SearchHistoryState>(
                adapter: null,
                slots: <String, Dependent<SearchHistoryState>>{
                }),);

}
