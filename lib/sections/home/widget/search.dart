import 'package:flutter/material.dart';
import 'package:flutter_music/helper/router.dart';
import 'package:flutter_music/helper/router_helper.dart';
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/search/models/search_default.dart';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  SearchDefaultWrap? wrap;
  String keyword = "多远都要在一起~";

  @override
  void initState() {
    super.initState();

    _getSearchWord();
  }

  _getSearchWord() async {
    wrap = await CommonService.getSearchDefaultWord();
    if (wrap != null && wrap?.data?.showKeyword?.isNotEmpty == true) {
      setState(() {
        if (mounted) {
          setState(() {
            keyword = wrap!.data!.showKeyword!;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ARouter.open(context, RouterKeys.search, params: {"hintText": keyword});
      },
      child: Container(
        height: 44,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(22)),
            color: CommonColors.foregroundColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search),
            Text(
              keyword,
              style: GpOtherTheme.size15(context)!
                  .copyWith(color: CommonColors.textColor999),
            )
          ],
        ),
      ),
    );
  }
}
