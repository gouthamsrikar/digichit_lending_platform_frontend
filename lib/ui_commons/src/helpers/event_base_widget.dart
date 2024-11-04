// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'action_event_stream.dart';
import 'component_id.dart';

abstract class EventBaseWidget extends StatelessWidget {
  EventBaseWidget({
    super.key,
    this.componentId,
    required this.componentType,
    GestureTapCallback? onTap,
  }) {
    this.onTap = onTap != null
        ? () {
            if (componentId != null) {
              ActionEventStream().publish(
                "COMPONENT_EVENT",
                ComponentActionEvent(
                  componentId: componentId!.componentId,
                  componentType: componentType,
                  actionType: "CLICK",
                ),
              );
            }
            onTap.call();
          }
        : null;
  }

  GestureTapCallback? onTap;
  final ComponentId? componentId;
  final String componentType;
}
