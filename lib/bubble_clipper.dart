part of 'bubble.dart';

/// The outline of a [Bubble]: a rounded rectangle and, when there is one, the
/// nip joined to it.
///
/// [Bubble] builds one from its resolved parameters and hands it to
/// [BubblePainter]; the same outline can clip another widget through
/// [ClipPath]. Besides the outline it reports [edgeInsets] — the room the
/// child needs so that it lands inside the rectangle and clear of the nip.
class BubbleClipper extends CustomClipper<Path> {
  /// Creates the outline from parameters that are already resolved; see
  /// [Bubble.new] for what each one means.
  BubbleClipper({
    required this.radius,
    required this.showNip,
    required this.nip,
    required this.nipWidth,
    required this.nipHeight,
    required this.nipOffset,
    required this.nipRadius,
    required this.stick,
    required this.padding,
  })  : assert(nipWidth > 0),
        assert(nipHeight > 0),
        assert(nipRadius >= 0),
        assert(nipRadius <= nipWidth / 2 && nipRadius <= nipHeight / 2),
        super() {
    if (nip == BubbleNip.no) return;

    _startOffset = _endOffset = nipWidth;

    final isCenter =
        nip == BubbleNip.leftCenter || nip == BubbleNip.rightCenter;
    final k = isCenter ? nipHeight / 2 / nipWidth : nipHeight / nipWidth;
    final a = atan(k);

    _nipCX = isCenter
        ? sqrt(nipRadius * nipRadius * (1 + 1 / k / k))
        : (nipRadius + sqrt(nipRadius * nipRadius * (1 + k * k))) / k;
    final nipStickOffset = (_nipCX - nipRadius).floorToDouble();

    _nipCX -= nipStickOffset;
    _nipCY = isCenter ? 0 : nipRadius;
    _nipPX = _nipCX - nipRadius * sin(a);
    _nipPY = _nipCY + nipRadius * cos(a);
    _startOffset -= nipStickOffset;
    _endOffset -= nipStickOffset;

    if (stick) _endOffset = 0;
  }

  /// The radius of the corners of the rectangle.
  final Radius radius;

  /// Whether the nip is drawn. Its room is reserved either way.
  final bool showNip;

  /// Where the nip sits.
  final BubbleNip nip;

  /// The height of the nip.
  final double nipHeight;

  /// The width of the nip.
  final double nipWidth;

  /// How far the nip is moved from the corner it starts at, or down from the
  /// centre for [BubbleNip.leftCenter] and [BubbleNip.rightCenter].
  final double nipOffset;

  /// The radius of the rounded tip of the nip; zero makes the tip sharp.
  final double nipRadius;

  /// Whether the side opposite the nip reaches the edge instead of being
  /// inset by the width of the nip.
  final bool stick;

  /// The padding between the rectangle and the child.
  final EdgeInsets padding;

  double _startOffset = 0; // Offsets of the bubble
  double _endOffset = 0;
  double _nipCX = 0; // The center of the circle
  double _nipCY = 0;
  double _nipPX = 0; // The point of contact of the nip with the circle
  double _nipPY = 0;

  /// The room around the child: [padding] plus the space the nip takes on
  /// its side and, unless [stick] is set, the same space on the other side.
  EdgeInsets get edgeInsets {
    switch (nip) {
      case BubbleNip.leftTop:
      case BubbleNip.leftBottom:
      case BubbleNip.leftCenter:
        return EdgeInsets.only(
          left: _startOffset + padding.left,
          top: padding.top,
          right: _endOffset + padding.right,
          bottom: padding.bottom,
        );

      case BubbleNip.rightTop:
      case BubbleNip.rightBottom:
      case BubbleNip.rightCenter:
        return EdgeInsets.only(
          left: _endOffset + padding.left,
          top: padding.top,
          right: _startOffset + padding.right,
          bottom: padding.bottom,
        );

      case BubbleNip.no:
        return EdgeInsets.only(
          left: _endOffset + padding.left,
          top: padding.top,
          right: _endOffset + padding.right,
          bottom: padding.bottom,
        );
    }
  }

