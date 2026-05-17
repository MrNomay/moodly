import 'package:flutter/material.dart';

class Mood {
  final int index;
  final String label;
  final Color colorAccent;

  const Mood(this.index, this.label, this.colorAccent);

  static const happy = Mood(0, 'Happy', Colors.green);
  static const neutral = Mood(1, 'Neutral', Colors.blue);
  static const sad = Mood(2, 'Sad', Colors.amber);
  static const angry = Mood(3, 'Angry', Colors.red);
  static const values = [happy, neutral, sad, angry];

  Color get faceBackground => colorAccent.withValues(alpha: 0.15);
}

class MoodFacePainter extends CustomPainter {
  final Mood mood;
  final double animationProgress;

  MoodFacePainter({required this.mood, this.animationProgress = 1.0});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.shortestSide / 2) * 0.88;

    canvas.save();

    _drawFaceCircle(canvas, center, radius);
    _drawEyes(canvas, center, radius);
    _drawEyebrows(canvas, center, radius);
    _drawMouth(canvas, center, radius);

    canvas.restore();
  }

  void _drawFaceCircle(Canvas canvas, Offset center, double radius) {
    final bgPaint = Paint()..color = mood.faceBackground;
    final borderPaint = Paint()
      ..color = mood.colorAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.06;

    canvas.drawCircle(center, radius, bgPaint);
    canvas.drawCircle(center, radius, borderPaint);
  }

  void _drawEyes(Canvas canvas, Offset center, double radius) {
    final eyePaint = Paint()..color = Colors.blueGrey.shade800;

    final eyeY = center.dy - radius * 0.18;
    final eyeOffsetX = radius * 0.32;
    final leftEye = Offset(center.dx - eyeOffsetX, eyeY);
    final rightEye = Offset(center.dx + eyeOffsetX, eyeY);

    switch (mood.index) {
      case 0:
        final eyeRadius = radius * 0.09;
        canvas.drawCircle(leftEye, eyeRadius, eyePaint);
        canvas.drawCircle(rightEye, eyeRadius, eyePaint);
        final glintPaint = Paint()..color = Colors.white;
        canvas.drawCircle(
          leftEye + Offset(eyeRadius * 0.35, -eyeRadius * 0.35),
          eyeRadius * 0.3,
          glintPaint,
        );
        canvas.drawCircle(
          rightEye + Offset(eyeRadius * 0.35, -eyeRadius * 0.35),
          eyeRadius * 0.3,
          glintPaint,
        );
        break;

      case 1:
        final ovalRect = radius * 0.09;
        canvas.drawOval(
          Rect.fromCenter(
            center: leftEye,
            width: ovalRect * 1.6,
            height: ovalRect * 1.2,
          ),
          eyePaint,
        );
        canvas.drawOval(
          Rect.fromCenter(
            center: rightEye,
            width: ovalRect * 1.6,
            height: ovalRect * 1.2,
          ),
          eyePaint,
        );
        break;

      case 2:
        final eyeRadius = radius * 0.09;
        canvas.drawCircle(leftEye, eyeRadius, eyePaint);
        canvas.drawCircle(rightEye, eyeRadius, eyePaint);
        break;

      case 3:
        final ovalRect = radius * 0.2;
        canvas.drawOval(
          Rect.fromCenter(
            center: leftEye,
            width: ovalRect * 1.2,
            height: ovalRect * 1.6,
          ),
          eyePaint,
        );
        canvas.drawOval(
          Rect.fromCenter(
            center: rightEye,
            width: ovalRect * 1.2,
            height: ovalRect * 1.6,
          ),
          eyePaint,
        );
        break;
    }
  }

  void _drawEyebrows(Canvas canvas, Offset center, double radius) {
    final browPaint = Paint()
      ..color = Colors.blueGrey.shade800
      ..strokeWidth = radius * 0.055
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final eyeY = center.dy - radius * 0.18;
    final browY = eyeY - radius * 0.18;
    final offsetX = radius * 0.32;
    final browHalfWidth = radius * 0.2;

    switch (mood.index) {
      case 0:
        canvas.drawLine(
          Offset(center.dx - offsetX - browHalfWidth, browY),
          Offset(center.dx - offsetX + browHalfWidth, browY),
          browPaint,
        );
        canvas.drawLine(
          Offset(center.dx + offsetX - browHalfWidth, browY),
          Offset(center.dx + offsetX + browHalfWidth, browY),
          browPaint,
        );
        break;

      case 1:
        canvas.drawLine(
          Offset(center.dx - offsetX - browHalfWidth, browY),
          Offset(center.dx - offsetX + browHalfWidth, browY),
          browPaint,
        );
        canvas.drawLine(
          Offset(center.dx + offsetX - browHalfWidth, browY),
          Offset(center.dx + offsetX + browHalfWidth, browY),
          browPaint,
        );
        break;

      case 2:
        canvas.drawLine(
          Offset(center.dx - offsetX - browHalfWidth, browY),
          Offset(center.dx - offsetX + browHalfWidth, browY - radius * 0.1),
          browPaint,
        );
        canvas.drawLine(
          Offset(center.dx + offsetX - browHalfWidth, browY - radius * 0.1),
          Offset(center.dx + offsetX + browHalfWidth, browY),
          browPaint,
        );
        break;

      case 3:
        canvas.drawLine(
          Offset(center.dx - offsetX - browHalfWidth, browY - radius * 0.06),
          Offset(center.dx - offsetX + browHalfWidth, browY + radius * 0.1),
          browPaint,
        );
        canvas.drawLine(
          Offset(center.dx + offsetX - browHalfWidth, browY + radius * 0.1),
          Offset(center.dx + offsetX + browHalfWidth, browY - radius * 0.06),
          browPaint,
        );
        break;
    }
  }

  void _drawMouth(Canvas canvas, Offset center, double radius) {
    final mouthPaint = Paint()
      ..color = Colors.blueGrey.shade800
      ..strokeWidth = radius * 0.065
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final mouthY = center.dy + radius * 0.28;
    final mouthHalfWidth = radius * 0.35;

    switch (mood.index) {
      case 0:
        _drawSmileArc(
          canvas,
          center,
          mouthY,
          mouthHalfWidth,
          radius,
          curveStrength: 0.22,
          flipDown: true,
        );
        break;

      case 1:
        canvas.drawLine(
          Offset(center.dx - mouthHalfWidth * 0.8, mouthY),
          Offset(center.dx + mouthHalfWidth * 0.8, mouthY),
          mouthPaint,
        );
        break;

      case 2:
        _drawSmileArc(
          canvas,
          center,
          mouthY,
          mouthHalfWidth,
          radius,
          curveStrength: 0.18,
          flipDown: false,
        );
        break;

      case 3:
        _drawSmileArc(
          canvas,
          center,
          mouthY,
          mouthHalfWidth,
          radius,
          curveStrength: 0.18,
          flipDown: false,
        );
        break;
    }
  }

  void _drawSmileArc(
    Canvas canvas,
    Offset center,
    double mouthY,
    double halfWidth,
    double radius, {
    required double curveStrength,
    required bool flipDown,
  }) {
    final paint = Paint()
      ..color = Colors.blueGrey.shade800
      ..strokeWidth = radius * 0.065
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(center.dx - halfWidth, mouthY);
    path.quadraticBezierTo(
      center.dx,
      mouthY + (flipDown ? radius * curveStrength : -radius * curveStrength),
      center.dx + halfWidth,
      mouthY,
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(MoodFacePainter oldDelegate) {
    return oldDelegate.mood != mood ||
        oldDelegate.animationProgress != animationProgress;
  }
}

class MoodFace extends StatelessWidget {
  final Mood mood;
  final double size;
  final double animationProgress;

  const MoodFace({
    super.key,
    required this.mood,
    this.size = 80,
    this.animationProgress = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: MoodFacePainter(
          mood: mood,
          animationProgress: animationProgress,
        ),
      ),
    );
  }
}
