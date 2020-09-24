import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/new_design/odometer_panel_widget.dart';

class SpeedometerPainter extends StatefulWidget {
  final double progress;
  const SpeedometerPainter({@required this.progress, Key key})
      : assert(progress != null),
        super(key: key);

  @override
  _SpeedometerPainterState createState() => _SpeedometerPainterState();
}

class _SpeedometerPainterState extends State<SpeedometerPainter>
    with SingleTickerProviderStateMixin {
  AnimationController progressController;
  Animation animation;

  @override
  void initState() {
    super.initState();
    progressController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation =
        Tween(begin: 0.0, end: widget.progress).animate(progressController);

    animation.addListener(() {
      setState(() {});
    });

    progressController.forward();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.8;
    var height = MediaQuery.of(context).size.height * 0.22;
    return Stack(
      children: <Widget>[
        Center(
          child: CustomPaint(
            painter: IndicatorBackgroundPainter(),
            size: Size(width, height),
          ),
        ),
        Center(
          child: CustomPaint(
            painter: ShapePainter(progress: animation.value),
            size: Size(width, height),
          ),
        ),
        Positioned.fill(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: OdometerPanelWidget()))
      ],
    );
  }
}

class ShapePainter extends CustomPainter {
  final double progress; // 0.....1.0

  ShapePainter({@required this.progress});

  var _gradient = const <Color>[
    Colors.red,
    Colors.orange,
    Color(0xFFBDFF00),
    Colors.green
  ];

  @override
  void paint(Canvas canvas, Size size) {
    // a fancy rainbow gradient
    final gradient = SweepGradient(
      startAngle: -math.pi,
      endAngle: math.pi / 2,
      tileMode: TileMode.repeated,
      colors: _gradient,
      stops: const [0.25, 0.5, 0.75, 1.0],
    );

    final rect = Rect.fromCenter(
        center: Offset(size.width / 2, size.height),
        height: size.width,
        width: size.width);
    final startAngle = -math.pi;
    final sweepAngle = math.pi * progress;
    final useCenter = false;
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class IndicatorBackgroundPainter extends CustomPainter {
  @override
  @override
  void paint(Canvas canvas, Size size) {
    // a fancy rainbow gradient
    final rect = Rect.fromCenter(
        center: Offset(size.width / 2, size.height),
        height: size.width,
        width: size.width);
    final startAngle = -math.pi;
    final sweepAngle = math.pi;
    final useCenter = false;
    final paint = Paint()
      ..color = Color(0xFF24323F)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);

    final scaleRect = Rect.fromCenter(
        center: Offset(size.width / 2, size.height - 5),
        height: size.width * 0.9 - 10,
        width: size.width * 0.9);
    double startAngleScale = -math.pi;
    final sweepAngleScale = 0.01;
    final scale = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    for (int i = 0; i < 60; i++) {
      canvas.drawArc(
          scaleRect, startAngleScale, sweepAngleScale, useCenter, scale);
      startAngleScale = startAngleScale + (2 * math.pi / 120);
    }

    final scaleRect2 = Rect.fromCenter(
        center: Offset(size.width / 2, size.height - 5),
        height: size.width * 0.9 - 15,
        width: size.width * 0.9 - 5);
    double startAngleScale2 = -math.pi;
    final sweepAngleScale2 = 0.02;
    final scale2 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    for (int i = 0; i < 4; i++) {
      canvas.drawArc(
          scaleRect2, startAngleScale2, sweepAngleScale2, useCenter, scale2);
      startAngleScale2 = startAngleScale2 + 2 * math.pi / 6;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
