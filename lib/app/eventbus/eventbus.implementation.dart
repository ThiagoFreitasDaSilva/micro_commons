import 'dart:async';

class EventbusImplementation {
  EventbusImplementation._internal();

  static final EventbusImplementation _singletonEventbus =
      EventbusImplementation._internal();

  factory EventbusImplementation() => _singletonEventbus;

  static final StreamController _controllerBroadcast =
      StreamController.broadcast();

  static void emit(payload) {
    _controllerBroadcast.sink.add(payload);
  }

  static dynamic get listen => _controllerBroadcast.stream.listen;
}
