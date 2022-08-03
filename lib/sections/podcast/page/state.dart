import 'package:fish_redux/fish_redux.dart';

class PodcastState implements Cloneable<PodcastState> {
  @override
  PodcastState clone() {
    return PodcastState();
  }
}

PodcastState initState(Map<String, dynamic>? args) {
  return PodcastState();
}
