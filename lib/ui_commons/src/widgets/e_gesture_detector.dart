// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../helpers/event_base_widget.dart';

class EGestureDetector extends EventBaseWidget {
  EGestureDetector({
    super.key,
    super.componentId,
    super.onTap,
    required this.child,
  }):super(componentType: "GESTURE_BUTTON");

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: child,
    );
  }
}
