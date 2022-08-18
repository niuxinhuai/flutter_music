import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/podcast/models/personalize.dart';
import 'package:flutter_music/sections/podcast/page/state.dart';

class PersonalConnector extends ConnOp<PodcastState, PersonalizeWrap> {
  PersonalConnector();

  @override
  PersonalizeWrap? get(PodcastState? state) {
    return state?.personalizeWrap;
  }

  @override
  void set(PodcastState state, PersonalizeWrap subState) {
    state.personalizeWrap = subState;
  }
}