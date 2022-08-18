import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/podcast/models/podcast.dart';
import 'package:flutter_music/sections/podcast/page/banner_component/component.dart';
import 'package:flutter_music/sections/podcast/page/flow_adapter/banner_connector.dart';
import 'package:flutter_music/sections/podcast/page/flow_adapter/cell_connector.dart';
import 'package:flutter_music/sections/podcast/page/flow_adapter/personal_connector.dart';
import 'package:flutter_music/sections/podcast/page/grid_component/component.dart';
import 'package:flutter_music/sections/podcast/page/personal_component/component.dart';
import 'package:flutter_music/sections/podcast/page/row_component/component.dart';
import 'package:flutter_music/sections/podcast/page/state.dart';
import 'package:flutter_music/utils/podcast_util.dart';

FlowAdapter<PodcastState> get adapter => FlowAdapter<PodcastState>(
    view: (PodcastState state) => DependentArray(
        builder: (int index) {
          PodcastStage item = state.podcastWrap!.data![index];
          int categoryId = item.categoryId ?? 0;
          if (PodcastUtils.gridItems.contains(categoryId)) {
            ///grid
            return CellConnector(index: index) + GridItemComponent();
          } else if (PodcastUtils.otherItems.contains(categoryId)) {
            ///row
            return CellConnector(index: index) + LifeComponent();
          } else if (categoryId == PodcastUtils.dj_banner) {
            ///banner
            return BannerConnector() + SwiperBannerComponent();
          } else if ( categoryId == PodcastUtils.dj_perfered) {
            ///猜你喜欢
            return PersonalConnector() + PersonalizeComponent();
          }
        },
        length: state.podcastWrap?.data?.length ?? 0));
