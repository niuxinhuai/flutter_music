import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SearchRecommendComponent extends Component<SearchRecommendState> {
  SearchRecommendComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SearchRecommendState>(
                adapter: null,
                slots: <String, Dependent<SearchRecommendState>>{
                }),);

}
