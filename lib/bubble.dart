library bubble;

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

part 'bubble_clipper.dart';
part 'bubble_edges.dart';
part 'bubble_painter.dart';
part 'bubble_style.dart';

enum BubbleNip {
  no,
  leftTop,
  leftCenter,
  leftBottom,
  rightTop,
  rightCenter,
  rightBottom,
}

class Bubble extends StatelessWidget {
  Bubble({
    this.child,
    Radius? radius,
    bool? showNip,
    BubbleNip? nip,
    double? nipWidth,
    double? nipHeight,
    double? nipOffset,
    double? nipRadius,
    bool? stick,
    Color? color,
    double? elevation,
    Color? shadowColor,
    BubbleEdges? padding,
    BubbleEdges? margin,
    Alignment? alignment,
    BubbleStyle? style,
  })  : color = color ?? style?.color ?? Colors.white,
        elevation = elevation ?? style?.elevation ?? 1,
        shadowColor = shadowColor ?? style?.shadowColor ?? Colors.black,
        margin = EdgeInsets.only(
          left: margin?.left ?? style?.margin?.left ?? 0,
          top: margin?.top ?? style?.margin?.top ?? 0,
          right: margin?.right ?? style?.margin?.right ?? 0,
          bottom: margin?.bottom ?? style?.margin?.bottom ?? 0,
        ),
        alignment = alignment ?? style?.alignment,
        bubbleClipper = BubbleClipper(
          radius: radius ?? style?.radius ?? const Radius.circular(6),
          showNip: showNip ?? style?.showNip ?? true,
          nip: nip ?? style?.nip ?? BubbleNip.no,
          nipWidth: nipWidth ?? style?.nipWidth ?? 8,
          nipHeight: nipHeight ?? style?.nipHeight ?? 10,
          nipOffset: nipOffset ?? style?.nipOffset ?? 0,
          nipRadius: nipRadius ?? style?.nipRadius ?? 1,
          stick: stick ?? style?.stick ?? false,
          padding: EdgeInsets.only(
            left: padding?.left ?? style?.padding?.left ?? 8,
            top: padding?.top ?? style?.padding?.top ?? 6,
            right: padding?.right ?? style?.padding?.right ?? 8,
            bottom: padding?.bottom ?? style?.padding?.bottom ?? 6,
          ),
        );

  final Widget? child;
  final Color color;
  final double elevation;
  final Color shadowColor;
  final EdgeInsets margin;
  final Alignment? alignment;
  final BubbleClipper bubbleClipper;

  @override
  Widget build(BuildContext context) => Container(
        alignment: alignment,
        margin: margin,
        child: CustomPaint(
          painter: BubblePainter(
            clipper: bubbleClipper,
            color: color,
            elevation: elevation,
            shadowColor: shadowColor,
          ),
          child: Container(
            padding: bubbleClipper.edgeInsets,
            child: child,
          ),
        ),
      );
}
