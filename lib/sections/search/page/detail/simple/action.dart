import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/search/models/search_result.dart';
import 'package:flutter_music/sections/search/models/search_voice.dart';

enum SearchSimpleAction { action, didFetchData, didFetchVoiceData }

class SearchSimpleActionCreator {
  static Action onAction() {
    return const Action(SearchSimpleAction.action);
  }

  static Action didFetchDataAction(SearchResultWrap wrap) {
    return Action(SearchSimpleAction.didFetchData, payload: wrap);
  }

  static Action didFetchVoiceDataAction(SearchVoiceWrap wrap) {
    return Action(SearchSimpleAction.didFetchVoiceData, payload: wrap);
  }
}
