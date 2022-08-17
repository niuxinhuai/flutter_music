import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/Leaderboard/models/Leaderboard.dart';
import 'package:flutter_music/sections/Leaderboard/models/toplist.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

class LeaderboardState extends ItemListLike
    implements Cloneable<LeaderboardState> {
  LeaderboardWrap? wrap;
  LoadingState? loadingState;
  List<ToplistDetailSection>? sections;

  @override
  LeaderboardState clone() {
    return LeaderboardState()
      ..wrap = wrap
      ..loadingState = loadingState
      ..sections = sections;
  }

  @override
  Object getItemData(int index) {
    if (sections == null) {
      return "";
    }
    return sections![index];
  }

  @override
  String getItemType(int index) {
    if (sections == null || sections?.isEmpty == true) {
      return "";
    }
    return sections![index].title ?? "";
  }

  @override
  int get itemCount => sections?.length ?? 0;

  @override
  ItemListLike updateItemData(int index, Object data, bool isStateCopied) {
    sections![index] = data as ToplistDetailSection;
    return this;
  }
}

LeaderboardState initState(Map<String, dynamic>? args) {
  return LeaderboardState()
    ..loadingState = LoadingState.isLoading
    ..sections = [];
}
