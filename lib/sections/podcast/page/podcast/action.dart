import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/podcast/models/banner.dart';
import 'package:flutter_music/sections/podcast/models/personalize.dart';
import 'package:flutter_music/sections/podcast/models/podcast.dart';

enum PodcastAction {
  action,
  onTapLeading,
  onTapHeaderMore,
  onTapError,
  onTapGridItem,
  onTapPersonalItem,
  onTapBanner,
  onTapNavAction,
  didError,
  didFeatchData
}

class PodcastActionCreator {
  static Action onAction() {
    return const Action(PodcastAction.action);
  }

  static Action onTapNavActionAction() {
    return const Action(PodcastAction.onTapNavAction);
  }

  static Action onTapHeaderMoreAction(PodcastStage stage) {
    return Action(PodcastAction.onTapHeaderMore, payload: stage);
  }

  static Action onTapPersonalItemAction(PersonalizeItem item) {
    return Action(PodcastAction.onTapPersonalItem, payload: item);
  }

  static Action onTapGridItemAction(RadiosItem item) {
    return Action(PodcastAction.onTapGridItem, payload: item);
  }

  static Action onTapBannerAction(PodcastBannerItem item) {
    return Action(PodcastAction.onTapBanner, payload: item);
  }

  static Action onTapLeadingAction() {
    return const Action(PodcastAction.onTapLeading);
  }

  static Action onTapErrorAction() {
    return const Action(PodcastAction.onTapError);
  }

  static Action didErrorAction() {
    return const Action(PodcastAction.didError);
  }

  static Action didFeatchDataAction(PodcastWrap wrap,
      PodcastBannerWrap bannerWrap, PersonalizeWrap personalizeWrap) {
    return Action(PodcastAction.didFeatchData,
        payload: Tuple3(wrap, bannerWrap, personalizeWrap));
  }
}
