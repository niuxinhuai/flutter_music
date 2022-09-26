import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/music/models/recommend.dart';
import 'package:flutter_music/sections/search/widget/singer_list.dart';
import 'package:flutter_music/widgets/search_text.dart';

class SearchLyricWidget extends StatefulWidget {
  final List<DailySongItem>? songs;
  final String? searchKey;

  SearchLyricWidget({this.songs, this.searchKey});

  @override
  _SearchLyricWidgetState createState() => _SearchLyricWidgetState();
}

class _SearchLyricWidgetState extends State<SearchLyricWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SearchSingerWidget(
      songs: widget.songs,
      searchKey: widget.searchKey,
      fromLyric: true,
    );
  }
}
