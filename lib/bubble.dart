library bubble;

import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';

enum BubbleNip { no, topLeft, topRight }

/// Class BubbleEdges is an analog of EdgeInsets, but default values are null.
class BubbleEdges {
  const BubbleEdges.fromLTRB(this.left, this.top, this.right, this.bottom);

  const BubbleEdges.all(double value)
      : left = value,
        top = value,
        right = value,
        bottom = value;

  const BubbleEdges.only({
    this.left, // = null
    this.top, // = null
    this.right, // = null
    this.bottom, // = null
  });

  const BubbleEdges.symmetric({
    double vertical, // = null
    double horizontal, // = null
  })  : left = horizontal,
        top = vertical,
        right = horizontal,
        bottom = vertical;

  final double left;
  final double top;
  final double right;
  final double bottom;

  static get zero => BubbleEdges.all(0);

  EdgeInsets get edgeInsets => EdgeInsets.fromLTRB(left ?? 0, top ?? 0, right ?? 0, bottom ?? 0);

  @override
  String toString() => 'BubbleEdges($left, $top, $right, $bottom)';
}

class BubbleStyle {
  const BubbleStyle({
    this.radius,
    this.nip,
    this.nipWidth,
    this.nipHeight,
    this.nipRadius,
    this.nipOffset,
    this.showNip,
    this.color,
    this.elevation,
    this.shadowColor,
    this.padding,
    this.margin,
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
  final BubbleEdges padding;
  final BubbleEdges margin;
  final Alignment alignment;
}

class BubbleClipper extends CustomClipper<Path> {
  BubbleClipper(this.style)
      : assert(style != null),
        assert(style != null),
        assert(style.nipWidth > 0.0),
        assert(style.nipHeight > 0.0),
        assert(style.nipRadius >= 0.0),
        assert(style.nipRadius <= style.nipWidth / 2.0 && style.nipRadius <= style.nipHeight / 2.0),
        assert(style.nipOffset >= 0.0),
        assert(style.radius <= style.nipHeight + style.nipOffset),
        assert(style.padding != null),
        assert(style.padding.left != null),
        assert(style.padding.top != null),
        assert(style.padding.right != null),
        assert(style.padding.bottom != null),
        super() {
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
    return style.nip == BubbleNip.topLeft
        ? EdgeInsets.only(
            left: style.nipWidth + style.padding.left,
            top: style.padding.top,
            right: style.padding.right,
            bottom: style.padding.bottom)
        : style.nip == BubbleNip.topRight
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

    switch (style.nip) {
      case BubbleNip.topLeft:
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
        break;

      case BubbleNip.topRight:
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
                radius: Radius.circular(style.nipRadius), clockwise: false);
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
        break;

      case BubbleNip.no:
        path.addRRect(RRect.fromLTRBR(0, 0, size.width, size.height, cornerRadius));
        break;
    }

    return path;
  }

  @override
  bool shouldReclip(BubbleClipper oldClipper) => false;
}

class Bubble extends StatelessWidget {
  Bubble({
    this.child,
    double radius,
    BubbleNip nip,
    double nipWidth,
    double nipHeight,
    double nipRadius,
    double nipOffset,
    bool showNip,
    Color color,
    double elevation,
    Color shadowColor,
    BubbleEdges padding,
    BubbleEdges margin,
    Alignment alignment,
    BubbleStyle style,
  }) : bubbleClipper = BubbleClipper(BubbleStyle(
          radius: radius ?? style?.radius ?? 6.0,
          nip: nip ?? style?.nip ?? BubbleNip.no,
          nipWidth: nipWidth ?? style?.nipWidth ?? 8.0,
          nipHeight: nipHeight ?? style?.nipHeight ?? 10.0,
          nipRadius: nipRadius ?? style?.nipRadius ?? 1.0,
          nipOffset: nipOffset ?? style?.nipOffset ?? 0.0,
          showNip: showNip ?? style?.showNip ?? true,
          color: color ?? style?.color ?? Colors.white,
          elevation: elevation ?? style?.elevation ?? 1.0,
          shadowColor: shadowColor ?? style?.shadowColor ?? Colors.black,
          padding: BubbleEdges.only(
            left: padding?.left ?? style?.padding?.left ?? 8.0,
            top: padding?.top ?? style?.padding?.top ?? 6.0,
            right: padding?.right ?? style?.padding?.right ?? 8.0,
            bottom: padding?.bottom ?? style?.padding?.bottom ?? 6.0,
          ),
          margin: BubbleEdges.only(
            left: margin?.left ?? style?.margin?.left ?? 0.0,
            top: margin?.top ?? style?.margin?.top ?? 0.0,
            right: margin?.right ?? style?.margin?.right ?? 0.0,
            bottom: margin?.bottom ?? style?.margin?.bottom ?? 0.0,
          ),
          alignment: alignment ?? style?.alignment ?? Alignment.center,
        ));

  final Widget child;
  final BubbleClipper bubbleClipper;

  Widget build(context) {
    return Container(
        alignment: bubbleClipper.style.alignment,
        margin: bubbleClipper.style.margin?.edgeInsets,
        child: PhysicalShape(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          clipper: bubbleClipper,
          child: Container(padding: bubbleClipper.edgeInsets, child: child),
          color: bubbleClipper.style.color,
          elevation: bubbleClipper.style.elevation,
          shadowColor: bubbleClipper.style.shadowColor,
        ));
  }
}
