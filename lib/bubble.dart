library bubble;

import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';


enum BubbleNip { TOP_LEFT, TOP_RIGHT }


class BubbleStyle {
  const BubbleStyle({
    this.radius = 6,
    this.nip,
    this.nipWidth = 8,
    this.nipHeight = 10,
    this.nipRadius = 1,
    this.nipOffset = 0,
    this.showNip = true,
    this.color = Colors.white,
    this.elevation = 1.0,
    this.shadowColor = Colors.black,
    this.padding = const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
    this.margin = EdgeInsets.zero,
    this.alignment,
  });

  final double radius;
  final BubbleNip nip;
  final double nipHeight;
  final double nipWidth;
  final double nipRadius;
  final double nipOffset;
  final bool showNip;
  final Color color;
  final double elevation;
  final Color shadowColor;
  final EdgeInsets padding;
  final EdgeInsetsGeometry margin;
  final AlignmentGeometry alignment;
}

class BubbleClipper extends CustomClipper<Path> {
  BubbleClipper(this.style)
      : super() {
    assert(style != null);
    assert(style.nipWidth > 0.0);
    assert(style.nipHeight > 0.0);
    assert(style.nipRadius >= 0.0);
    assert(style.nipRadius <= style.nipWidth / 2.0 && style.nipRadius <= style.nipHeight / 2.0);
    assert(style.nipOffset >= 0.0);
    assert(style.radius <= style.nipHeight + style.nipOffset);
    assert(style.padding != null);

    if (style.nip != null && style.nipRadius > 0) {
      var k = style.nipHeight / style.nipWidth;
      var a = atan(k);

      nipCX = (style.nipRadius + sqrt(style.nipRadius * style.nipRadius * (1 + k * k))) / k;
      nipCY = style.nipRadius;
      nipPX = nipCX - style.nipRadius * sin(a);
      nipPY = nipCY + style.nipRadius * cos(a);
    }
  }

  final BubbleStyle style;

  double nipCX;
  double nipCY;
  double nipPX;
  double nipPY;

  get edgeInsets {
    return style.nip == BubbleNip.TOP_LEFT
        ? EdgeInsets.only(
            left: style.nipWidth + style.padding.left,
            top: style.padding.top,
            right: style.padding.right,
            bottom: style.padding.bottom)
        : style.nip == BubbleNip.TOP_RIGHT
            ? EdgeInsets.only(
                left: style.padding.left,
                top: style.padding.top,
                right: style.nipWidth + style.padding.right,
                bottom: style.padding.bottom)
            : EdgeInsets.only(
                left: style.padding.left,
                top: style.padding.top,
                right: style.padding.right,
                bottom: style.padding.bottom);
  }

  @override
  Path getClip(Size size) {
    var cornerRadius = Radius.circular(style.radius);
    var path = Path();

    if (style.nip == BubbleNip.TOP_LEFT) {
      path.addRRect(RRect.fromLTRBR(style.nipWidth, 0, size.width, size.height, cornerRadius));

      if (style.showNip) {
        // Mumbo-jumbo #1 / Танцы с бубнами #1.
        // Если делать через combine, как в случае с TOP_RIGHT, то при nipRadius = 0 и близких к нему bubble рисуется
        // нормально, зато тень игнорирует весь nip, как будто его нет, а есть только RRect
        path.moveTo(style.nipWidth + style.radius, style.nipOffset);
        path.lineTo(style.nipWidth + style.radius, style.nipOffset + style.nipHeight);
        path.lineTo(style.nipWidth, style.nipOffset + style.nipHeight);
        if (style.nipRadius == 0) {
          path.lineTo(0, style.nipOffset);
        } else {
          path.lineTo(nipPX, style.nipOffset + nipPY);
          path.arcToPoint(Offset(nipCX, style.nipOffset), radius: Radius.circular(style.nipRadius));
        }
        path.close();

        // Invalid code for nipRadius ~~ 0
//        var path2 = Path();
//        path2.moveTo(nipWidth + radius, nipOffset);
//        path2.lineTo(nipWidth + radius, nipOffset + nipHeight);
//        path2.lineTo(nipWidth, nipOffset + nipHeight);
//        if (nipRadius == 0) {
//          path2.lineTo(0, nipOffset );
//        } else {
//          path2.lineTo(nipPX, nipOffset + nipPY);
//          path2.arcToPoint(Offset(nipCX, nipOffset),
//              radius: Radius.circular(nipRadius));
//        }
//        path2.close();
//
//        path = Path.combine(PathOperation.union, path, path2);
      }
    } else if (style.nip == BubbleNip.TOP_RIGHT) {
      path.addRRect(RRect.fromLTRBR(0, 0, size.width - style.nipWidth, size.height, cornerRadius));

      if (style.showNip) {
        // Mumbo-jumbo #2 / Танцы с бубнами #2.
        // Если делать всё в одном Path, то возникают странные глюки: если nip справа, то происходит операция xor,
        // а не union. Поэтому использую новый path, а потом объединяю
        var path2 = Path();
        path2.moveTo(size.width - style.nipWidth - style.radius, style.nipOffset);
        path2.lineTo(size.width - style.nipWidth - style.radius, style.nipOffset + style.nipHeight);
        path2.lineTo(size.width - style.nipWidth, style.nipOffset + style.nipHeight);
        if (style.nipRadius == 0) {
          path2.lineTo(size.width, style.nipOffset);
        } else {
          path2.lineTo(size.width - nipPX, style.nipOffset + nipPY);
          path2.arcToPoint(Offset(size.width - nipCX, style.nipOffset),
              radius: Radius.circular(style.nipRadius),
              clockwise: false);
        }
        path2.close();

        path = Path.combine(PathOperation.union, path, path2);

        // Invalid code. "Xor" instead "combine"
//        path.moveTo(size.width - nipWidth - radius, nipOffset);
//        path.lineTo(size.width - nipWidth - radius, nipOffset + nipHeight);
//        path.lineTo(size.width - nipWidth, nipOffset + nipHeight);
//        if (nipRadius == 0) {
//          path.lineTo(size.width, nipOffset);
//        } else {
//          path.lineTo(
//              size.width - nipPX, nipOffset + nipPY);
//          path.arcToPoint(
//              Offset(size.width - nipCX, nipOffset),
//              radius: Radius.circular(nipRadius),
//              clockwise: false);
//        }
//        path.close();
      }
    } else {
      path.addRRect(RRect.fromLTRBR(0, 0, size.width, size.height, cornerRadius));
    }

    return path;
  }

  @override
  bool shouldReclip(BubbleClipper oldClipper) => false;
}


class Bubble extends StatelessWidget {
  Bubble({this.style, this.child})
      : bubbleClipper = BubbleClipper(style);

  final BubbleClipper bubbleClipper;
  final BubbleStyle style;
  final Widget child;

  Widget build(context) {
    return Container(
      alignment: style.alignment,
      margin: style.margin,
      child: PhysicalShape(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        clipper: bubbleClipper,
        child: Container(padding: bubbleClipper.edgeInsets, child: child),
        color: style.color,
        elevation: style.elevation,
        shadowColor: style.shadowColor,
      )
    );
  }
}
