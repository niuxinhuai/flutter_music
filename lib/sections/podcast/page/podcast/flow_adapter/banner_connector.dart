import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/podcast/models/banner.dart';
import 'package:flutter_music/sections/podcast/page/podcast/state.dart';

class BannerConnector extends ConnOp<PodcastState, PodcastBannerWrap> {
  BannerConnector();

  @override
  PodcastBannerWrap? get(PodcastState? state) {
    return state?.bannerWrap;
  }

  @override
  void set(PodcastState state, PodcastBannerWrap subState) {
    state.bannerWrap = subState;
  }
}
