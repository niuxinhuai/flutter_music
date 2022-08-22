import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/podcast/models/detail.dart';
import 'package:flutter_music/sections/podcast/models/detail_list.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

class PodcastDetailState implements Cloneable<PodcastDetailState> {
  LoadingState? loadingState;
  PodcastDetailWrap? detailWrap;
  List<DetailProgramsItem>? items;
  int? rid;
  String? coverImgUrl;
  int? playCount;

  @override
  PodcastDetailState clone() {
    return PodcastDetailState()
      ..loadingState = loadingState
      ..detailWrap = detailWrap
      ..items = items
      ..rid = rid
      ..coverImgUrl = coverImgUrl
      ..playCount = playCount;
  }
}

PodcastDetailState initState(Map<String, dynamic>? args) {
  int rid = 792166506;
  String coverImgUrl = "";
  int playcount = 0;
  if (args != null && args.keys.contains("rid")) {
    rid = args["rid"];
  }

  if (args != null && args.keys.contains("coverImgUrl")) {
    coverImgUrl = args["coverImgUrl"];
  }

  if (args != null && args.keys.contains("playcount")) {
    playcount = args["playcount"];
  }

  return PodcastDetailState()
    ..loadingState = LoadingState.isLoading
    ..items = []
    ..rid = rid
    ..coverImgUrl = coverImgUrl
    ..playCount = playcount;
}
