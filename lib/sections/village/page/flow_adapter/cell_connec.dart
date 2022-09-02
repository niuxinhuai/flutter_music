import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/village/page/state.dart';

class CellConnector extends ConnOp<VillageState, String> {
  final int index;
  CellConnector({this.index = 0});

  @override
  String? get(VillageState? state) {
    return "";
  }
}
