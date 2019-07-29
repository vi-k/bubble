library bubble;

import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';


enum BubbleNip { NO, TOP_LEFT, TOP_RIGHT }


class BubbleClipper extends CustomClipper<Path> {
  BubbleClipper({
    @required this.nip,
    @required this.radius,
    @required this.nipWidth,
    @required this.nipHeight,
    @required this.nipRadius,
    @required this.nipOffset,
    @required this.showNip,
    @required this.padding,
    @required this.margin})
      : super() {
    assert(nipWidth > 0.0);
    assert(nipHeight > 0.0);
    assert(nipRadius >= 0.0);
    assert(nipRadius <= nipWidth / 2.0 && nipRadius <= nipHeight / 2.0);
    assert(nipOffset >= 0.0);
    assert(radius <= nipHeight + nipOffset);
    assert(padding != null);
    assert(margin != null);

    if (nip != BubbleNip.NO && nipRadius > 0) {
      var k = nipHeight / nipWidth;
      var a = atan(k);

      nipCX = (nipRadius + sqrt(nipRadius * nipRadius * (1 + k * k))) / k;
      nipCY = nipRadius;
      nipPX = nipCX - nipRadius * sin(a);
      nipPY = nipCY + nipRadius * cos(a);
    }
  }

  final double radius;
  final double nipHeight;
  final double nipWidth;
  final double nipRadius;
  final BubbleNip nip;
  final double nipOffset;
  final bool showNip;
  final EdgeInsets padding;
  final EdgeInsets margin;

  double nipCX;
  double nipCY;
  double nipPX;
  double nipPY;

  get edgeInsets {
    return nip == BubbleNip.TOP_LEFT
        ? EdgeInsets.only(
            left: margin.left + nipWidth + padding.left,
            top: margin.top + padding.top,
            right: margin.right + padding.right,
            bottom: margin.bottom + padding.bottom)
        : nip == BubbleNip.TOP_RIGHT
            ? EdgeInsets.only(
                left: margin.left + padding.left,
                top: margin.top + padding.top,
                right: margin.right + nipWidth + padding.right,
                bottom: margin.bottom + padding.bottom)
            : EdgeInsets.only(
                left: margin.left + padding.left,
                top: margin.top + padding.top,
                right: margin.right + padding.right,
                bottom: margin.bottom + padding.bottom);
  }

