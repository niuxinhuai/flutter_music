import 'package:fish_redux/fish_redux.dart';

class VillageState implements Cloneable<VillageState> {
  @override
  VillageState clone() {
    return VillageState();
  }
}

VillageState initState(Map<String, dynamic>? args) {
  return VillageState();
}
