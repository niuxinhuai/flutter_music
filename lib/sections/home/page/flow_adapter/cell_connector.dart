import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/home/models/home.dart';
import 'package:flutter_music/sections/home/page/state.dart';

class CellConnector extends ConnOp<HomeMusicState, MusicItem> {
  final int index;
  CellConnector({this.index = 0});

  @override
  MusicItem? get(HomeMusicState? state) {
    if (index > state!.musicWrap!.data!.blocks!.length) return null;
    return state.musicWrap!.data!.blocks![index];
  }
}
