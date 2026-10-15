import 'package:flutter/material.dart';

/// Four outlines that show how [PhysicalShape] casts the shadow of a path
/// made of several contours.
///
/// Not part of the bubble: the example draws them next to the bubbles to
/// demonstrate https://github.com/flutter/flutter/issues/37779, which shaped
/// how `BubbleClipper` joins the nip to the rectangle.
class IssueClipper extends CustomClipper<Path> {
  /// Creates the outline number [test], from 0 to 3.
  IssueClipper(this.test) : super();

  /// Which outline to draw: 0 — two contours drawn clockwise, 1 — the second
  /// one counterclockwise, which makes it a hole; 2 and 3 — a rounded and a
  /// square rectangle joined with a square by [Path.combine].
  final int test;

  @override
  Path getClip(Size size) {
    const sz = 20.0;
    var path = Path();

    switch (test) {
      case 0:
        // clockwise - normal
        path
          ..addRect(Rect.fromLTRB(sz / 2, sz / 2, size.width, size.height))
          ..moveTo(0, 0)
          ..lineTo(sz, 0)
          ..lineTo(sz, sz)
          ..lineTo(0, sz)
          ..close();

      case 1:
        // counterclockwise - hole
        path
          ..addRect(Rect.fromLTRB(sz / 2, sz / 2, size.width, size.height))
          ..moveTo(0, 0)
          ..lineTo(0, sz)
          ..lineTo(sz, sz)
          ..lineTo(sz, 0)
          ..close();

      case 2:
        path.addRRect(
          RRect.fromLTRBR(
            sz,
            0,
            size.width,
            size.height,
            const Radius.circular(sz),
          ),
        );

        // Magic shadow
        final path2 = Path()
          ..moveTo(sz + sz, 0)
          ..lineTo(sz + sz, sz)
          ..lineTo(0, sz)
          ..lineTo(0, 0)
          ..close();

        path = Path.combine(PathOperation.union, path, path2);

      case 3:
        path.addRRect(
          RRect.fromLTRBR(sz, 0, size.width, size.height, Radius.zero),
        );

        // Magic shadow
        final path2 = Path()
          ..moveTo(sz + sz, 0)
          ..lineTo(sz + sz, sz)
          ..lineTo(0, sz)
          ..lineTo(0, 0)
          ..close();

        path = Path.combine(PathOperation.union, path, path2);
    }

    return path;
  }

  @override
  bool shouldReclip(IssueClipper oldClipper) => false;
}
