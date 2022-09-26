import 'package:flutter/material.dart';
import 'package:flutter_music/utils/span_util.dart';

class CustomSearchText extends StatelessWidget {
  final String? searchContent;
  final String? searchKey;
  final int? fontSize;
  final Color? fontColor;

  CustomSearchText(
      {this.searchContent,
      this.searchKey,
      this.fontSize = 17,
      this.fontColor = const Color(0xff3c3c3c)});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            children: CustomTextSpan.getSearchLightTextSpanList(
                searchContent ?? "",
                searchContent: searchKey ?? "哪里都是你",
                fontSize: fontSize!,
                fontColor: fontColor!)),
        softWrap: true,
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        maxLines: 200);
  }
}
