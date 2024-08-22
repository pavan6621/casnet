
import 'dart:math';

import 'package:flutter/material.dart';
class LinePainter extends CustomPainter {
  final List<Offset> buttonPositions;

  LinePainter(this.buttonPositions);

  @override
  void paint(Canvas canvas, Size size) {
    if (buttonPositions.length < 2) return;

    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.0;

    for (int i = 0; i < buttonPositions.length; i++) {
        var j = i+3;
        _drawDottedLine(canvas, buttonPositions[i], buttonPositions[j], paint);
    
    }
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
