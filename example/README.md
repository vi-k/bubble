# bubble example

A short chat made of `Bubble` widgets.

```sh
cd example
flutter run
```

Each side of the conversation is one `BubbleStyle`, declared once and passed to
every bubble of that side:

```dart
static const styleSomebody = BubbleStyle(
  nip: BubbleNip.leftCenter,
  color: Colors.white,
  borderColor: Colors.blue,
  borderWidth: 1,
  elevation: 4,
  margin: BubbleEdges.only(top: 8, right: 50),
  alignment: Alignment.topLeft,
);
```

When one side sends several messages in a row, only the first has a nip. The
others pass `showNip: false`, which hides the nip but keeps its room, so the
run stays aligned; their `margin` overrides only the top of the style's:

```dart
Bubble(
  style: styleSomebody,
  margin: const BubbleEdges.only(top: 4),
  showNip: false,
  child: const Text('Can you help me?'),
),
```

Below the chat, four `PhysicalShape`s with the outlines of `IssueClipper` show
how Flutter cast the shadow of a path made of several contours
([flutter/flutter#37779](https://github.com/flutter/flutter/issues/37779)).
That behaviour is why, since 1.2.0, `BubbleClipper` joins the nip to the
rectangle with `Path.combine` instead of adding it as a second contour.
