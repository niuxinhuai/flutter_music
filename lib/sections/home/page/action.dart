import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/home/models/home.dart';

enum HomeMusicAction {
  action,
  onTapLeading,
  onRefresh,
  onTapBanner,
  onTapCustomIcon,
  onTapRecommendMore,
  onTapRecommendItem,
  onTapAlbumItem,
  onTapYuncunItem,
  onTapBroadcastItem,
  onTapCalendarItem,
  onChildItemScrollLoading,
  didRefresh,
  didFetchData
}

class HomeMusicActionCreator {
  static Action onAction() {
    return const Action(HomeMusicAction.action);
  }

  static Action onTapBannerAction(MusicBanner banner) {
    return Action(HomeMusicAction.onTapBanner, payload: banner);
  }

  static Action onTapCustomIconAction(String title) {
    return Action(HomeMusicAction.onTapCustomIcon, payload: title);
  }

  static Action onTapRecommendMoreAction(UiElementButton elementButton) {
    return Action(HomeMusicAction.onTapRecommendMore, payload: elementButton);
  }

  static Action onTapRecommendItemAction(ResourcesItem item) {
    return Action(HomeMusicAction.onTapRecommendItem, payload: item);
  }

  static Action onTapAlbumItemAction(ResourcesItem resourcesItem) {
    return Action(HomeMusicAction.onTapAlbumItem, payload: resourcesItem);
  }

  static Action onTapYuncunItemAction(ResourcesItem resourcesItem) {
    return Action(HomeMusicAction.onTapYuncunItem, payload: resourcesItem);
  }

  static Action onTapBroadcastItemAction(ResourcesItem resourcesItem) {
    return Action(HomeMusicAction.onTapBroadcastItem, payload: resourcesItem);
  }

  static Action onTapCalendarItemAction(ResourcesItem resourcesItem) {
    return Action(HomeMusicAction.onTapCalendarItem, payload: resourcesItem);
  }

  static Action onChildItemScrollLoadingAction(MusicItem musicItem) {
    return Action(HomeMusicAction.onChildItemScrollLoading, payload: musicItem);
  }

  static Action onRefreshAction() {
    return const Action(HomeMusicAction.onRefresh);
  }

  static Action onTapLeadingAction() {
    return const Action(HomeMusicAction.onTapLeading);
  }

  static Action didRefreshAction(HomeMusicWrap? wrap) {
    return Action(HomeMusicAction.didRefresh, payload: wrap);
  }

  static Action didFetchDataAction(HomeMusicWrap? wrap) {
    return Action(HomeMusicAction.didFetchData, payload: wrap);
  }
}
