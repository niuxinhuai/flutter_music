import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/podcast/models/podcast.dart';
import 'package:flutter_music/sections/podcast/page/podcast/state.dart';

class CellConnector extends ConnOp<PodcastState, PodcastStage> {
  final int index;
  CellConnector({this.index = 0});

  @override
  PodcastStage? get(PodcastState? state) {
    if (index > state!.podcastWrap!.data!.length) return null;
    return state.podcastWrap!.data![index];
  }
}
