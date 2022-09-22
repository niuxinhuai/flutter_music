import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/search/models/singer_category.dart';

enum SingerCategoryAction {
  action,
  onTapTopMenu,
  onTapError,
  didError,
  didFetchData,
  didRefresh
}

class SingerCategoryActionCreator {
  static Action onAction() {
    return const Action(SingerCategoryAction.action);
  }

  static Action onTapTopMenuAction(SearchSingerMenuModel model) {
    return Action(SingerCategoryAction.onTapTopMenu, payload: model);
  }

  static Action didErrorAction() {
    return const Action(SingerCategoryAction.didError);
  }

  static Action onTapErrorAction() {
    return const Action(SingerCategoryAction.onTapError);
  }

  static Action didRefreshAction() {
    return const Action(SingerCategoryAction.didRefresh);
  }

  static Action didFetchDataAction(List<SearchSingerMenuModel> areaModels,
      List<SearchSingerMenuModel> typeModels, SearchSingerCategoryWrap wrap) {
    return Action(SingerCategoryAction.didFetchData,
        payload: Tuple3(areaModels, typeModels, wrap));
  }
}
