import 'package:flutter/material.dart';

class WaveShape extends OutlinedBorder {
  const WaveShape({super.side});
  Path _getPath(Rect rect) {
    final Path path = Path();
    final Size size = Size(rect.width, rect.height * 1.75);

    final startPoint = size.height * 0.5;
    path.lineTo(0, startPoint);

    final center = Offset(size.width * 0.5, size.height);

    final endPoint = Offset(size.width, size.height * 0.5);

    path.quadraticBezierTo(center.dx, center.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  OutlinedBorder copyWith({BorderSide? side}) {
    return WaveShape(side: side ?? this.side);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return _getPath(rect);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return _getPath(rect);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (rect.isEmpty) return;
    canvas.drawPath(getOuterPath(rect), side.toPaint());
  }

  @override
  ShapeBorder scale(double t) {
    return WaveShape(side: side.scale(t));
  }
}
