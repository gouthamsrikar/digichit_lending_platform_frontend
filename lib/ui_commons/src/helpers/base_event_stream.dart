// ignore_for_file: constant_identifier_names
import 'dart:async';

abstract class IBaseEventStreamData {}

abstract class IBaseEventStream<T extends IBaseEventStreamData> {
  subscribe(
    String subscriberId,
    void Function(String eventId, T data) onMessage,
  );
  unsubscribe(String subscriberId);
  publish(String eventId, T data);
}

abstract class BaseEventStream<T extends IBaseEventStreamData>
    extends IBaseEventStream<T> {
  final StreamController<T> _eventController = StreamController<T>.broadcast();

  final Map<String, StreamSubscription<T>> _eventSubscriptions = {};

  @override
  void subscribe(
      String subscriberId, void Function(String eventId, T data) onMessage) {
    if (!_eventSubscriptions.containsKey(subscriberId)) {
      final StreamSubscription<T> subscription =
          _eventController.stream.listen((data) {
        onMessage.call(DateTime.now().toIso8601String(), data);
      });
      _eventSubscriptions[subscriberId] = subscription;
    } else {
      _eventSubscriptions[subscriberId]?.onData((data) {
        onMessage.call("random_event_id", data);
      });
    }
  }

  @override
  void unsubscribe(String subscriberId) {
    _eventSubscriptions[subscriberId]?.cancel();
    _eventSubscriptions.remove(subscriberId);
  }

  @override
  publish(String eventId, T data) {
    _eventController.add(data);
  }
}
