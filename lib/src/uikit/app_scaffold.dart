import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget? body;

  const AppScaffold({super.key, this.body});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
        Positioned.fill(
          child: CustomPaint(
            painter: _AppBg(
              Theme.of(context).scaffoldBackgroundColor,
              Theme.of(context).colorScheme.surface,
            ),
          ),
        ),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: body,
        )
      ],
    );
  }
}

class _AppBg extends CustomPainter {
  final Color waveColor;
  final Color bgColor;

  _AppBg(this.bgColor, this.waveColor);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    final pathB = Path();
    pathB.moveTo(0, size.height * 0.3);
    pathB.lineTo(0, 0);
    pathB.lineTo(size.width, 0);
    pathB.lineTo(size.width, size.height * 0.3);
    pathB.close();
    paint.color = waveColor;
    canvas.drawPath(pathB, paint);

    final path = Path();

    path.moveTo(0, size.height * 0.3);
    path.lineTo(
      size.width * 0.68,
      size.height * 0.225,
    );

    path.quadraticBezierTo(
      size.width * 0.76,
      size.height * 0.216,
      size.width * 0.87,
      size.height * 0.235,
    );
    path.quadraticBezierTo(
      size.width * 0.90,
      size.height * 0.24,
      size.width * 0.94,
      size.height * 0.26,
    );

    path.lineTo(size.width, size.height * 0.3);

    path.close();
    paint.color = bgColor;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
