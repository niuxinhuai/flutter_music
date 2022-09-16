import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AlbumComponent extends Component<AlbumState> {
  AlbumComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<AlbumState>(
                adapter: null,
                slots: <String, Dependent<AlbumState>>{
                }),);

}
