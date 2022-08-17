import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/Leaderboard/models/toplist.dart';

import 'view.dart';

class TopRecommendComponent extends Component<ToplistDetailSection> {
  TopRecommendComponent()
      : super(
          view: buildView,
        );
}
