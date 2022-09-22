import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/search/models/search_default.dart';
import 'package:flutter_music/sections/search/page/search/history/state.dart';
import 'package:flutter_music/sections/search/page/search/hot/state.dart';
import 'package:flutter_music/sections/search/page/search/recommend/state.dart';
import 'package:flutter_music/sections/search/page/search/topic/state.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

class SearchState implements Cloneable<SearchState> {
  LoadingState? loadingState;
  String? hintText;
  String? searchText;
  List<SearchTopModel> items = [];

  SearchHotState? hotState;
  SearchTopicState? topicState;
  SearchHistoryState? historyState;
  SearchRecommendState? recommendState;

  @override
  SearchState clone() {
    return SearchState()
      ..loadingState = loadingState
      ..hintText = hintText
      ..searchText = searchText
      ..items = items
      ..hotState = hotState
      ..topicState = topicState
      ..historyState = historyState
      ..recommendState = recommendState;
  }
}

SearchState initState(Map<String, dynamic>? args) {
  String text = "发现更多精彩";
  if (args != null && args.containsKey("hintText")) {
    text = args["hintText"];
  }

  return SearchState()
    ..loadingState = LoadingState.isLoading
    ..hintText = text
    ..hotState = SearchHotState()
    ..topicState = SearchTopicState()
    ..historyState = SearchHistoryState()
    ..recommendState = SearchRecommendState();
}

///热搜组件连接器
class SearchHotConnector extends ConnOp<SearchState, SearchHotState> {
  @override
  SearchHotState? get(SearchState? state) {
    return state?.hotState;
  }

  @override
  void set(SearchState state, SearchHotState subState) {
    state.hotState = subState;
  }
}

///话题组件连接器
class SearchTopicConnector extends ConnOp<SearchState, SearchTopicState> {
  @override
  SearchTopicState? get(SearchState? state) {
    return state?.topicState;
  }

  @override
  void set(SearchState state, SearchTopicState subState) {
    state.topicState = subState;
  }
}

///历史组建连接器
class SearchHistoryConnector extends ConnOp<SearchState, SearchHistoryState> {
  @override
  SearchHistoryState? get(SearchState? state) {
    return state?.historyState;
  }

  @override
  void set(SearchState state, SearchHistoryState subState) {
    state.historyState = subState;
  }
}

///推荐组建连接器
class SearchRecommendConnector
    extends ConnOp<SearchState, SearchRecommendState> {
  @override
  SearchRecommendState? get(SearchState? state) {
    return state?.recommendState;
  }

  @override
  void set(SearchState state, SearchRecommendState subState) {
    state.recommendState = subState;
  }
}
