import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/square/page/recommend/flow_adpater/row_connector.dart';
import 'package:flutter_music/sections/square/page/recommend/row_component/component.dart';
import 'package:flutter_music/sections/square/page/recommend/state.dart';

FlowAdapter<SquareRecommendState> get adapter =>
    FlowAdapter<SquareRecommendState>(
        view: (SquareRecommendState state) => DependentArray(
            builder: (int index) {
              if (index == 1 || index == 2) {
                return CellConnector(index: index) + RecommendRowComponent();
              }
//          return CellConnector(index: index) + HomeCellComponent();
            },
            length: 5));
