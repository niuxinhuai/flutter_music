import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/Leaderboard/models/toplist.dart';

import 'view.dart';

class TopOfficialComponent extends Component<ToplistDetailSection> {
  TopOfficialComponent()
      : super(
          view: buildView,
        );
}
