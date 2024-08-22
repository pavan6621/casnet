
import 'dart:math';

import 'package:flutter/material.dart';


  
class LinePainterWidget extends CustomPainter {
 final List<Offset> buttonPositions;

  LinePainterWidget(this.buttonPositions);

  @override
  void paint(Canvas canvas, Size size) {
    if (buttonPositions.length < 3) return;

    final paint = Paint()
      ..color = const Color.fromARGB(255, 251, 250, 250)
      ..strokeWidth = 3.0;

    _drawDottedLine(canvas, buttonPositions[0], buttonPositions[1], paint);
    _drawDottedLine(canvas, buttonPositions[0], buttonPositions[2], paint);
  }

  void _drawDottedLine(Canvas canvas, Offset p1, Offset p2, Paint paint) {
    const double dashWidth = 5.0;
    const double dashSpace = 3.0;
    double startX = p1.dx;
    double startY = p1.dy;

    final double dx = p2.dx - p1.dx;
    final double dy = p2.dy - p1.dy;
    final double distance = sqrt(dx * dx + dy * dy);
    final double angle = atan2(dy, dx);
    double dashes = distance / (dashWidth + dashSpace);

    for (int i = 0; i < dashes; ++i) {
      final double x1 = startX + cos(angle) * (dashWidth + dashSpace) * i;
      final double y1 = startY + sin(angle) * (dashWidth + dashSpace) * i;
      final double x2 = x1 + cos(angle) * dashWidth;
      final double y2 = y1 + sin(angle) * dashWidth;
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
