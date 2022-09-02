import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class VideoDetailPage extends Page<VideoDetailState, Map<String, dynamic>> {
  VideoDetailPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<VideoDetailState>(
                adapter: null,
                slots: <String, Dependent<VideoDetailState>>{
                }),
            middleware: <Middleware<VideoDetailState>>[
            ],);

}
