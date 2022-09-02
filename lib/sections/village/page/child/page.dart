import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class VideoWaterfallPage extends Page<VideoWaterfallState, Map<String, dynamic>> {
  VideoWaterfallPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<VideoWaterfallState>(
                adapter: null,
                slots: <String, Dependent<VideoWaterfallState>>{
                }),
            middleware: <Middleware<VideoWaterfallState>>[
            ],);

}
