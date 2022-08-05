import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/square/models/playlist.dart';

import 'view.dart';

class ItemComponent extends Component<PlaylistSquareWrap> {
  ItemComponent()
      : super(
          view: buildView,
        );
}
