import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/sections/search/models/search_result.dart';
import 'package:flutter_music/sections/search/models/singer_category.dart';
import 'package:flutter_music/widgets/appbar.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SingerCategoryState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: CommonColors.foregroundColor,
    appBar: GpAppBar(
      elevation: 0,
      title: Text("歌手分类"),
    ),
    body: LoadingWrap(
      loadingState: state.loadingState,
      successChild: Builder(
        builder: (context) {
          return _buildBody(state, dispatch, viewService);
        },
      ),
      onErrorTap: () =>
          dispatch(SingerCategoryActionCreator.onTapErrorAction()),
    ),
  );
}

Widget _buildBody(
    SingerCategoryState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildWrap(state, dispatch, viewService, state.areaModels!, 20),
        _buildWrap(state, dispatch, viewService, state.typeModels!, 35),
        _buildHeader(state, dispatch, viewService),
        _buildListView(state, dispatch, viewService),
      ],
    ),
  );
}

Widget _buildWrap(SingerCategoryState state, Dispatch dispatch,
    ViewService viewService, List<SearchSingerMenuModel> models, double scale) {
  return Padding(
    padding: EdgeInsets.only(left: 15, right: 15, top: 20),
    child: Wrap(
      spacing: scale,
      children: models
          .map((e) => GestureDetector(
                onTap: () =>
                    dispatch(SingerCategoryActionCreator.onTapTopMenuAction(e)),
                child: Container(
                  child: Text(
                    e.text ?? "",
                    style: GpOtherTheme.size15(viewService.context)!.copyWith(
                        color: e.selected ? Colors.red : Colors.black),
                  ),
                ),
              ))
          .toList(),
    ),
  );
}

Widget _buildHeader(
    SingerCategoryState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    margin: EdgeInsets.only(top: 20, bottom: 10),
    width: double.infinity,
    height: 30,
    color: CommonColors.divider,
    padding: EdgeInsets.only(left: 15, top: 5, bottom: 5),
    child: Text(
      "热门歌手",
      style: GpOtherTheme.size12(viewService.context)!
          .copyWith(color: CommonColors.textColor999),
    ),
  );
}

Widget _buildListView(
    SingerCategoryState state, Dispatch dispatch, ViewService viewService) {
  return Expanded(
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: state.wrap?.artists?.length ?? 0,
      itemBuilder: (context, index) {
        ArtistsItem item = state.wrap!.artists![index];
        bool follow = item.followed ?? false;
        return Container(
          margin: EdgeInsets.only(bottom: 25),
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Row(
            children: [
              ImageItemWidget(
                needAddParam: true,
                url: item.img1v1Url,
                width: 50,
                height: 50,
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                      text: "  ${item.name ?? ""}",
                      style: GpOtherTheme.size15(context),
                      children: [
                        if (item.alias?.isNotEmpty == true)
                          TextSpan(
                              text: " (${item.alias!.first} )",
                              style: GpOtherTheme.size13(context)!
                                  .copyWith(color: CommonColors.textColor999)),
                        if (item.accountId != null)
                          WidgetSpan(
                              child: Image.asset(
                                  "assets/images/cm2_icn_enter~iphone.png")),
                      ]),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                child: follow
                    ? Text(
                        "已关注",
                        style: GpOtherTheme.size13(context)!
                            .copyWith(color: Colors.red),
                      )
                    : Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.red,
                          ),
                          Text(
                            "关注",
                            style: GpOtherTheme.size13(context)!
                                .copyWith(color: Colors.red),
                          )
                        ],
                      ),
              )
            ],
          ),
        );
      },
    ),
  );
}
