import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/search/models/singer_category.dart';
import 'package:flutter_music/utils/search_util.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

class SingerCategoryState implements Cloneable<SingerCategoryState> {
  int? type;
  int? area;

  List<SearchSingerMenuModel>? typeModels;
  List<SearchSingerMenuModel>? areaModels;

  LoadingState? loadingState;
  SearchSingerCategoryWrap? wrap;

  @override
  SingerCategoryState clone() {
    return SingerCategoryState()
      ..type = type
      ..area = area
      ..areaModels = areaModels
      ..typeModels = typeModels
      ..loadingState = loadingState
      ..wrap = wrap;
  }
}

SingerCategoryState initState(Map<String, dynamic>? args) {
  return SingerCategoryState()
    ..type = SearchSingerCategoryUtils.total_type
    ..area = SearchSingerCategoryUtils.area_total
    ..areaModels = []
    ..typeModels = []
    ..loadingState = LoadingState.isLoading;
}
