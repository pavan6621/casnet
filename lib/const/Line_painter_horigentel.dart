
import 'package:flutter/material.dart';



class LinePainterHorigentelWidget extends StatelessWidget {
  final GlobalKey fromKey;
  final GlobalKey toKey;

  LinePainterHorigentelWidget(this.fromKey, this.toKey);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LinePainter(fromKey, toKey),
    );
  }
}

class LinePainter extends CustomPainter {
  final GlobalKey fromKey;
  final GlobalKey fromKey1;

  LinePainter(this.fromKey, this.fromKey1);

  @override
  void paint(Canvas canvas, Size size) {
    final fromRenderBox = fromKey.currentContext?.findRenderObject() as RenderBox?;
    final fromKey1Box = fromKey1.currentContext?.findRenderObject() as RenderBox?;

    if (fromRenderBox != null && fromKey1Box != null) {
      final fromPosition = fromRenderBox.localToGlobal(Offset.zero);
      final fromKey1Position = fromKey1Box.localToGlobal(Offset.zero);

      final paint = Paint()
        ..color = Colors.black
        ..strokeWidth = 2.0;

      canvas.drawLine(
        fromPosition + Offset(fromRenderBox.size.width+6 / 2, fromRenderBox.size.height/2),
        fromKey1Position + Offset(0 , fromKey1Box.size.height/2),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}