import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/podcast/models/catelist.dart';
import 'package:flutter_music/sections/podcast/models/personalize.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

class CatelistRecommendState implements Cloneable<CatelistRecommendState> {
  int? id;
  String? name;
  CatelistRecommendWrap? wrap;
  List<PersonalizeItem>? items;
  LoadingState? loadingState;

  @override
  CatelistRecommendState clone() {
    return CatelistRecommendState()
      ..id = id
      ..name = name
      ..wrap = wrap
      ..items = items
      ..loadingState = loadingState;
  }
}

CatelistRecommendState initState(Map<String, dynamic>? args) {
  int id = 0;
  String name = "";
  if (args != null) {
    if (args.containsKey("id")) {
      id = args["id"];
    }

    if (args.containsKey("name")) {
      name = args["name"];
    }
  }
  return CatelistRecommendState()
    ..id = id
    ..name = name
    ..loadingState = LoadingState.isLoading
    ..items = [];
}
