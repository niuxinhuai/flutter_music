import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/home/models/home.dart';

import 'view.dart';

class HotPodcastsComponent extends Component<MusicItem> {
  HotPodcastsComponent()
      : super(
          view: buildView,
        );
}
