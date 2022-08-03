import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/sections/home/models/home.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeMusicState extends ItemListLike implements Cloneable<HomeMusicState> {
  LoadingState? loadingState;
  HomeMusicWrap? musicWrap;
  RefreshController? refreshController;
  bool? loadNoMoreData;
  GlobalKey<ScaffoldState> globalKey = GlobalKey();

  @override
  HomeMusicState clone() {
    return HomeMusicState()
      ..loadingState = loadingState
      ..musicWrap = musicWrap
      ..refreshController = refreshController
      ..loadNoMoreData = loadNoMoreData
      ..globalKey = globalKey;
  }

  @override
  Object getItemData(int index) {
    if (musicWrap?.data?.blocks == null ||
        musicWrap?.data?.blocks!.isEmpty == true) {
      return "";
    }
    return musicWrap!.data!.blocks![index];
  }

  @override
  String getItemType(int index) {
    if (musicWrap?.data?.blocks == null ||
        musicWrap?.data?.blocks!.isEmpty == true) {
      return "";
    }
    return musicWrap!.data!.blocks![index].blockCode ?? "";
  }

  @override
  int get itemCount => musicWrap?.data?.blocks?.length ?? 0;

  @override
  ItemListLike updateItemData(int index, Object data, bool isStateCopied) {
    musicWrap!.data!.blocks![index] = data as MusicItem;
    return this;
  }
}

HomeMusicState initState(Map<String, dynamic>? args) {
  return HomeMusicState()
    ..loadingState = LoadingState.isLoading
    ..refreshController = RefreshController(initialRefresh: false)
    ..loadNoMoreData = false;
}
