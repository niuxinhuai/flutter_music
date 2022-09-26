import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/sections/podcast/models/personalize.dart';
import 'package:flutter_music/sections/search/widget/total_bottom.dart';
import 'package:flutter_music/sections/search/widget/user_list.dart';
import 'package:flutter_music/widgets/card.dart';
import 'package:flutter_music/widgets/search_text.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(UserState state, Dispatch dispatch, ViewService viewService) {
  return GpCard(
    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            "用户",
            style: GpOtherTheme.size17(viewService.context)!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        if (state.item?.users != null && state.item?.users?.isNotEmpty == true)
          SearchUserWidget(
            users: state.item?.users,
            searchKey: state.searchKey,
          ),
        TotalBottomWidget(
          text: state.item?.moreText,
        )
      ],
    ),
  );
}
