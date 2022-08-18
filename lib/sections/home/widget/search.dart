import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(22)),
          color: CommonColors.foregroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search),
          Text(
            "多远都要在一起~",
            style: GpOtherTheme.size15(context)!
                .copyWith(color: CommonColors.textColor999),
          )
        ],
      ),
    );
  }
}
