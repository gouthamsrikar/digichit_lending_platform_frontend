import 'package:onemoney_hack/ui_commons/equal_ui.dart';

class ApiActionEvent extends ActionEvent {
  ApiActionEvent({
    required this.urlPath,
    required this.statusCode,
    required this.message,
    required this.status,
  }) : super(timestamp: DateTime.now().millisecondsSinceEpoch.toString());
  final String urlPath;
  final String? statusCode;
  final String? message;
  final String? status;
}

class ComponentActionEvent extends ActionEvent {
  ComponentActionEvent({
    required this.componentId,
    required this.actionType,
    required this.componentType,
  }) : super(timestamp: DateTime.now().millisecondsSinceEpoch.toString());
  final String componentId;
  final String actionType;
  final String componentType;
}

class ViewActionEvent extends ActionEvent {
  ViewActionEvent({
    required this.view,
  }) : super(timestamp: DateTime.now().millisecondsSinceEpoch.toString());
  final String view;
}

abstract class ActionEvent extends IBaseEventStreamData {
  final String timestamp;

  ActionEvent({required this.timestamp});
}

class ActionEventStream extends BaseEventStream<ActionEvent> {
  ActionEventStream._privateConstructor();

  // Singleton instance
  static final ActionEventStream _instance =
      ActionEventStream._privateConstructor();

  // Factory method to return the singleton instance
  factory ActionEventStream() => _instance;
}
