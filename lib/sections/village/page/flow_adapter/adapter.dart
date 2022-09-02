import 'package:fish_redux/fish_redux.dart';

import 'package:flutter_music/sections/village/page/cell/component.dart';
import 'package:flutter_music/sections/village/page/flow_adapter/cell_connec.dart';
import 'package:flutter_music/sections/village/page/state.dart';

FlowAdapter<VillageState> get adapter => FlowAdapter<VillageState>(
    view: (VillageState state) => DependentArray(
        builder: (int index) {
//          print(">>>>>>>>>str:$str");
          return CellConnector(index: index) + CellComponent();
        },
        length: 0));
