import 'package:fish_redux/fish_redux.dart';

import 'view.dart';

class CellComponent extends Component<String> {
  CellComponent()
      : super(
          view: buildView,
        );
}
