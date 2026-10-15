part of 'bubble.dart';

/// The parameters of a [Bubble], kept together so that they can be reused.
///
/// A chat typically declares two styles — one for its own messages and one
/// for the other side's — and passes one of them to every bubble. A
/// parameter set on the bubble itself wins over the style; see [Bubble] for
/// the order and [Bubble.new] for what each parameter means.
class BubbleStyle {
  /// Creates a style. Every parameter left `null` falls through to the
  /// default of [Bubble].
  const BubbleStyle({
    this.radius,
    this.showNip,
    this.nip,
    this.nipWidth,
    this.nipHeight,
    this.nipOffset,
    this.nipRadius,
    this.stick,
    this.color,
    this.borderColor,
    this.borderWidth,
    this.borderUp,
    this.elevation,
    this.shadowColor,
    this.padding,
    this.margin,
    this.alignment,
  });

  /// The radius of the corners; see [Bubble.new].
  final Radius? radius;

  /// Whether the nip is drawn; see [Bubble.new].
  final bool? showNip;

  /// Where the nip sits; see [Bubble.new].
  final BubbleNip? nip;

  /// The height of the nip; see [Bubble.new].
  final double? nipHeight;

  /// The width of the nip; see [Bubble.new].
  final double? nipWidth;

  /// How far the nip is moved; see [Bubble.new].
  final double? nipOffset;

  /// The radius of the tip of the nip; see [Bubble.new].
  final double? nipRadius;

  /// Whether the far side reaches the edge; see [Bubble.new].
  final bool? stick;

  /// The fill colour; see [Bubble.color].
  final Color? color;

  /// The colour of the border; see [Bubble.borderColor].
  final Color? borderColor;

  /// The width of the border; see [Bubble.borderWidth].
  final double? borderWidth;

  /// Whether the border is above the fill; see [Bubble.borderUp].
  final bool? borderUp;

  /// The elevation of the shadow; see [Bubble.elevation].
  final double? elevation;

  /// The colour of the shadow; see [Bubble.shadowColor].
  final Color? shadowColor;

  /// The padding around the child, side by side; see [Bubble.new].
  final BubbleEdges? padding;

  /// The margin around the bubble, side by side; see [Bubble.margin].
  final BubbleEdges? margin;

  /// The position of the bubble; see [Bubble.alignment].
  final AlignmentGeometry? alignment;
}
