import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/search/page/search/history/component.dart';
import 'package:flutter_music/sections/search/page/search/hot/component.dart';
import 'package:flutter_music/sections/search/page/search/recommend/component.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SearchPage extends Page<SearchState, Map<String, dynamic>> {
  SearchPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<SearchState>(
              adapter: null,
              slots: <String, Dependent<SearchState>>{
                "recommend":
                    SearchRecommendConnector() + SearchRecommendComponent(),
                "hot": SearchHotConnector() + SearchHotComponent(),
                "history": SearchHistoryConnector() + SearchHistoryComponent(),
              }),
          middleware: <Middleware<SearchState>>[],
        );
}
