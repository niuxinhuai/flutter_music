import 'package:fish_redux/fish_redux.dart';

class UserCenterState implements Cloneable<UserCenterState> {
  @override
  UserCenterState clone() {
    return UserCenterState();
  }
}

UserCenterState initState(Map<String, dynamic>? args) {
  return UserCenterState();
}
