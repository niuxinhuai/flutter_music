import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/search/models/search_hot.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

class SearchHotState implements Cloneable<SearchHotState> {
  SearchHotWrap? wrap;

  @override
  SearchHotState clone() {
    return SearchHotState()..wrap = wrap;
  }
}

SearchHotState initState(Map<String, dynamic> args) {
  return SearchHotState();
}
