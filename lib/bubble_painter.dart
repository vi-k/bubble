part of 'bubble.dart';

/// Paints a [Bubble]: its shadow, its fill and its border, in the outline
/// that [clipper] describes.
class BubblePainter extends CustomPainter {
  /// Creates a painter for the outline of [clipper]; see [Bubble.new] for
  /// what each parameter means.
  BubblePainter({
    required this.clipper,
    required Color color,
    required Color borderColor,
    required double borderWidth,
    required this.borderUp,
    required this.elevation,
    required this.shadowColor,
  })  : _fillPaint = Paint()
          ..color = color
          ..style = PaintingStyle.fill,
        _strokePaint = borderWidth == 0 || borderColor == Colors.transparent
            ? null
            : (Paint()
              ..color = borderColor
              ..strokeWidth = borderWidth
              ..strokeCap = StrokeCap.round
              ..strokeJoin = StrokeJoin.round
              ..style = PaintingStyle.stroke);

  /// The outline to paint.
  final CustomClipper<Path> clipper;

  /// Whether the border is painted above the fill (`true`) or under it.
  final bool borderUp;

  /// The elevation of the shadow; zero draws no shadow.
  final double elevation;

  /// The colour of the shadow.
  final Color shadowColor;

  final Paint _fillPaint;
  final Paint? _strokePaint;

  @override
  void paint(Canvas canvas, Size size) {
    final clip = clipper.getClip(size);

    if (elevation != 0.0) {
      canvas.drawShadow(clip, shadowColor, elevation, false);
    }

    if (borderUp) canvas.drawPath(clip, _fillPaint);

    if (_strokePaint case final strokePaint?) {
      canvas.drawPath(clip, strokePaint);
    }

    if (!borderUp) canvas.drawPath(clip, _fillPaint);
  }

  @override
  bool shouldRepaint(covariant BubblePainter oldDelegate) => false;
}
