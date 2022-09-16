import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PlaylistComponent extends Component<PlaylistState> {
  PlaylistComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PlaylistState>(
                adapter: null,
                slots: <String, Dependent<PlaylistState>>{
                }),);

}
