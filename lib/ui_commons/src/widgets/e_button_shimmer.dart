import 'package:flutter/material.dart';

class EButtonShimmer extends StatefulWidget {
  const EButtonShimmer({
    super.key,
    required this.child,
    required this.shimmerDuration,
    required this.lineCount,
    required this.isLoading,
  });

  final Widget child;
  final Duration shimmerDuration;
  final int lineCount;
  final bool isLoading;

  @override
  State<EButtonShimmer> createState() => _EButtonShimmerState();
}

class _EButtonShimmerState extends State<EButtonShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool isDisposed = false;
  bool isRepeat = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: widget.shimmerDuration,
    );
    isDisposed = false;
    if (widget.isLoading) {
      controller.repeat();
      isRepeat = true;
    } else {
      controller.forward();
      Future.delayed(
        widget.shimmerDuration,
        () {
          if (!isDisposed && !isRepeat) controller.stop();
        },
      );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    isDisposed = true;
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant EButtonShimmer oldWidget) {
    controller.duration = widget.shimmerDuration;
    isDisposed = false;
    if (widget.isLoading) {
      controller.repeat();
      isRepeat = true;
    } else {
      controller.forward();
      Future.delayed(
        widget.shimmerDuration,
        () {
          if (!isDisposed) controller.stop();
        },
      );
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: _ShimmerPainter(
          tiltAngle: 100,
          plunkAngle: 100,
          depth: 0,
          shimmerWidth: 20,
          color: Colors.white.withOpacity(0.2),
          plunkColor: Colors.green,
          ticker: controller,
          lines: widget.lineCount,
          isLoading: widget.isLoading,
        ),
        child: widget.child);
  }
}

/// A custom painter to paint the shimmer on the along
/// with the shimmer on the plunk.
class _ShimmerPainter extends CustomPainter {
  const _ShimmerPainter({
    required this.tiltAngle,
    required this.plunkAngle,
    required this.depth,
    required this.shimmerWidth,
    required this.color,
    required this.ticker,
    required this.plunkColor,
    required this.lines,
    required this.isLoading,
  }) : super(repaint: ticker);

  final bool isLoading;

  final int lines;

  /// Angle at which the shimmer is tilted.
  final double tiltAngle;

  /// Angle at which the plunk of the shimmer is tilted.
  final double plunkAngle;

  /// Width of the shimmer.
  final double shimmerWidth;

  /// Depth of the button
  final double depth;

  /// Color of the shimmer
  final Color color;

  /// Color of the shimmer over plunk
  final Color plunkColor;

  /// Ticker to animate the shimmer position and angle
  final Animation<double> ticker;

  @override
  void paint(Canvas canvas, Size size) {
    // final smallShimmer = shimmerWidth / 2;
    const double tilt = 40;

    final width = size.width - shimmerWidth;
    // final perUnitTiltAngleChange = (math.pi - (2 * tiltAngle)) / size.width;

    final y = size.height;
    late double x;
    if (lines == 1) {
      x = (width + width) * ticker.value;
    } else {
      x = width * ticker.value;
    }

    final Path path = Path();
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final double gap = ((size.width - (3 * shimmerWidth)) / 2);

    if (isLoading) {
      for (int i = -lines; i <= lines; i++) {
        canvas.drawPath(
          path
            ..addPolygon(
              [
                Offset(x - tilt + (i * (gap + shimmerWidth)), y),
                Offset(x + (i * (gap + shimmerWidth)), 0),
                Offset(x - shimmerWidth + (i * (gap + shimmerWidth)), 0),
                Offset(x - shimmerWidth - tilt + (i * (gap + shimmerWidth)), y),
              ],
              true,
            ),
          paint,
        );
        path.reset();
      }
    } else {
      canvas.drawPath(
        path
          ..addPolygon(
            [
              Offset(x - tilt, y),
              Offset(x, 0),
              Offset(x - shimmerWidth, 0),
              Offset(x - shimmerWidth - tilt, y),
            ],
            true,
          ),
        paint..color = Colors.white.withOpacity(0.4),
      );
      path.reset();
      canvas.drawPath(
        path
          ..addPolygon(
            [
              Offset(x - tilt + 10, y),
              Offset(x + 10, 0),
              Offset(x - (3) + 10, 0),
              Offset(x - (3) - tilt + 10, y),
            ],
            true,
          ),
        paint..color = Colors.white.withOpacity(0.4),
      );
      path.reset();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
