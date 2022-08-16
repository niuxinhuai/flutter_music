import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/helper/router.dart';
import 'package:flutter_music/helper/router_helper.dart';
import 'package:flutter_music/models/common_model.dart';
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/repository/share_preferences/sp.dart';
import 'package:flutter_music/sections/square/models/catlist.dart';
import 'package:flutter_music/sections/square/models/square.dart';
import 'action.dart';
import 'state.dart';

Effect<PlaylistSquareState>? buildEffect() {
  return combineEffects(<Object, Effect<PlaylistSquareState>>{
    PlaylistSquareAction.action: _onAction,
    Lifecycle.initState: _initState,
    PlaylistSquareAction.onTapEditButton: _onTapEditButton,
  });
}

void _initState(Action action, Context<PlaylistSquareState> ctx) async {
  eventBus.on<EventBusFireModule>().listen((event) {
    if (event.squareRefresh != null && event.squareRefresh == true) {
      _reload(action, ctx);
    }
  });

  _reload(action, ctx);
}

void _reload(Action action, Context<PlaylistSquareState> ctx) async {
  List<CatlistSubItem>? list = await SpUtil.getUserSquareSource();
  if (list != null && list.isNotEmpty == true) {
    ctx.dispatch(PlaylistSquareActionCreator.didFeatchDataAction(list));
  } else {
    SquareHotWrap wrap = await CommonService.getHotCategory();

    if (wrap.code != null && wrap.code == 200) {
      List<CatlistSubItem> items = ctx.state.normalList!
          .map((e) => CatlistSubItem()
            ..name = e
            ..canMove = false
            ..inTop = true)
          .toList();

      ///显示数量未设上线
      if (wrap.tags?.isNotEmpty == true) {
        List<CatlistSubItem> list = wrap.tags!
            .map((e) => CatlistSubItem()
              ..name = e.name ?? ""
              ..hot = e.hot
              ..inTop = true)
            .toList();
        items.addAll(list);
      }
      setUserCache(items);

      ctx.dispatch(PlaylistSquareActionCreator.didFeatchDataAction(items));
    }
  }
}

void setUserCache(List<CatlistSubItem> items) async {
  SpUtil.setUserSquareSource(items);
}

void _onTapEditButton(Action action, Context<PlaylistSquareState> ctx) {
  ARouter.open(ctx.context, RouterKeys.square_edit);
}

void _onAction(Action action, Context<PlaylistSquareState> ctx) {}
