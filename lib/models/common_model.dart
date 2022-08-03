import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

abstract class CommonModel<T> {
  String? message;
  int? code;
  T? data;
}
