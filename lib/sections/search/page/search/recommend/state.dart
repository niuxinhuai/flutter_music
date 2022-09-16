import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/search/models/search_recommend.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

class SearchRecommendState implements Cloneable<SearchRecommendState> {
  SearchRecommendWrap? recommendWrap;

  @override
  SearchRecommendState clone() {
    return SearchRecommendState()..recommendWrap = recommendWrap;
  }
}

SearchRecommendState initState(Map<String, dynamic> args) {
  return SearchRecommendState();
}
