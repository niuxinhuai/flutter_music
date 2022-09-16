import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ArtistComponent extends Component<ArtistState> {
  ArtistComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ArtistState>(
                adapter: null,
                slots: <String, Dependent<ArtistState>>{
                }),);

}
