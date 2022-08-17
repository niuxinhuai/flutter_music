import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/Leaderboard/models/toplist.dart';
import 'package:flutter_music/sections/Leaderboard/page/flow_adapter/cell_connector.dart';
import 'package:flutter_music/sections/Leaderboard/page/official/component.dart';
import 'package:flutter_music/sections/Leaderboard/page/recommend/component.dart';
import 'package:flutter_music/sections/Leaderboard/page/state.dart';
import 'package:flutter_music/utils/typeUtils.dart';

FlowAdapter<LeaderboardState> get adapter => FlowAdapter<LeaderboardState>(
    view: (LeaderboardState state) => DependentArray(
        builder: (int index) {
          ToplistDetailSection item = state.sections![index];
          String blockCode = item.title ?? "";
          if (blockCode == ToplistDetailUtils.top) {
            ///榜单推荐
            return CellConnector(index: index) + TopRecommendComponent();
          } else if (blockCode == ToplistDetailUtils.chosen) {
            ///精选榜
            return CellConnector(index: index) + TopRecommendComponent();
          } else if (blockCode == ToplistDetailUtils.melody) {
            ///曲风榜
            return CellConnector(index: index) + TopRecommendComponent();
          } else if (blockCode == ToplistDetailUtils.world) {
            ///全球榜
            return CellConnector(index: index) + TopRecommendComponent();
          } else if (blockCode == ToplistDetailUtils.language) {
            ///语种榜
            return CellConnector(index: index) + TopRecommendComponent();
          } else if (blockCode == ToplistDetailUtils.acg) {
            ///ACG榜
            return CellConnector(index: index) + TopRecommendComponent();
          } else if (blockCode == ToplistDetailUtils.feature) {
            ///特色榜
            return CellConnector(index: index) + TopRecommendComponent();
          } else if (blockCode == ToplistDetailUtils.official) {
            ///特色榜
            return CellConnector(index: index) + TopOfficialComponent();
          }
        },
        length: state.sections?.length ?? 0));
