import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/search/models/search_result.dart';
import 'package:flutter_music/sections/search/widget/total_bottom.dart';
import 'package:flutter_music/widgets/card.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SimQueryState state, Dispatch dispatch, ViewService viewService) {
  return GpCard(
    width: double.infinity,
    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            "相关搜索",
            style: GpOtherTheme.size17(viewService.context)!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        if (state.item?.sim_querys != null &&
            state.item?.sim_querys?.isNotEmpty == true)
          _buildWrap(state, dispatch, viewService),
//        TotalBottomWidget(
//          text: state.item?.moreText,
//        )
      ],
    ),
  );
}

Widget _buildWrap(
    SimQueryState state, Dispatch dispatch, ViewService viewService) {
  return Padding(
    padding: EdgeInsets.all(20),
    child: Wrap(
      spacing: 10,
      runSpacing: 10,
      children: state.item!.sim_querys!
          .map((e) => _buildItem(viewService.context, e))
          .toList(),
    ),
  );
}

Widget _buildItem(BuildContext context, SimqueryItem item) {
  return Container(
    padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
    decoration: BoxDecoration(
      color: CommonColors.divider,
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    ),
    child: Text(
      item.keyword ?? "",
      style: GpOtherTheme.size13(context)!
          .copyWith(color: CommonColors.onSurfaceTextColor),
    ),
  );
}
