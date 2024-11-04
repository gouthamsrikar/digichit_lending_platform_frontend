import 'package:flutter/material.dart';
import 'package:onemoney_hack/ui_commons/src/tokens/e_colors.dart';

class EDivider extends StatelessWidget {
  const EDivider({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color: color ?? EColors.dividerColor,
    );
  }
}
