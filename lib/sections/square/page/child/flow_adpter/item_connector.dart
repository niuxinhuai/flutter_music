import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/square/models/playlist.dart';
import 'package:flutter_music/sections/square/page/child/state.dart';

class ItemConnertor extends ConnOp<SquareChildState, PlaylistSquareWrap> {
  @override
  PlaylistSquareWrap? get(SquareChildState? state) {
    return state?.squareWrap;
  }

  @override
  void set(SquareChildState state, PlaylistSquareWrap subState) {
    state.squareWrap = subState;
  }
}
