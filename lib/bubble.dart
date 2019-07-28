library bubble;

import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';


enum BubbleSource { NO_SOURCE, TOP_LEFT, TOP_RIGHT }


class BubbleClipper extends CustomClipper<Path> {
  BubbleClipper({
    @required this.source,
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
    assert(nipOffset >= 0.0);
    assert(nipRadius <= nipWidth / 2.0 && nipRadius <= nipHeight / 2.0);
    assert(radius <= nipHeight);

    if (source != BubbleSource.NO_SOURCE) {
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
  final BubbleSource source;
  final double nipOffset;
  final bool showNip;
  final EdgeInsets padding;
  final EdgeInsets margin;

  double nipCX;
  double nipCY;
  double nipPX;
  double nipPY;

  get edgeInsets {
    return source == BubbleSource.TOP_LEFT
        ? EdgeInsets.only(
            left: margin.left + nipWidth + padding.left,
            top: margin.top + padding.top,
            right: margin.right + padding.right,
            bottom: margin.bottom + padding.bottom)
        : source == BubbleSource.TOP_RIGHT
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

    if (source == BubbleSource.TOP_LEFT) {
      path.addRRect(RRect.fromLTRBR(
          margin.left + nipWidth,
          margin.top,
          size.width - margin.right,
          size.height - margin.bottom,
          cornerRadius));

      if (showNip) {
        var path2 = Path();
        path2.moveTo(margin.left + nipWidth + radius, margin.top + nipOffset);
        path2.lineTo(margin.left + nipWidth + radius,
            margin.top + nipOffset + nipHeight);
        path2.lineTo(
            margin.left + nipWidth, margin.top + nipOffset + nipHeight);
        path2.lineTo(margin.left + nipPX, margin.top + nipOffset + nipPY);
        path2.arcToPoint(Offset(margin.left + nipCX, margin.top + nipOffset),
            radius: Radius.circular(nipRadius));
        path2.close();

        path = Path.combine(PathOperation.union, path, path2);
      }
    } else if (source == BubbleSource.TOP_RIGHT) {
      path.addRRect(RRect.fromLTRBR(
          margin.left,
          margin.top,
          size.width - margin.right - nipWidth,
          size.height - margin.bottom,
          cornerRadius));

      // Если делать всё в одном Path, то возникают странные глюки: в одном случае происходит объединение,
      // в другом - xor
      if (showNip) {
        var path2 = Path();
        path2.moveTo(size.width - margin.right - nipWidth - radius,
            margin.top + nipOffset);
        path.lineTo(size.width - margin.right - nipWidth - radius,
            margin.top + nipOffset + nipHeight);
        path2.lineTo(size.width - margin.right - nipWidth,
            margin.top + nipOffset + nipHeight);
        path2.lineTo(
            size.width - margin.right - nipPX, margin.top + nipOffset + nipPY);
        path2.arcToPoint(
            Offset(size.width - margin.right - nipCX, margin.top + nipOffset),
            radius: Radius.circular(nipRadius),
            clockwise: false);
        path2.close();

        path = Path.combine(PathOperation.union, path, path2);
      }
    } else if (source == BubbleSource.NO_SOURCE) {
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
    @required source,
    @required this.child,
    radius = 6.0,
    this.nipWidth = 8.0,
    nipHeight = 10.0,
    nipRadius = 1.0,
    nipOffset = 0.0,
    showNip = true,
    this.margin = const EdgeInsets.only(top: 8.0),
    this.color = Colors.white,
    this.elevation = 1.0,
    this.shadowColor = Colors.black,
    this.padding = const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
  }) : bubbleClipper = BubbleClipper(
            radius: radius,
            nipWidth: nipWidth,
            nipHeight: nipHeight,
            nipRadius: nipRadius,
            source: source,
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
