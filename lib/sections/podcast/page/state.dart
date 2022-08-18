import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/sections/podcast/models/banner.dart';
import 'package:flutter_music/sections/podcast/models/personalize.dart';
import 'package:flutter_music/sections/podcast/models/podcast.dart';
import 'package:flutter_music/utils/podcast_util.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

class PodcastState extends ItemListLike implements Cloneable<PodcastState> {
  LoadingState? loadingState;
  GlobalKey<ScaffoldState> globalKey = GlobalKey();
  PodcastWrap? podcastWrap;
  PodcastBannerWrap? bannerWrap;
  PersonalizeWrap? personalizeWrap;

  @override
  PodcastState clone() {
    return PodcastState()
      ..loadingState = loadingState
      ..globalKey = globalKey
      ..podcastWrap = podcastWrap
      ..bannerWrap = bannerWrap
      ..personalizeWrap = personalizeWrap;
  }

  @override
  Object getItemData(int index) {
    if (podcastWrap?.data == null || podcastWrap?.data?.isEmpty == true) {
      return "";
    }
    if (podcastWrap!.data![index].categoryId == PodcastUtils.dj_banner &&
        bannerWrap != null) {
      return bannerWrap!;
    }
    if (podcastWrap!.data![index].categoryId == PodcastUtils.dj_perfered &&
        personalizeWrap != null) {
      return personalizeWrap!;
    }
    return podcastWrap!.data![index];
  }

  @override
  String getItemType(int index) {
    if (podcastWrap?.data == null || podcastWrap?.data?.isEmpty == true) {
      return "";
    }
    return podcastWrap!.data![index].categoryId?.toString() ?? "";
  }

  @override
  int get itemCount => podcastWrap?.data?.length ?? 0;

  @override
  ItemListLike updateItemData(int index, Object data, bool isStateCopied) {
    podcastWrap!.data![index] = data as PodcastStage;
    return this;
  }
}

PodcastState initState(Map<String, dynamic>? args) {
  return PodcastState()..loadingState = LoadingState.isLoading;
}
