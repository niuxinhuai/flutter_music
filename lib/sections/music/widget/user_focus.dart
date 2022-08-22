import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';

class DetailUserFocusWidget extends StatefulWidget {
  String? avatarUrl;
  String? name;
  bool? hasFocus;

  DetailUserFocusWidget({this.avatarUrl, this.name, this.hasFocus});

  @override
  _DetailUserFocusWidgetState createState() => _DetailUserFocusWidgetState();
}

class _DetailUserFocusWidgetState extends State<DetailUserFocusWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildUserAvaFocus();
  }

  ///用户个人头像，用户名，关注按钮
  Widget _buildUserAvaFocus() {
    return Padding(
      padding: EdgeInsets.only(top: 15, bottom: 20),
      child: Row(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  child: CachedNetworkImage(
                    imageUrl: widget.avatarUrl ?? "",
                    fit: BoxFit.fill,
                    width: 28,
                    height: 28,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/cm2_icn_daren~iphone.png",
                  width: 14,
                  height: 14,
                ),
              )
            ],
          ),
          Text(
            widget.name ?? "",
            style: GpOtherTheme.size12(context)!
                .copyWith(color: CommonColors.textColor999, fontSize: 13),
          ),
          _buildFocusWidget()
        ],
      ),
    );
  }

  Widget _buildFocusWidget() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      padding: EdgeInsets.only(left: 4, right: 8, top: 3, bottom: 3),
      child: Row(
        children: [
          Icon(
            Icons.add,
            color: Colors.white,
            size: 14,
          ),
          Text(
            "关注",
            style: GpOtherTheme.size12(context)!
                .copyWith(fontSize: 10, color: CommonColors.onPrimaryTextColor),
          )
        ],
      ),
    );
  }
}
