import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/podcast/models/personalize.dart';

import 'view.dart';

class PersonalizeComponent extends Component<PersonalizeWrap> {
  PersonalizeComponent()
      : super(
            view: buildView,
            );

}
