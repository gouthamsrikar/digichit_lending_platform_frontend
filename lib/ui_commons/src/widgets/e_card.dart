import 'package:flutter/material.dart';
import 'package:onemoney_hack/ui_commons/equal_ui.dart';

class ECard extends StatelessWidget {
  const ECard({
    super.key,
    this.child,
    this.padding,
    this.margin,
    this.height,
    this.width,
    this.radius = 5,
    this.color,
    this.shadows,
    this.gradient,
    this.borderColor,
  });

  final Widget? child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double radius;
  final Color? color;
  final List<BoxShadow>? shadows;
  final Gradient? gradient;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color ?? context.cardTheme.color ?? Colors.white,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          width: 1,
          strokeAlign: 1,
          color:
              borderColor ?? context.colorScheme.outline ?? EColors.borderColor,
        ),
      ),
      margin: margin,
      padding: padding,
      child: child,
    );
  }
}
