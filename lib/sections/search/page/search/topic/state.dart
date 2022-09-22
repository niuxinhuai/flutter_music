import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/search/models/search_hot_topic.dart';

class SearchTopicState implements Cloneable<SearchTopicState> {
  SearchHotTopicWrap? wrap;
  @override
  SearchTopicState clone() {
    return SearchTopicState()..wrap = wrap;
  }
}

SearchTopicState initState(Map<String, dynamic> args) {
  return SearchTopicState();
}
