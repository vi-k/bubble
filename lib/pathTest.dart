import 'dart:ui';

import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  MyClipper(this.test) : super();

  final int test;

  @override
  Path getClip(Size size) {
    var sz = 20.0;
    var path = Path();

    switch (test) {
      case 0:
        path.addRect(Rect.fromLTRB(sz / 2, sz / 2, size.width, size.height));
        // clockwise - normal
        path.moveTo(0, 0);
        path.lineTo(sz, 0);
        path.lineTo(sz, sz);
        path.lineTo(0, sz);
        path.close();
        break;

      case 1:
        path.addRect(Rect.fromLTRB(sz / 2, sz / 2, size.width, size.height));
        // counterclockwise - hole
        path.moveTo(0, 0);
        path.lineTo(0, sz);
        path.lineTo(sz, sz);
        path.lineTo(sz, 0);
        path.close();
        break;

      case 2:
        path.addRRect(RRect.fromLTRBR(sz, 0, size.width, size.height, Radius.circular(sz)));
        // Magic shadow
        var path2 = Path();
        path2.moveTo(sz + sz, 0);
        path2.lineTo(sz + sz, sz);
        path2.lineTo(0, sz);
        path2.lineTo(0, 0);
        path2.close();

        path = Path.combine(PathOperation.union, path, path2);
        break;

      case 3:
        path.addRRect(RRect.fromLTRBR(sz, 0, size.width, size.height, Radius.circular(0)));
        // Magic shadow
        var path2 = Path();
        path2.moveTo(sz + sz, 0);
        path2.lineTo(sz + sz, sz);
        path2.lineTo(0, sz);
        path2.lineTo(0, 0);
        path2.close();

        path = Path.combine(PathOperation.union, path, path2);
        break;
    }

    return path;
  }

  @override
  bool shouldReclip(MyClipper oldClipper) => false;
}
