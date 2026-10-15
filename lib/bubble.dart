/// A speech bubble for chat messages: a rounded box with an optional nip
/// pointing at the side the message came from.
///
/// [Bubble] is the widget; [BubbleStyle] collects its parameters so that a
/// chat can describe "my message" and "their message" once and override a
/// single value per bubble.
library;

import 'dart:math';

import 'package:flutter/material.dart';

part 'bubble_clipper.dart';
part 'bubble_edges.dart';
part 'bubble_painter.dart';
part 'bubble_style.dart';

/// Where the nip of a [Bubble] sits.
///
/// The nip is the small triangle that points at the speaker. Hiding it while
/// keeping its room — for the second and later messages in a run — is
/// `showNip: false` on [Bubble.new], not [BubbleNip.no]: the two differ in width, and only
/// the former keeps the bubbles of a run aligned.
enum BubbleNip {
  /// No nip and no room reserved for it.
  no,

  /// On the left edge, at the top.
  leftTop,

  /// On the left edge, centred vertically.
  leftCenter,

  /// On the left edge, at the bottom.
  leftBottom,

  /// On the right edge, at the top.
  rightTop,

  /// On the right edge, centred vertically.
  rightCenter,

  /// On the right edge, at the bottom.
  rightBottom,
}

/// A speech bubble around [child].
///
/// Every parameter is resolved in the same order: the value passed to the
/// constructor, then the one in `style`, then the default. `padding` and
/// [margin] are resolved side by side, so `padding: BubbleEdges.only(top: 2)`
/// replaces the top padding of the style and keeps its other three sides.
class Bubble extends StatelessWidget {
  /// Creates a speech bubble.
  ///
  /// Defaults: white, no border (1 px wide and above the fill once
  /// [borderColor] is set), elevation 1 with a black shadow, corner radius 6,
  /// no nip (8 wide and 10
  /// high when one is chosen, its tip rounded with radius 1), padding 8
  /// horizontally and 6 vertically, no margin and no alignment.
  ///
  /// [radius] rounds the corners. [nip] picks the side and position of the
  /// nip; [nipWidth] and [nipHeight] size it, [nipOffset] moves it away from
  /// the corner it starts at (or down from the centre), and [nipRadius]
  /// rounds its tip. [showNip] set to `false` hides the nip but keeps its
  /// room, so that a run of bubbles from one speaker stays aligned. [stick]
  /// set to `true` lets the side opposite the nip reach the edge; by default
  /// that side is inset by the width of the nip too.
  ///
  /// [borderColor] and [borderWidth] draw a border; [borderUp] set to `false`
  /// paints it under the fill, so that only its outer half shows.
  /// [elevation] and [shadowColor] control the shadow. [padding] surrounds
  /// [child] inside the bubble, [margin] surrounds the bubble, and
  /// [alignment] positions the bubble within the space it is given.
  Bubble({
    super.key,
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
    Color? borderColor,
    double? borderWidth,
    bool? borderUp,
    double? elevation,
    Color? shadowColor,
    BubbleEdges? padding,
    BubbleEdges? margin,
    AlignmentGeometry? alignment,
    BubbleStyle? style,
  })  : color = color ?? style?.color ?? Colors.white,
        borderColor = borderColor ?? style?.borderColor ?? Colors.transparent,
        borderWidth = borderWidth ?? style?.borderWidth ?? 1,
        borderUp = borderUp ?? style?.borderUp ?? true,
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

  /// The content of the bubble.
  final Widget? child;

  /// The fill colour.
  final Color color;

  /// The colour of the border; transparent draws no border.
  final Color borderColor;

  /// The width of the border; zero draws no border.
  final double borderWidth;

  /// Whether the border is painted above the fill (`true`) or under it.
  final bool borderUp;

  /// The elevation of the shadow; zero draws no shadow.
  final double elevation;

  /// The colour of the shadow.
  final Color shadowColor;

  /// The empty space around the bubble.
  final EdgeInsets margin;

  /// How the bubble is positioned within the space it is given, or `null` to
  /// shrink-wrap the parent around it.
  final AlignmentGeometry? alignment;

  /// The shape of the bubble, built from the resolved parameters.
  final BubbleClipper bubbleClipper;

  @override
  Widget build(BuildContext context) => Container(
        alignment: alignment,
        margin: margin,
        child: CustomPaint(
          painter: BubblePainter(
            clipper: bubbleClipper,
            color: color,
            borderColor: borderColor,
            borderWidth: borderWidth,
            borderUp: borderUp,
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
