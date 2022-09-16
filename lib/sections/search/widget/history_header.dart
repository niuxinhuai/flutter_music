import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';

class SearchHistoryHeaderWidget extends StatelessWidget {
  final String? text;
  final VoidCallback? callback;
  final String? imageNamed;

  SearchHistoryHeaderWidget({this.text, this.callback, this.imageNamed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text ?? "",
          style: GpOtherTheme.size15(context)!.copyWith(
              color: CommonColors.onSurfaceTextColor,
              fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {
            if (callback != null) {
              callback!();
            }
          },
          child: Image.asset(
            "assets/images/$imageNamed",
            width: 25,
            height: 25,
            fit: BoxFit.cover,
            color: CommonColors.textColor999,
          ),
        )
      ],
    );
  }
}
