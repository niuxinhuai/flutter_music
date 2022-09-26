import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/search/models/search_result.dart';
import 'package:flutter_music/sections/search/models/search_voice.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

class SearchSimpleState implements Cloneable<SearchSimpleState> {
  int? type;
  String? text;
  SearchResultWrap? wrap;
  SearchVoiceWrap? voiceWrap;
  LoadingState? loadingState;

  @override
  SearchSimpleState clone() {
    return SearchSimpleState()
      ..type = type
      ..text = text
      ..wrap = wrap
      ..voiceWrap = voiceWrap
      ..loadingState = loadingState;
  }
}

SearchSimpleState initState(Map<String, dynamic>? args) {
  int type = 1;
  if (args != null && args.containsKey("type")) {
    type = args["type"];
  }
  String text = "";
  if (args != null && args.containsKey("text")) {
    text = args["text"];
  }
  return SearchSimpleState()
    ..type = type
    ..text = text
    ..loadingState = LoadingState.isLoading;
}
