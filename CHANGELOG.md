## Unreleased

* Requires Dart 3.6 and Flutter 3.27 or newer (was Dart 2.12). The widget and
  its parameters are unchanged.
* Every public member is documented.
* `pubspec.yaml` names the repository, the issue tracker, topics and a
  screenshot for pub.dev.
* The example runs on current Flutter: its platform folders are regenerated and
  it uses `launchUrl` from url_launcher 6.3. Its app bar is teal again under
  Material 3, as on the screenshots.
* The archive no longer carries the README screenshots, which the README links
  from GitHub anyway.
* Fixed: a `GlobalKey` on `Bubble` threw "Multiple widgets used the same
  GlobalKey", because the bubble passed its key on to the `Container` it
  builds. The key now stays on the `Bubble`.
* Fixed: a bubble already on screen was not repainted when its color, border,
  shadow or shape changed but its size did not, because
  `BubblePainter.shouldRepaint` and `BubbleClipper.shouldReclip` always
  returned `false`. Both now compare what they draw.

## 1.2.1 (2021-03-10)

* Added a border (`borderColor`, `borderWidth`, `borderUp`).
* Changed `Alignment` to `AlignmentGeometry`.
* Added a key.

## 1.2.0 (2021-03-10)

* Null safety!
* Added `BubbleNip.leftCenter` and `BubbleNip.rightCenter`. Since now the width
  for top/bottom and center is different you need ti use the `showNip` parameter
  instead of BubbleNip.no to remove the nip.

## 1.1.9+1 (2019-08-09)

* Fixed bug - don't draw a circle in the nip in `leftBottom` and `rightBottom`
  modes.

## 1.1.9 (2019-08-09)

* Remake `stick`. If `stick` set to `false`, the right offset of bubble equal to
  the offset from the left, not taking into account the size of the nip. This
  allows the bubbles to line up. If `stick` set to `true`, the far side will be
  stick to the edge.
* Removed `showNip`. It's useless now.
* Corrected README.md and screenshots.

## 1.1.8+2 (2019-08-07)

* Fixed README.md.
* Added `stick` property.
* Changed `NO`, `TOP_LEFT` and `TOP_RIGHT` to `no`, `leftTop`, `rightTop` in
  BubbleNip.
* Added `leftBottom` and `rightBottom` to BubbleNip.
* Refactoring.

## 1.1.7 (2019-08-05)

* Added additional properties similar to properties in `style`. They are
  priority.
* EdgeInsets replaced by class BubbleEdges. It similar to EdgeInsets, but
  default values are null. Thus, `padding: BubbleEdges.only(top: 2)` will only
  replace `padding.top` without affecting `left`, `right` and `bottom`.

## 1.1.6 (2019-07-31)

* Wrote README.md.
* Made screenshots.

## 1.0.1 (2019-07-29)

* Added an example.

## 0.1.0 (2019-07-29)

* Published on https://pub.dev/.

## 0.0.1 (2019-07-27)

* First release.