  @override
  Path getClip(Size size) {
    var cornerRadius = Radius.circular(radius);
    var path = Path();

    if (nip == BubbleNip.TOP_LEFT) {
      path.addRRect(RRect.fromLTRBR(
          margin.left + nipWidth,
          margin.top,
          size.width - margin.right,
          size.height - margin.bottom,
          cornerRadius));

      if (showNip) {
        // mumbo-jumbo #1 / Танцы с бубнами #1.
        // Если делать через combine, как в случае с TOP_RIGHT, то при nipRadius = 0 и близких к нему bubble рисуется
        // нормально, зато тень игнорирует весь nip, как будто его нет, а есть только RRect
        path.moveTo(margin.left + nipWidth + radius, margin.top + nipOffset);
        path.lineTo(margin.left + nipWidth + radius,
            margin.top + nipOffset + nipHeight);
        path.lineTo(
            margin.left + nipWidth, margin.top + nipOffset + nipHeight);
        if (nipRadius == 0) {
          path.lineTo(margin.left, margin.top + nipOffset );
        } else {
          path.lineTo(margin.left + nipPX, margin.top + nipOffset + nipPY);
          path.arcToPoint(Offset(margin.left + nipCX, margin.top + nipOffset),
              radius: Radius.circular(nipRadius));
        }
        path.close();

        // Invalid code for nipRadius ~~ 0
//        var path2 = Path();
//        path2.moveTo(margin.left + nipWidth + radius, margin.top + nipOffset);
//        path2.lineTo(margin.left + nipWidth + radius,
//            margin.top + nipOffset + nipHeight);
//        path2.lineTo(
//            margin.left + nipWidth, margin.top + nipOffset + nipHeight);
//        if (nipRadius == 0) {
//          path2.lineTo(margin.left, margin.top + nipOffset );
//        } else {
//          path2.lineTo(margin.left + nipPX, margin.top + nipOffset + nipPY);
//          path2.arcToPoint(Offset(margin.left + nipCX, margin.top + nipOffset),
//              radius: Radius.circular(nipRadius));
//        }
//        path2.close();
//
//        path = Path.combine(PathOperation.union, path, path2);
      }
    } else if (nip == BubbleNip.TOP_RIGHT) {
      path.addRRect(RRect.fromLTRBR(
          margin.left,
          margin.top,
          size.width - margin.right - nipWidth,
          size.height - margin.bottom,
          cornerRadius));

      if (showNip) {
        // Mumbo-jumbo #2 / Танцы с бубнами #2.
        // Если делать всё в одном Path, то возникают странные глюки: если nip справа, то происходит операция xor,
        // а не union. Поэтому использую новый path, а потом объединяю
        var path2 = Path();
        path2.moveTo(size.width - margin.right - nipWidth - radius,
            margin.top + nipOffset);
        path2.lineTo(size.width - margin.right - nipWidth - radius,
            margin.top + nipOffset + nipHeight);
        path2.lineTo(size.width - margin.right - nipWidth,
            margin.top + nipOffset + nipHeight);
        if (nipRadius == 0) {
          path2.lineTo(size.width - margin.right, margin.top + nipOffset);
        } else {
          path2.lineTo(
              size.width - margin.right - nipPX, margin.top + nipOffset + nipPY);
          path2.arcToPoint(
              Offset(size.width - margin.right - nipCX, margin.top + nipOffset),
              radius: Radius.circular(nipRadius),
              clockwise: false);
        }
        path2.close();

        path = Path.combine(PathOperation.union, path, path2);

        // Invalid code. "Xor" instead "combine"
//        path.moveTo(size.width - margin.right - nipWidth - radius,
//            margin.top + nipOffset);
//        path.lineTo(size.width - margin.right - nipWidth - radius,
//            margin.top + nipOffset + nipHeight);
//        path.lineTo(size.width - margin.right - nipWidth,
//            margin.top + nipOffset + nipHeight);
//        if (nipRadius == 0) {
//          path.lineTo(size.width - margin.right, margin.top + nipOffset);
//        } else {
//          path.lineTo(
//              size.width - margin.right - nipPX, margin.top + nipOffset + nipPY);
//          path.arcToPoint(
//              Offset(size.width - margin.right - nipCX, margin.top + nipOffset),
//              radius: Radius.circular(nipRadius),
//              clockwise: false);
//        }
//        path.close();
      }
    } else if (nip == BubbleNip.NO) {
      path.addRRect(RRect.fromLTRBR(
          margin.left,
          margin.top,
          size.width - margin.right,
          size.height - margin.bottom,
          cornerRadius));
    }

    return path;
  }

  @override
  bool shouldReclip(BubbleClipper oldClipper) => false;
}


class Bubble extends StatelessWidget {
  Bubble({
    @required BubbleNip nip,
    @required this.child,
    double radius = 6.0,
    this.nipWidth = 8.0,
    double nipHeight = 10.0,
    double nipRadius = 1.0,
    double nipOffset = 0.0,
    bool showNip = true,
    this.color = Colors.white,
    this.elevation = 1.0,
    this.shadowColor = Colors.black,
    this.padding = const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
    this.margin = const EdgeInsets.only(top: 8.0),
  }) : bubbleClipper = BubbleClipper(
            radius: radius,
            nipWidth: nipWidth,
            nipHeight: nipHeight,
            nipRadius: nipRadius,
            nip: nip,
            nipOffset: nipOffset,
            showNip: showNip,
            padding: padding,
            margin: margin);

  final BubbleClipper bubbleClipper;
  final double nipWidth;
  final Widget child;
  final Color color;
  final double elevation;
  final Color shadowColor;
  final EdgeInsets padding;
  final EdgeInsets margin;

  Widget build(context) {
    return PhysicalShape(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      clipper: bubbleClipper,
      child: Container(padding: bubbleClipper.edgeInsets, child: child),
      color: color,
      elevation: elevation,
      shadowColor: shadowColor,
    );
  }
}
