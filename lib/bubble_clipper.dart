part of 'bubble.dart';

class BubbleClipper extends CustomClipper<Path> {
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
  })   : assert(nipWidth > 0),
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

  final Radius radius;
  final bool showNip;
  final BubbleNip nip;
  final double nipHeight;
  final double nipWidth;
  final double nipOffset;
  final double nipRadius;
  final bool stick;
  final EdgeInsets padding;

  double _startOffset = 0; // Offsets of the bubble
  double _endOffset = 0;
  double _nipCX = 0; // The center of the circle
  double _nipCY = 0;
  double _nipPX = 0; // The point of contact of the nip with the circle
  double _nipPY = 0;

  EdgeInsets get edgeInsets {
    switch (nip) {
      case BubbleNip.leftTop:
      case BubbleNip.leftBottom:
      case BubbleNip.leftCenter:
        return EdgeInsets.only(
            left: _startOffset + padding.left,
            top: padding.top,
            right: _endOffset + padding.right,
            bottom: padding.bottom);

      case BubbleNip.rightTop:
      case BubbleNip.rightBottom:
      case BubbleNip.rightCenter:
        return EdgeInsets.only(
            left: _endOffset + padding.left,
            top: padding.top,
            right: _startOffset + padding.right,
            bottom: padding.bottom);
      case BubbleNip.topRight:
      case BubbleNip.topLeft:
      case BubbleNip.topCenter:
        return EdgeInsets.only(
            left: padding.left,
            top: _startOffset + padding.top,
            right: padding.right,
            bottom: _endOffset + padding.bottom);
      case BubbleNip.bottomRight:
      case BubbleNip.bottomLeft:
      case BubbleNip.bottomCenter:
        return EdgeInsets.only(
            left: padding.left,
            top: _endOffset + padding.top,
            right: padding.right,
            bottom: _startOffset + padding.bottom);
      case BubbleNip.no:
        return EdgeInsets.only(
            left: _endOffset + padding.left,
            top: padding.top,
            right: _endOffset + padding.right,
            bottom: padding.bottom);
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
        path.addRRect(RRect.fromLTRBR(
            _startOffset, 0, size.width - _endOffset, size.height, radius));
        break;

      case BubbleNip.rightTop:
      case BubbleNip.rightBottom:
      case BubbleNip.rightCenter:
        path.addRRect(RRect.fromLTRBR(
            _endOffset, 0, size.width - _startOffset, size.height, radius));
        break;
      case BubbleNip.topRight:
      case BubbleNip.topLeft:
      case BubbleNip.topCenter:
        path.addRRect(RRect.fromLTRBR(
            0, _startOffset, size.width, size.height - _endOffset, radius));
        break;
      case BubbleNip.bottomRight:
      case BubbleNip.bottomLeft:
      case BubbleNip.bottomCenter:
        path.addRRect(RRect.fromLTRBR(
            0, _endOffset, size.width, size.height - _startOffset, radius));
        break;
      case BubbleNip.no:
        path.addRRect(RRect.fromLTRBR(
            _endOffset, 0, size.width - _endOffset, size.height, radius));
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
          break;

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
          break;

        case BubbleNip.leftBottom:
          final path2 = Path()
            ..moveTo(_startOffset + radiusX, size.height - nipOffset)
            ..lineTo(
                _startOffset + radiusX, size.height - nipOffset - nipHeight)
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
          break;

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
          break;

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
          break;

        case BubbleNip.rightBottom:
          final path2 = Path()
            ..moveTo(
                size.width - _startOffset - radiusX, size.height - nipOffset)
            ..lineTo(size.width - _startOffset - radiusX,
                size.height - nipOffset - nipHeight)
            ..lineTo(
                size.width - _startOffset, size.height - nipOffset - nipHeight);

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
          break;
        case BubbleNip.topRight:
          final path2 = Path();
          path2.moveTo(size.width - nipOffset, _startOffset + radiusX);
          path2.lineTo(
              size.width - nipOffset - nipHeight, _startOffset + radiusX);
          path2.lineTo(size.width - nipOffset - nipHeight, _startOffset);
          if (nipRadius == 0) {
            path2.lineTo(size.width - nipOffset, 0);
          } else {
            path2
              ..lineTo(size.width - nipOffset - _nipPY, _nipPX)
              ..arcToPoint(Offset(size.width - nipOffset, _nipCX),
                  radius: Radius.circular(nipRadius));
          }
          path2.close();
          path = Path.combine(PathOperation.union, path, path2);
          break;
        case BubbleNip.topLeft:
          final path2 = Path();
          path2.moveTo(nipOffset, _startOffset + radiusX);
          path2.lineTo(nipOffset + nipHeight, _startOffset + radiusX);
          path2.lineTo(nipOffset + nipHeight, _startOffset);
          if (nipRadius == 0) {
            path2.lineTo(nipOffset, 0);
          } else {
            path2
              ..lineTo(nipOffset + _nipPY, _nipPX)
              ..arcToPoint(
                Offset(nipOffset, _nipCX),
                radius: Radius.circular(nipRadius),
                clockwise: false,
              );
          }
          path2.close();
          path = Path.combine(PathOperation.union, path, path2);
          break;
        case BubbleNip.topCenter:
          final cx = nipOffset + size.width / 2;
          final nipHalf = nipWidth / 2;

          final path2 = Path()
            ..moveTo(cx - nipHalf, _startOffset)
            ..lineTo(cx - nipHalf, _startOffset + radiusY)
            ..lineTo(cx + nipHalf, _startOffset + radiusY)
            ..lineTo(cx + nipHalf, _startOffset);

          if (nipRadius == 0) {
            path2.lineTo(cx, 0);
          } else {
            path2
              ..lineTo(cx + _nipPX, _nipPY)
              ..arcToPoint(
                Offset(cx - _nipPX, _nipPY),
                radius: Radius.circular(nipRadius),
              );
          }

          path2.close();
          path = Path.combine(PathOperation.union, path, path2);
          break;
        case BubbleNip.bottomRight:
          final path2 = Path();
          path2.moveTo(
              size.width - nipOffset, size.height - _startOffset - radiusX);
          path2.lineTo(size.width - nipOffset - nipHeight,
              size.height - _startOffset - radiusX);
          path2.lineTo(
              size.width - nipOffset - nipHeight, size.height - _startOffset);
          if (nipRadius == 0) {
            path2.lineTo(size.width - nipOffset, size.height);
          } else {
            path2
              ..lineTo(size.width - nipOffset - _nipPY, size.height - _nipPX)
              ..arcToPoint(Offset(size.width - nipOffset, size.height - _nipCX),
                  radius: Radius.circular(nipRadius));
          }
          path2.close();
          path = Path.combine(PathOperation.union, path, path2);
          break;
        case BubbleNip.bottomLeft:
          final path2 = Path();
          path2.moveTo(nipOffset, size.height - _startOffset - radiusX);
          path2.lineTo(
              nipOffset + nipHeight, size.height - _startOffset - radiusX);
          path2.lineTo(nipOffset + nipHeight, size.height - _startOffset);
          if (nipRadius == 0) {
            path2.lineTo(nipOffset, size.height);
          } else {
            path2
              ..lineTo(nipOffset + _nipPY, size.height - _nipPX)
              ..arcToPoint(
                Offset(nipOffset, size.height - _nipCX),
                radius: Radius.circular(nipRadius),
                clockwise: false,
              );
          }
          path2.close();
          path = Path.combine(PathOperation.union, path, path2);
          break;
        case BubbleNip.bottomCenter:
          final cx = nipOffset + size.width / 2;
          final nipHalf = nipWidth / 2;

          final path2 = Path()
            ..moveTo(cx - nipHalf, size.height - _startOffset)
            ..lineTo(cx - nipHalf, size.height - _startOffset - radiusY)
            ..lineTo(cx + nipHalf, size.height - _startOffset - radiusY)
            ..lineTo(cx + nipHalf, size.height - _startOffset);

          if (nipRadius == 0) {
            path2.lineTo(cx, size.height);
          } else {
            path2
              ..lineTo(cx + _nipPX, size.height - _nipPY)
              ..arcToPoint(
                Offset(cx - _nipPX, size.height - _nipPY),
                radius: Radius.circular(nipRadius),
              );
          }

          path2.close();
          path = Path.combine(PathOperation.union, path, path2);
          break;
        case BubbleNip.no:
          break;
      }
    }

    return path;
  }

  @override
  bool shouldReclip(BubbleClipper oldClipper) => false;
}