  @override
  Path getClip(Size size) {
    var radiusX = radius.x;
    var radiusY = radius.y;
    final maxRadiusX = size.width / 2;
    final maxRadiusY = size.height / 2;

    if (radiusX > maxRadiusX) {
      radiusY *= maxRadiusX / radiusX;
      radiusX = maxRadiusX;
    }
    if (radiusY > maxRadiusY) {
      radiusX *= maxRadiusY / radiusY;
      radiusY = maxRadiusY;
    }

    var path = Path();

    switch (nip) {
      case BubbleNip.leftTop:
      case BubbleNip.leftBottom:
      case BubbleNip.leftCenter:
        path.addRRect(
          RRect.fromLTRBR(
            _startOffset,
            0,
            size.width - _endOffset,
            size.height,
            radius,
          ),
        );

      case BubbleNip.rightTop:
      case BubbleNip.rightBottom:
      case BubbleNip.rightCenter:
        path.addRRect(
          RRect.fromLTRBR(
            _endOffset,
            0,
            size.width - _startOffset,
            size.height,
            radius,
          ),
        );

      case BubbleNip.no:
        path.addRRect(
          RRect.fromLTRBR(
            _endOffset,
            0,
            size.width - _endOffset,
            size.height,
            radius,
          ),
        );
    }

    if (showNip) {
      switch (nip) {
        case BubbleNip.leftTop:
          final path2 = Path()
            ..moveTo(_startOffset + radiusX, nipOffset)
            ..lineTo(_startOffset + radiusX, nipOffset + nipHeight)
            ..lineTo(_startOffset, nipOffset + nipHeight);

          if (nipRadius == 0) {
            path2.lineTo(0, nipOffset);
          } else {
            path2
              ..lineTo(_nipPX, nipOffset + _nipPY)
              ..arcToPoint(
                Offset(_nipCX, nipOffset),
                radius: Radius.circular(nipRadius),
              );
          }

          path2.close();
          path = Path.combine(PathOperation.union, path, path2);

        case BubbleNip.leftCenter:
          final cy = nipOffset + size.height / 2;
          final nipHalf = nipHeight / 2;

          final path2 = Path()
            ..moveTo(_startOffset, cy - nipHalf)
            ..lineTo(_startOffset + radiusX, cy - nipHalf)
            ..lineTo(_startOffset + radiusX, cy + nipHalf)
            ..lineTo(_startOffset, cy + nipHalf);

          if (nipRadius == 0) {
            path2.lineTo(0, cy);
          } else {
            path2
              ..lineTo(_nipPX, cy + _nipPY)
              ..arcToPoint(
                Offset(_nipPX, cy - _nipPY),
                radius: Radius.circular(nipRadius),
              );
          }

          path2.close();
          path = Path.combine(PathOperation.union, path, path2);

        case BubbleNip.leftBottom:
          final path2 = Path()
            ..moveTo(_startOffset + radiusX, size.height - nipOffset)
            ..lineTo(
              _startOffset + radiusX,
              size.height - nipOffset - nipHeight,
            )
            ..lineTo(_startOffset, size.height - nipOffset - nipHeight);

          if (nipRadius == 0) {
            path2.lineTo(0, size.height - nipOffset);
          } else {
            path2
              ..lineTo(_nipPX, size.height - nipOffset - _nipPY)
              ..arcToPoint(
                Offset(_nipCX, size.height - nipOffset),
                radius: Radius.circular(nipRadius),
                clockwise: false,
              );
          }

          path2.close();
          path = Path.combine(PathOperation.union, path, path2);

        case BubbleNip.rightTop:
          final path2 = Path()
            ..moveTo(size.width - _startOffset - radiusX, nipOffset)
            ..lineTo(size.width - _startOffset - radiusX, nipOffset + nipHeight)
            ..lineTo(size.width - _startOffset, nipOffset + nipHeight);

          if (nipRadius == 0) {
            path2.lineTo(size.width, nipOffset);
          } else {
            path2
              ..lineTo(size.width - _nipPX, nipOffset + _nipPY)
              ..arcToPoint(
                Offset(size.width - _nipCX, nipOffset),
                radius: Radius.circular(nipRadius),
                clockwise: false,
              );
          }

          path2.close();
          path = Path.combine(PathOperation.union, path, path2);

        case BubbleNip.rightCenter:
          final cy = nipOffset + size.height / 2;
          final nipHalf = nipHeight / 2;

          final path2 = Path()
            ..moveTo(size.width - _startOffset, cy - nipHalf)
            ..lineTo(size.width - _startOffset - radiusX, cy - nipHalf)
            ..lineTo(size.width - _startOffset - radiusX, cy + nipHalf)
            ..lineTo(size.width - _startOffset, cy + nipHalf);

          if (nipRadius == 0) {
            path2.lineTo(size.width, cy);
          } else {
            path2
              ..lineTo(size.width - _nipPX, cy + _nipPY)
              ..arcToPoint(
                Offset(size.width - _nipPX, cy - _nipPY),
                radius: Radius.circular(nipRadius),
                clockwise: false,
              );
          }

          path2.close();
          path = Path.combine(PathOperation.union, path, path2);

        case BubbleNip.rightBottom:
          final path2 = Path()
            ..moveTo(
              size.width - _startOffset - radiusX,
              size.height - nipOffset,
            )
            ..lineTo(
              size.width - _startOffset - radiusX,
              size.height - nipOffset - nipHeight,
            )
            ..lineTo(
              size.width - _startOffset,
              size.height - nipOffset - nipHeight,
            );

          if (nipRadius == 0) {
            path2.lineTo(size.width, size.height - nipOffset);
          } else {
            path2
              ..lineTo(size.width - _nipPX, size.height - nipOffset - _nipPY)
              ..arcToPoint(
                Offset(size.width - _nipCX, size.height - nipOffset),
                radius: Radius.circular(nipRadius),
              );
          }

          path2.close();
          path = Path.combine(PathOperation.union, path, path2);

        case BubbleNip.no:
          break;
      }
    }

    return path;
  }

  /// Whether the outline differs from [oldClipper]'s. [padding] is left out:
  /// it moves the child, not the outline.
  @override
  bool shouldReclip(BubbleClipper oldClipper) =>
      radius != oldClipper.radius ||
      showNip != oldClipper.showNip ||
      nip != oldClipper.nip ||
      nipWidth != oldClipper.nipWidth ||
      nipHeight != oldClipper.nipHeight ||
      nipOffset != oldClipper.nipOffset ||
      nipRadius != oldClipper.nipRadius ||
      stick != oldClipper.stick;
}
