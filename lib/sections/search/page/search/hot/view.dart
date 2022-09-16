import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/search/models/search_hot.dart';
import 'package:flutter_music/widgets/card.dart';

import 'state.dart';

Widget buildView(
    SearchHotState state, Dispatch dispatch, ViewService viewService) {
  return _buildBody(state, dispatch, viewService);
}

Widget _buildBody(
    SearchHotState state, Dispatch dispatch, ViewService viewService) {
  if (state.wrap == null || state.wrap?.data?.isEmpty == true) {
    return Container(
      width: double.infinity,
      height: 80,
      alignment: Alignment.center,
      child: Text(
        "暂无数据哦～",
        style: GpOtherTheme.size14(viewService.context)
            .copyWith(color: CommonColors.textColor999),
      ),
    );
  }

  return GpCard(
    margin: EdgeInsets.only(left: 20, right: 150),
    padding: EdgeInsets.all(20),
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "热搜榜",
          style: GpOtherTheme.size17(viewService.context)!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          width: double.infinity,
          height: 1,
          color: CommonColors.divider,
        ),
        ListView.builder(
          itemCount: state.wrap?.data?.length ?? 0,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 20),
          itemBuilder: (BuildContext context, int index) {
            bool isTop = index <= 2;
            SearchHotDataItem item = state.wrap!.data![index];
            return Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Text(
                    "${index + 1}",
                    style: GpOtherTheme.size15(context)!.copyWith(
                        color: isTop ? Colors.red : CommonColors.textColor999),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      item.searchWord ?? "",
                      softWrap: true,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GpOtherTheme.size15(context)!.copyWith(
                          color: isTop
                              ? CommonColors.onSurfaceTextColor
                              : CommonColors.textColor999),
                    ),
                  ))
                ],
              ),
            );
          },
        )
      ],
    ),
  );
}
