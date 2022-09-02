import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/home/models/home.dart';
import 'package:flutter_music/sections/home/page/state.dart';
import 'package:flutter_music/sections/square/models/recommend.dart';
import 'package:flutter_music/sections/square/page/recommend/state.dart';

class CellConnector
    extends ConnOp<SquareRecommendState, RecommendSectionModel> {
  final int index;
  CellConnector({this.index = 0});

  @override
  RecommendSectionModel? get(SquareRecommendState? state) {
    if (index == 1) {
      return state?.everyDayRecommendMode;
    }
    if (index == 2) {
      return state?.recommendModel;
    }
    return null;
  }
}
