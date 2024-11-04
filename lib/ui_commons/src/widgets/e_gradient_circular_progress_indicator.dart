import 'package:flutter/material.dart';
import 'dart:math';

class EGradientCircularProgressIndicator extends StatefulWidget {
  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;
  final Widget? child;

  const EGradientCircularProgressIndicator({
    super.key,
    required this.radius,
    required this.gradientColors,
    this.strokeWidth = 2.0,
    this.child,
  });

  @override
  State<EGradientCircularProgressIndicator> createState() =>
      _EGradientCircularProgressIndicatorState();
}

class _EGradientCircularProgressIndicatorState
    extends State<EGradientCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.fromRadius(widget.radius),
      painter: _GradientCircularProgressPainter(
        radius: widget.radius,
        gradientColors: widget.gradientColors,
        strokeWidth: widget.strokeWidth,
        ticker: _animationController,
      ),
      child: Center(child: widget.child),
    );
  }
}

class _GradientCircularProgressPainter extends CustomPainter {
  const _GradientCircularProgressPainter({
    required this.radius,
    required this.gradientColors,
    required this.strokeWidth,
    required this.ticker,
  }) : super(repaint: ticker);
  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;
  final Animation<double> ticker;

  @override
  void paint(Canvas canvas, Size size) {
    size = Size.fromRadius(radius);
    double offset = strokeWidth / 2;
    Rect rect = Offset(offset, offset) &
        Size(size.width - strokeWidth, size.height - strokeWidth);
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final startAngle = 2 * pi * ticker.value;

    final endAngle = ticker.value;
    paint.shader = SweepGradient(
      colors: gradientColors,
      startAngle: endAngle,
      endAngle: startAngle,
    ).createShader(rect);
    canvas.drawArc(rect, startAngle, endAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
