import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/home/models/home.dart';

import 'view.dart';

class ToplistComponent extends Component<MusicItem> {
  ToplistComponent() : super(view: buildView);
}
