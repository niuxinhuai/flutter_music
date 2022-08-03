import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/sections/home/models/home.dart';
import 'package:flutter_music/sections/home/widget/calendar.dart';
import 'package:flutter_music/sections/home/widget/header.dart';

Widget buildView(MusicItem item, Dispatch dispatch, ViewService viewService) {
  double size = MediaQuery.of(viewService.context).size.width;
  double itemSie = (size - 70) / 3.0;
  return Container(
    padding: const EdgeInsets.only(bottom: 20),
    margin: const EdgeInsets.only(bottom: 10),
    color: CommonColors.foregroundColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RHeaderWidget(
          item: item,
          dispatch: dispatch,
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: CommonColors.divider,
        ),
        if (item.creatives != null && item.creatives?.isNotEmpty == true)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: item.creatives!.map((e) {
              int index = item.creatives!.indexOf(e);
              return Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (index != 0)
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: CommonColors.divider,
                      ),
                    CalendarItemWidget(
                      item: e.resources!.first,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
      ],
    ),
  );
}
