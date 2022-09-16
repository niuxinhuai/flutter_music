import 'package:fish_redux/fish_redux.dart';

class SearchDetailState implements Cloneable<SearchDetailState> {
  String? text;
  String? hint;

  @override
  SearchDetailState clone() {
    return SearchDetailState()
      ..text = text
      ..hint = hint;
  }
}

SearchDetailState initState(Map<String, dynamic>? args) {
  String text = "";
  String hint = "";
  if (args != null) {
    if (args.containsKey("text")) {
      text = args["text"];
    }
    if (args.containsKey("hint")) {
      hint = args["hint"];
    }
  }

  return SearchDetailState()
    ..text = text
    ..hint = hint;
}
