import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/square/models/recommend.dart';
import 'package:flutter_music/sections/square/widget/item.dart';

Widget buildView(RecommendSectionModel sectionModel, Dispatch dispatch,
    ViewService viewService) {
  double size = MediaQuery.of(viewService.context).size.width;
  double itemSie = (size - 70) / 3.0;

  return Container(
    padding: const EdgeInsets.only(bottom: 20),
    margin: const EdgeInsets.only(bottom: 10),
    color: CommonColors.foregroundColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
          child: Text(
            sectionModel.title ?? "",
            style: GpOtherTheme.size15(viewService.context)!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        if (sectionModel.items != null &&
            sectionModel.items?.isNotEmpty == true)
          SizedBox(
            height: itemSie + 45,
            width: size,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: sectionModel.items!.map((e) {
                  return Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: SquareItemWidget(
                      recommendItem: e,
                      size: itemSie,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
//          SingleChildScrollView(
//            scrollDirection: Axis.horizontal,
//            child: Row(
//              children: item.creatives!.map((e) {
////                int index = item.creatives!.indexOf(e);
//                return Padding(
//                  padding: EdgeInsets.only(left: 15),
//                  child: RItemWidget(
//                    item: e,
//                    size: itemSie,
//                  ),
//                );
//              }).toList(),
//            ),
//          ),
      ],
    ),
  );
}
