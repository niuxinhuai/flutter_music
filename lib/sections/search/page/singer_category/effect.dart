import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/sections/search/models/singer_category.dart';
import 'package:flutter_music/utils/search_util.dart';
import 'package:flutter_music/widgets/toast.dart';
import 'action.dart';
import 'state.dart';

Effect<SingerCategoryState>? buildEffect() {
  return combineEffects(<Object, Effect<SingerCategoryState>>{
    SingerCategoryAction.action: _onAction,
    Lifecycle.initState: _initState,
    SingerCategoryAction.onTapError: _onTapError,
    SingerCategoryAction.onTapTopMenu: _onTapTopMenu,
  });
}

void _onAction(Action action, Context<SingerCategoryState> ctx) {}

void _initState(Action action, Context<SingerCategoryState> ctx) async {
  SearchSingerCategoryWrap? wrap = await CommonService.getSearchSingerCategory(
          ctx.state.type!, ctx.state.area!)
      .catchError(
          (e) => ctx.dispatch(SingerCategoryActionCreator.didErrorAction()));

  List<SearchSingerMenuModel> areaModels = [];
  SearchSingerCategoryUtils.areaMap.forEach((key, value) {
    SearchSingerMenuModel model = SearchSingerMenuModel();
    model.text = key;
    model.id = value;
    areaModels.add(model);
  });

  List<SearchSingerMenuModel> typeModels = [];
  SearchSingerCategoryUtils.typeMap.forEach((key, value) {
    SearchSingerMenuModel model = SearchSingerMenuModel();
    model.text = key;
    model.id = value;
    typeModels.add(model);
  });

  if (wrap != null && wrap.code == 200) {
    ctx.dispatch(SingerCategoryActionCreator.didFetchDataAction(
        areaModels, typeModels, wrap));
  } else {
    ctx.dispatch(SingerCategoryActionCreator.didErrorAction());
  }
}

void _onTapError(Action action, Context<SingerCategoryState> ctx) {
  _initState(action, ctx);
}

void _onTapTopMenu(Action action, Context<SingerCategoryState> ctx) {
  final SearchSingerMenuModel model = action.payload;
  SearchSingerMenuModel areaM = ctx.state.areaModels!.firstWhere(
      (element) => element.id == model.id,
      orElse: () => SearchSingerMenuModel());

  if (areaM.text?.isNotEmpty == true) {
    ///area 下存在
    ctx.state.area = model.id;
    ctx.state.areaModels!.forEach((element) {
      element.selected = false;
    });
    model.selected = true;

    SearchSingerMenuModel typeM = ctx.state.typeModels!.firstWhere(
        (element) => element.selected == true,
        orElse: () => SearchSingerMenuModel());
    if (typeM.text == null) {
      ctx.state.typeModels!.first.selected = true;
      ctx.state.type = ctx.state.typeModels!.first.id;
    }
  }

  SearchSingerMenuModel typeM = ctx.state.typeModels!.firstWhere(
      (element) => element.id == model.id,
      orElse: () => SearchSingerMenuModel());
  if (typeM.text?.isNotEmpty == true) {
    /// type 下存在
    ctx.state.type = model.id;
    ctx.state.typeModels!.forEach((element) {
      element.selected = false;
    });
    model.selected = true;

    SearchSingerMenuModel areaChildM = ctx.state.areaModels!.firstWhere(
        (element) => element.selected == true,
        orElse: () => SearchSingerMenuModel());
    if (areaChildM.text == null) {
      ctx.state.areaModels!.first.selected = true;
      ctx.state.area = ctx.state.areaModels!.first.id;
    }
  }

  Toast.toast(ctx.context, "type:${ctx.state.type} area:${ctx.state.area}");

  ///刷新，重新获取json
  ctx.dispatch(SingerCategoryActionCreator.didRefreshAction());
}
