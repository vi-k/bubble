part of 'bubble.dart';

/// Padding or margin of a [Bubble], side by side: like [EdgeInsets], except
/// that a side left out is `null` rather than zero.
///
/// A `null` side is not set, so it falls through to the style and then to
/// the default: `padding: BubbleEdges.only(top: 2)` changes the top padding
/// and keeps the other three.
class BubbleEdges {
  /// Sets the four sides in the order left, top, right, bottom.
  const BubbleEdges.fromLTRB(
    this.left,
    this.top,
    this.right,
    this.bottom,
  );

  /// Sets all four sides to [value].
  const BubbleEdges.all(double? value)
      : left = value,
        top = value,
        right = value,
        bottom = value;

  /// Sets only the sides given; the others stay `null`.
  const BubbleEdges.only({
    this.left,
    this.top,
    this.right,
    this.bottom,
  });

  /// Sets left and right to [horizontal], top and bottom to [vertical].
  const BubbleEdges.symmetric({
    double? vertical,
    double? horizontal,
  })  : left = horizontal,
        top = vertical,
        right = horizontal,
        bottom = vertical;

  /// The left side, or `null` if it is not set.
  final double? left;

  /// The top side, or `null` if it is not set.
  final double? top;

  /// The right side, or `null` if it is not set.
  final double? right;

  /// The bottom side, or `null` if it is not set.
  final double? bottom;

  /// These sides as [EdgeInsets], with every side that is not set as zero.
  EdgeInsets get edgeInsets =>
      EdgeInsets.fromLTRB(left ?? 0, top ?? 0, right ?? 0, bottom ?? 0);

  @override
  String toString() => 'BubbleEdges($left, $top, $right, $bottom)';
}
