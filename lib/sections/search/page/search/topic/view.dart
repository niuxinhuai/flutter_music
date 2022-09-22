import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/search/models/search_hot_topic.dart';
import 'package:flutter_music/widgets/card.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SearchTopicState state, Dispatch dispatch, ViewService viewService) {
  return _buildBody(state, dispatch, viewService);
}

Widget _buildBody(
    SearchTopicState state, Dispatch dispatch, ViewService viewService) {
  double width = MediaQuery.of(viewService.context).size.width - 170;
  if (state.wrap == null || state.wrap?.hot?.isEmpty == true) {
    return Container(
      width: width,
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
    margin: EdgeInsets.only(left: 0, right: 20),
    padding: EdgeInsets.all(20),
    width: width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "话题榜",
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
          itemCount: state.wrap?.hot?.length ?? 0,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 20),
          itemBuilder: (BuildContext context, int index) {
            bool isTop = index <= 2;
            SearchHotTopicItem item = state.wrap!.hot![index];
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
                      item.title ?? "",
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
