import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter{

  final _paint = Paint()
  ..color = Colors.white
  ..strokeWidth = 2
  ..style = PaintingStyle.stroke;


  @override
  void paint(Canvas canvas, Size size) {

    double radius = 20.0;
    canvas.translate(size.width/2, size.height/2);
    Offset center = Offset(0.0, 0.0);
    // draw shadow first
    Path oval = Path()
      ..addOval(Rect.fromCircle(center: center, radius: radius+10));
    Paint shadowPaint = Paint()
      ..color = Colors.black
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 50);
    canvas.drawPath(oval, shadowPaint);
    // draw circle
    Paint thumbPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius, thumbPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}

