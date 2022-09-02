import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/square/models/recommend.dart';

import 'view.dart';

class RecommendRowComponent extends Component<RecommendSectionModel> {
  RecommendRowComponent()
      : super(
          view: buildView,
        );
}
