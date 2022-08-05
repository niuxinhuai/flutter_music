import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/square/models/catlist.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

class SquareEditState implements Cloneable<SquareEditState> {
  List<CatlistSectionModel>? sections;
  LoadingState? loadingState;
  bool? editing;
  int? minCount;

  @override
  SquareEditState clone() {
    return SquareEditState()
      ..loadingState = loadingState
      ..sections = sections
      ..editing = editing
    ..minCount = minCount;
  }
}

SquareEditState initState(Map<String, dynamic>? args) {
  return SquareEditState()
    ..loadingState = LoadingState.isLoading
    ..sections = []
    ..editing = false
  ..minCount = 6;
}
