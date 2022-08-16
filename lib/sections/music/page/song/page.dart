import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AudioPlayerPage extends Page<AudioPlayerState, Map<String, dynamic>> {
  AudioPlayerPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<AudioPlayerState>(
                adapter: null,
                slots: <String, Dependent<AudioPlayerState>>{
                }),
            middleware: <Middleware<AudioPlayerState>>[
            ],);

}
