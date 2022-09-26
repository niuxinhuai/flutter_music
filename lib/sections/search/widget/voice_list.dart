import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/sections/search/models/search_voice.dart';
import 'package:flutter_music/utils/mathUtil.dart';
import 'package:flutter_music/utils/time_utl.dart';
import 'package:flutter_music/widgets/search_text.dart';

class SearchVoiceWidget extends StatelessWidget {
  final SearchVoiceWrap? wrap;
  final String? searchKey;

  SearchVoiceWidget({this.wrap, this.searchKey});

  @override
  Widget build(BuildContext context) {
    return _buildListView();
  }

  Widget _buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(left: 20, right: 20),
      itemCount: wrap?.data?.resources?.length,
      itemBuilder: (BuildContext context, int index) {
        SearchVoiceResourceItem artistsItem = wrap!.data!.resources![index];
        return Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: _buildItem(context, artistsItem),
        );
      },
    );
  }

  Widget _buildItem(BuildContext context, SearchVoiceResourceItem item) {
    return Row(
      children: [
        ImageItemWidget(
          url: item.baseInfo?.coverUrl,
          width: 50,
          height: 50,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSearchText(
                  searchContent: item.baseInfo?.name,
                  searchKey: searchKey,
                  maxLines: 1,
                ),
                Text(
                  '${TimeUtils.getMinuteFromMillSecond(item.baseInfo?.duration ?? 0)}，by ${item.baseInfo?.dj?.nickname}，播放${MathUtils.getPlayNumberStr(item.baseInfo?.listenerCount ?? 0)}次',
                  softWrap: true,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GpOtherTheme.size12(context)!
                      .copyWith(color: CommonColors.textColor999),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          alignment: Alignment.center,
          child: Icon(
            Icons.play_arrow,
            color: Colors.red,
            size: 20,
          ),
        )
      ],
    );
  }
}
