import 'package:fish_redux/fish_redux.dart';

class MyFocusState implements Cloneable<MyFocusState> {
  @override
  MyFocusState clone() {
    return MyFocusState();
  }
}

MyFocusState initState(Map<String, dynamic>? args) {
  return MyFocusState();
}
