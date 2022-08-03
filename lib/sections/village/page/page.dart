import 'package:fish_redux/fish_redux.dart';

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
                adapter: null,
                slots: <String, Dependent<VillageState>>{
                }),
            middleware: <Middleware<VillageState>>[
            ],);

}
