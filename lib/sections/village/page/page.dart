import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/village/page/flow_adapter/adapter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class VillagePage extends Page<VillageState, Map<String, dynamic>> {
  VillagePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<VillageState>(
              adapter: NoneConn<VillageState>() + adapter,
              slots: <String, Dependent<VillageState>>{}),
          middleware: <Middleware<VillageState>>[],
        );
}
