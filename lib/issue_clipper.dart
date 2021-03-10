import 'dart:ui';

import 'package:flutter/material.dart';

class IssueClipper extends CustomClipper<Path> {
  IssueClipper(this.test) : super();

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
        break;

      case 1:
        // counterclockwise - hole
        path
          ..addRect(Rect.fromLTRB(sz / 2, sz / 2, size.width, size.height))
          ..moveTo(0, 0)
          ..lineTo(0, sz)
          ..lineTo(sz, sz)
          ..lineTo(sz, 0)
          ..close();
        break;

      case 2:
        path.addRRect(RRect.fromLTRBR(
            sz, 0, size.width, size.height, const Radius.circular(sz)));

        // Magic shadow
        final path2 = Path()
          ..moveTo(sz + sz, 0)
          ..lineTo(sz + sz, sz)
          ..lineTo(0, sz)
          ..lineTo(0, 0)
          ..close();

        path = Path.combine(PathOperation.union, path, path2);
        break;

      case 3:
        path.addRRect(RRect.fromLTRBR(
            sz, 0, size.width, size.height, const Radius.circular(0)));

        // Magic shadow
        final path2 = Path()
          ..moveTo(sz + sz, 0)
          ..lineTo(sz + sz, sz)
          ..lineTo(0, sz)
          ..lineTo(0, 0)
          ..close();

        path = Path.combine(PathOperation.union, path, path2);
        break;
    }

    return path;
  }

  @override
  bool shouldReclip(IssueClipper oldClipper) => false;
}
