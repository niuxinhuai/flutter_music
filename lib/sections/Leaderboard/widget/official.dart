import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/Leaderboard/models/leaderboard.dart';
import 'package:flutter_music/sections/Leaderboard/models/toplist.dart';
import 'package:flutter_music/sections/Leaderboard/page/action.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/widgets/card.dart';

class TopOfficialWidget extends StatefulWidget {
  final ToplistDetailSection? section;
  final Dispatch? dispatch;

  TopOfficialWidget({this.section, this.dispatch});

  @override
  _TopOfficialWidgetState createState() => _TopOfficialWidgetState();
}

class _TopOfficialWidgetState extends State<TopOfficialWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          widget.section!.items.map((e) => _buildItem(context, e)).toList(),
    );
  }

  Widget _buildItem(BuildContext context, BoardListItem item) {
    return GestureDetector(
      onTap: () {
        if (widget.dispatch != null) {
          widget.dispatch!(LeaderboardActionCreator.onTapGridItemAction(item));
        }
      },
      child: GpCard(
        width: double.infinity,
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 20),
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.name ?? "",
                    style: GpOtherTheme.size15(context)!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Text(
                    item.updateFrequency ?? "",
                    style: GpOtherTheme.size13Grey(context),
                  )
                ],
              ),
            ),
            Row(
              children: [
                ImageItemWidget(
                  url: item.coverImgUrl,
                  width: 100,
                  height: 100,
                ),
                if (item.tracks != null && item.tracks?.isNotEmpty == true)
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: item.tracks!
                        .map((e) => Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 5),
                                  child: Text(
                                    "${item.tracks!.indexOf(e) + 1}",
                                    style: GpOtherTheme.size15(context)!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  e.first ?? "",
                                  style: GpOtherTheme.size15(context),
                                ),
                                Expanded(
                                    child: Text(
                                  " - ${e.second ?? ""}",
                                  style: GpOtherTheme.size15(context)!.copyWith(
                                      fontSize: 14,
                                      color: CommonColors.textColor999),
                                  softWrap: true,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                )),
                                Container(
                                  width: 25,
                                  height: 25,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "新",
                                    style: GpOtherTheme.size12(context)!
                                        .copyWith(color: Colors.green),
                                  ),
                                )
                              ],
                            ))
                        .toList(),
                  ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
