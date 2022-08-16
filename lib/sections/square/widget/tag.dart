import 'package:flutter/material.dart';
import 'package:flutter_music/repository/share_preferences/sp.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/square/models/tag.dart';

class TagsListWidget extends StatefulWidget {
  final List<Tag>? tags;
  final Function(String)? callback;

  TagsListWidget({this.tags, this.callback});

  @override
  _TagsListWidgetState createState() => _TagsListWidgetState();
}

class _TagsListWidgetState extends State<TagsListWidget> {
  String tag_name = "";

  @override
  void initState() {
    super.initState();
    _getTag();
  }

  void _getTag() async {
    String? tagStr = await SpUtil.getSquareTag();
    if (tagStr != null && tagStr.isNotEmpty == true) {
      setState(() {
        tag_name = tagStr;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
          color: CommonColors.foregroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0))),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              "所有精品歌单",
              style: GpOtherTheme.size19(context)!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: double.infinity,
                  child: _buildItem("全部精品"),
                ),
                GridView.builder(
                    itemCount: widget.tags?.length ?? 0,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 20,
                        childAspectRatio: 2),
                    itemBuilder: (BuildContext context, int index) {
                      Tag tag = widget.tags![index];
                      return _buildItem(tag.name ?? "");
                    }),
                Container(
                  padding: EdgeInsets.only(top: 50, bottom: 70),
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    '什么是精品歌单～',
                    style: GpOtherTheme.size15(context),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildItem(String name) {
    bool isSame = name == tag_name;
    return GestureDetector(
      onTap: () {
        if (widget.callback != null) {
          widget.callback!(name);
        }
        if (mounted) {
          setState(() {
            tag_name = name;
          });
        }
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
            color: isSame ? Colors.red : Color(0xFFF2F1F2),
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Text(
          name,
          style: GpOtherTheme.size15(context)!.copyWith(
              color: isSame
                  ? CommonColors.onPrimaryTextColor
                  : CommonColors.onSurfaceTextColor),
        ),
      ),
    );
  }
}
