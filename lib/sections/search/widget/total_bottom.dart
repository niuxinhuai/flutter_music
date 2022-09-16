import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';

class TotalBottomWidget extends StatelessWidget {
  final String? text;
  TotalBottomWidget({this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 1,
          color: CommonColors.divider,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 10, bottom: 10),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text ?? "",
                style: GpOtherTheme.size13(context)!
                    .copyWith(color: CommonColors.textColor999),
              ),
              Icon(Icons.arrow_forward_ios,
                  size: 13, color: CommonColors.textColor999)
            ],
          ),
        )
      ],
    );
  }
}
