import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/music/widget/user_focus.dart';
import 'package:flutter_music/sections/video/models/detail.dart';

class UserDetailWidget extends StatefulWidget {
  final VideoDetailWrap? detailWrap;

  UserDetailWidget({this.detailWrap});

  @override
  _UserDetailWidgetState createState() => _UserDetailWidgetState();
}

class _UserDetailWidgetState extends State<UserDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Spacer(),
          Row(
            children: [
              DetailUserFocusWidget(
                hasFocus: true,
                name: widget.detailWrap?.data?.creator?.nickname,
                avatarUrl: widget.detailWrap?.data?.creator?.avatarUrl,
                bottomUrl: widget
                    .detailWrap?.data?.creator?.avatarDetail?.identityIconUrl,
              ),
              _buildAdd()
            ],
          ),
          Text(
            widget.detailWrap?.data?.description ?? "",
            style: GpOtherTheme.size15(context)!
                .copyWith(color: CommonColors.onPrimaryTextColor),
            softWrap: true,
            maxLines: 2,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    ));
  }

  Widget _buildAdd() {
    return Container(
      margin: EdgeInsets.only(left: 5),
      padding: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
      decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
