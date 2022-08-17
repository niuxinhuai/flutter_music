import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/Leaderboard/models/toplist.dart';
import 'package:flutter_music/sections/Leaderboard/page/state.dart';

class CellConnector extends ConnOp<LeaderboardState, ToplistDetailSection> {
  final int index;
  CellConnector({this.index = 0});

  @override
  ToplistDetailSection? get(LeaderboardState? state) {
    if (index > state!.sections!.length) return null;
    return state.sections![index];
  }
}
