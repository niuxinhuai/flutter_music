import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/sections/village/models/category.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

class VillageState implements Cloneable<VillageState> {
  LoadingState? loadingState;
  GlobalKey<ScaffoldState> globalKey = GlobalKey();
  VideoCategoryWrap? categoryWrap;

  @override
  VillageState clone() {
    return VillageState()
      ..loadingState = loadingState
      ..globalKey = globalKey
      ..categoryWrap = categoryWrap;
  }
}

VillageState initState(Map<String, dynamic>? args) {
  return VillageState()..loadingState = LoadingState.isLoading;
}
