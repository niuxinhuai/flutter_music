import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

abstract class CommonModel<T> {
  String? message;
  int? code;
  T? data;
}

class EventBusFireModule {
  EventBusFireModule();

  //歌单广场数据，返回刷新状态
  bool? squareRefresh;
}
