import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/sections/podcast/models/catelist.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

class CatelistState implements Cloneable<CatelistState> {
  LoadingState? loadingState;
  CatelistWrap? wrap;
  List<String> titles = [];
  List<Widget> widgets = [];
  int? id;
  int? initialIndex;

  @override
  CatelistState clone() {
    return CatelistState()
      ..loadingState = loadingState
      ..wrap = wrap
      ..titles = titles
      ..widgets = widgets
      ..id = id
      ..initialIndex = initialIndex;
  }
}

CatelistState initState(Map<String, dynamic>? args) {
  int id = 3;
  if (args != null) {
    if (args.containsKey("id")) {
      id = args["id"];
    }
  }

  return CatelistState()
    ..loadingState = LoadingState.isLoading
    ..id = id
    ..initialIndex = 0;
}
