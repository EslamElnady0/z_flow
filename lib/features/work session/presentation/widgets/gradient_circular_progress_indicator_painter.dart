import 'package:flutter/material.dart';

class GradientCircularProgressPainter extends CustomPainter {
  final double strokeWidth;
  final double value;
  final LinearGradient gradient;
  final BoxShadow? shadow;

  GradientCircularProgressPainter({
    required this.strokeWidth,
    required this.value,
    required this.gradient,
    this.shadow,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;

    if (shadow != null) {
      Paint shadowPaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..color = shadow!.color.withOpacity(shadow!.color.opacity)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, shadow!.blurRadius);

      double startAngle = -3.14 / 2;
      double sweepAngle = 2 * 3.14 * value;

      canvas.drawArc(rect.deflate(strokeWidth / 2), startAngle, sweepAngle,
          false, shadowPaint);
    }

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round;

    double startAngle = -3.14 / 2;
    double sweepAngle = 2 * 3.14 * value;

    canvas.drawArc(
        rect.deflate(strokeWidth / 2), startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
