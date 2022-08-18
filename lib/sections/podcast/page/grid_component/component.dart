import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/podcast/models/podcast.dart';

import 'view.dart';

class GridItemComponent extends Component<PodcastStage> {
  GridItemComponent()
      : super(
          view: buildView,
        );
}
