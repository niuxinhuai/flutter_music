import 'package:flutter/material.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/sections/podcast/models/personalize.dart';
import 'package:flutter_music/widgets/search_text.dart';

class SearchUserWidget extends StatelessWidget {
  final List<PersonalizeDJ>? users;
  final String? searchKey;

  SearchUserWidget({this.users, this.searchKey});

  @override
  Widget build(BuildContext context) {
    return _buildListView();
  }

  Widget _buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(left: 20, right: 20),
      itemCount: users?.length,
      itemBuilder: (BuildContext context, int index) {
        PersonalizeDJ artistsItem = users![index];
        return Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: _buildItem(context, artistsItem),
        );
      },
    );
  }

  Widget _buildItem(BuildContext context, PersonalizeDJ dj) {
    return Row(
      children: [
        ImageItemWidget(
          url: dj.avatarUrl,
          width: 50,
          height: 50,
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                CustomSearchText(
                  searchContent: dj.nickname,
                  searchKey: searchKey,
                ),
                if (dj.gender != null)
                  Image.asset(
                    "assets/images/${(dj.gender ?? 0) == 1 ? "nml_varietyshow_admin_boy~iphone.png" : "nml_varietyshow_admin_girl~iphone.png"}",
                    width: 10,
                    fit: BoxFit.fitWidth,
                  ),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          padding: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
          child: Row(
            children: [
              Icon(
                Icons.add,
                color: Colors.red,
                size: 13,
              ),
              Text(
                "关注",
                style:
                    GpOtherTheme.size13(context)!.copyWith(color: Colors.red),
              )
            ],
          ),
        )
      ],
    );
  }
}
