import 'package:flutter/material.dart';
import 'dart:math' as math;

class SpeedometerPainter extends StatelessWidget {
  const SpeedometerPainter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 140,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/rainbow_tableau.png'))),
        ),
        Center(
          child: CustomPaint(
            painter: ShapePainter(),
            size: Size(265.0, 140.0),
          ),
        ),
      ],
    );
  }
}

class ShapePainter extends CustomPainter {
  @override
  @override
  void paint(Canvas canvas, Size size) {
    // a fancy rainbow gradient
    final gradient = SweepGradient(
      startAngle: -math.pi,
      endAngle: math.pi / 2,
      tileMode: TileMode.repeated,
      colors: [Colors.red, Colors.orange, Color(0xFFBDFF00), Colors.green],
      stops: const [0.25, 0.5, 0.75, 1.0],
    );

    final rect = Rect.fromLTRB(0, 20, 265, 265);
    final startAngle = -math.pi;
    final sweepAngle = math.pi;
    final useCenter = false;
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
