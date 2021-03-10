part of 'bubble.dart';

/// A painter for the Bubble.
class BubblePainter extends CustomPainter {
  BubblePainter({
    required this.clipper,
    required Color color,
    required this.elevation,
    required this.shadowColor,
  }) : _paint = Paint()
          ..color = color
          ..style = PaintingStyle.fill;

  final CustomClipper<Path> clipper;
  final double elevation;
  final Color shadowColor;

  final Paint _paint;

  @override
  void paint(Canvas canvas, Size size) {
    if (elevation != 0.0) {
      canvas.drawShadow(clipper.getClip(size), shadowColor, elevation, false);
    }

    canvas.drawPath(clipper.getClip(size), _paint);
  }

  @override
  bool shouldRepaint(covariant BubblePainter oldDelegate) => false;
}
