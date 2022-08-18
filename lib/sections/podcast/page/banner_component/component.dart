import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/podcast/models/banner.dart';

import 'view.dart';

class SwiperBannerComponent extends Component<PodcastBannerWrap> {
  SwiperBannerComponent()
      : super(
          view: buildView,
        );
}
