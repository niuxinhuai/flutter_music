import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/repository/share_preferences/sp.dart';
import 'package:flutter_music/sections/square/models/catlist.dart';
import 'package:flutter_music/widgets/toast.dart';
import 'action.dart';
import 'state.dart';

Effect<SquareEditState>? buildEffect() {
  return combineEffects(<Object, Effect<SquareEditState>>{
    SquareEditAction.action: _onAction,
    Lifecycle.initState: _initState,
    SquareEditAction.onTapItem: _onTapItem,
  });
}

void _initState(Action action, Context<SquareEditState> ctx) async {
  CatlistWrap wrap = await CommonService.getCatlist().catchError((e) {
    Toast.toast(ctx.context, "出错啦");
  });
  if (wrap.code == 200) {
    if (wrap.categories != null && wrap.categories?.isNotEmpty == true) {
      List<CatlistSectionModel> sections = [];
      wrap.categories!.forEach((key, value) {
        sections.add(CatlistSectionModel()
          ..key = key
          ..value = value);
      });
      List<CatlistSubItem>? cacheList = await SpUtil.getUserSquareSource();

      if (sections.isNotEmpty == true) {
        if (wrap.sub != null && wrap.sub?.isNotEmpty == true) {
          for (CatlistSectionModel sectionModel in sections) {
            List<CatlistSubItem> items = [];
            for (int i = 0; i < wrap.sub!.length; ++i) {
              CatlistSubItem subItem = wrap.sub![i];
              if (subItem.category != null &&
                  (subItem.category.toString() == sectionModel.key)) {
                if (cacheList?.isNotEmpty == true) {
                  CatlistSubItem cacheItem = cacheList!.firstWhere(
                      (element) => element.name == subItem.name,
                      orElse: () => CatlistSubItem());
                  if (cacheItem.name != null) {
                    subItem.inTop = true;
                  }
                }
                items.add(subItem);
              }
            }
            sectionModel.items = items;
          }
        }
      }

      if (cacheList?.isNotEmpty == true) {
        ///肯定会有数据
        CatlistSectionModel cacheModel = CatlistSectionModel();
        cacheModel.items = cacheList;
        cacheModel.key = "-1";
        cacheModel.value = "我的歌单广场";
        cacheModel.sub = "(长按可编辑)";
        cacheModel.canEdit = true;
        sections.insert(0, cacheModel);
      }
      ctx.dispatch(SquareEditActionCreator.didFetchDataAction(sections));
    }
  } else {
    Toast.toast(ctx.context, "数据获取有问题");
  }
}

///点击了item
void _onTapItem(Action action, Context<SquareEditState> ctx) async {
  final Tuple2 tuple2 = action.payload;
  CatlistSubItem subItem = tuple2.i0;
  CatlistSectionModel sectionModel = tuple2.i1;
  bool isUserSquare = subItem.inTop == true && sectionModel.isUser() == true;
  if (isUserSquare) {
    ///点击了我的歌单，此时做删除操作，但是要考虑最少数量，minCount
    if (sectionModel.items!.length <= ctx.state.minCount!) {
      Toast.toast(ctx.context, "真的不能再少了~");
    } else {
      sectionModel.items!.remove(subItem);
      ctx.state.sections!.forEach((section) {
        CatlistSubItem catlistSubItem = section.items!.firstWhere(
            (item) => item.name == subItem.name,
            orElse: () => CatlistSubItem());
        if (catlistSubItem.name != null &&
            catlistSubItem.name?.isNotEmpty == true) {
          catlistSubItem.inTop = false;
        }
      });
    }
  } else {
    ///点击le底部的歌单广场数据，此时做新增操作
    subItem.inTop = true;
    ctx.state.sections!.first.items!.add(subItem);
  }
  ctx.dispatch(SquareEditActionCreator.didTapItemAction());
}

void _onAction(Action action, Context<SquareEditState> ctx) async {}
