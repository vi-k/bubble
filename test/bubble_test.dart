import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// The widget, its style and its painter. The shape itself is pinned in
// `bubble_clipper_test.dart`; this file covers what [Bubble] does with the
// parameters before the clipper sees them, where it puts the child, what it
// does with its key, when it repaints, and in what order it paints. All of
// it is 1.2.1 behaviour except two fixes: 1.2.1 also put the key on the
// inner `Container`, and never repainted a bubble whose size stayed.

Widget _host(Widget child) => Directionality(
      textDirection: TextDirection.ltr,
      child: Align(alignment: Alignment.topLeft, child: child),
    );

Finder get _painter => find.descendant(
      of: find.byType(Bubble),
      matching: find.byType(CustomPaint),
    );

void main() {
  group('Bubble resolves', () {
    test('every parameter to its default when nothing is set', () {
      final bubble = Bubble();
      final clipper = bubble.bubbleClipper;

      expect(bubble.color, Colors.white);
      expect(bubble.borderColor, Colors.transparent);
      expect(bubble.borderWidth, 1);
      expect(bubble.borderUp, isTrue);
      expect(bubble.elevation, 1);
      expect(bubble.shadowColor, Colors.black);
      expect(bubble.margin, EdgeInsets.zero);
      expect(bubble.alignment, isNull);
      expect(clipper.radius, const Radius.circular(6));
      expect(clipper.showNip, isTrue);
      expect(clipper.nip, BubbleNip.no);
      expect(clipper.nipWidth, 8);
      expect(clipper.nipHeight, 10);
      expect(clipper.nipOffset, 0);
      expect(clipper.nipRadius, 1);
      expect(clipper.stick, isFalse);
      expect(clipper.padding, const EdgeInsets.fromLTRB(8, 6, 8, 6));
    });

    test('a parameter from the style when the widget does not set it', () {
      const style = BubbleStyle(
        radius: Radius.circular(3),
        showNip: false,
        nip: BubbleNip.rightBottom,
        nipWidth: 6,
        nipHeight: 12,
        nipOffset: 2,
        nipRadius: 2,
        stick: true,
        color: Colors.green,
        borderColor: Colors.red,
        borderWidth: 2,
        borderUp: false,
        elevation: 3,
        shadowColor: Colors.blue,
        padding: BubbleEdges.all(4),
        margin: BubbleEdges.all(5),
        alignment: Alignment.centerRight,
      );
      final bubble = Bubble(style: style);
      final clipper = bubble.bubbleClipper;

      expect(bubble.color, Colors.green);
      expect(bubble.borderColor, Colors.red);
      expect(bubble.borderWidth, 2);
      expect(bubble.borderUp, isFalse);
      expect(bubble.elevation, 3);
      expect(bubble.shadowColor, Colors.blue);
      expect(bubble.margin, const EdgeInsets.all(5));
      expect(bubble.alignment, Alignment.centerRight);
      expect(clipper.radius, const Radius.circular(3));
      expect(clipper.showNip, isFalse);
      expect(clipper.nip, BubbleNip.rightBottom);
      expect(clipper.nipWidth, 6);
      expect(clipper.nipHeight, 12);
      expect(clipper.nipOffset, 2);
      expect(clipper.nipRadius, 2);
      expect(clipper.stick, isTrue);
      expect(clipper.padding, const EdgeInsets.all(4));
    });

    test('a parameter from the widget over the style', () {
      const style = BubbleStyle(
        nip: BubbleNip.rightBottom,
        color: Colors.green,
        elevation: 3,
        alignment: Alignment.centerRight,
      );
      final bubble = Bubble(
        style: style,
        nip: BubbleNip.leftTop,
        color: Colors.yellow,
        elevation: 0,
        alignment: Alignment.centerLeft,
      );

      expect(bubble.bubbleClipper.nip, BubbleNip.leftTop);
      expect(bubble.color, Colors.yellow);
      expect(bubble.elevation, 0);
      expect(bubble.alignment, Alignment.centerLeft);
    });

    test('padding and margin side by side: widget, then style, then default',
        () {
      const style = BubbleStyle(
        padding: BubbleEdges.only(left: 1, top: 2),
        margin: BubbleEdges.only(right: 3),
      );
      final bubble = Bubble(
        style: style,
        padding: const BubbleEdges.only(top: 20),
        margin: const BubbleEdges.only(bottom: 40),
      );

      expect(
        bubble.bubbleClipper.padding,
        const EdgeInsets.fromLTRB(1, 20, 8, 6),
      );
      expect(bubble.margin, const EdgeInsets.fromLTRB(0, 0, 3, 40));
    });
  });

  group('Bubble lays out', () {
    testWidgets('the child inside the margin and the insets of the clipper',
        (tester) async {
      final bubble = Bubble(
        nip: BubbleNip.leftTop,
        margin: const BubbleEdges.only(left: 3, top: 4),
        child: const SizedBox(width: 20, height: 10),
      );
      await tester.pumpWidget(_host(bubble));

      final insets = bubble.bubbleClipper.edgeInsets;
      expect(
        tester.getTopLeft(find.byType(SizedBox)) -
            tester.getTopLeft(find.byType(Bubble)),
        Offset(3 + insets.left, 4 + insets.top),
      );
      expect(
        tester.getSize(find.byType(Bubble)),
        Size(3 + insets.horizontal + 20, 4 + insets.vertical + 10),
      );
    });

    testWidgets('itself by the alignment within the space it is given',
        (tester) async {
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: Center(
            child: SizedBox(
              width: 200,
              height: 100,
              child: Bubble(
                alignment: Alignment.topRight,
                child: const SizedBox(width: 20, height: 10),
              ),
            ),
          ),
        ),
      );

      final box = tester.getRect(find.byType(Bubble));
      final child = tester.getRect(find.byType(SizedBox).last);
      expect(child.right, box.right - 8);
      expect(child.top, box.top + 6);
    });
  });

  group('Bubble takes', () {
    testWidgets('a GlobalKey', (tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(_host(Bubble(key: key, child: const Text('x'))));

      expect(tester.takeException(), isNull);
      expect(key.currentWidget, isA<Bubble>());
    });

    testWidgets('a key for itself, not for the widgets it builds',
        (tester) async {
      const key = ValueKey('bubble');
      await tester.pumpWidget(_host(Bubble(key: key, child: const Text('x'))));

      expect(find.byKey(key), findsOneWidget);
    });
  });

  group('Bubble repaints', () {
    const child = SizedBox(width: 20, height: 10);
    final before = Bubble(
      nip: BubbleNip.leftTop,
      borderColor: Colors.red,
      child: child,
    );

    // Puts [after] where [before] was and stops the frame after layout, so
    // the repaint the swap asked for is still there to read. The size must
    // stay: a new size repaints on its own and would hide the painter's
    // answer.
    Future<bool> needsPaint(WidgetTester tester, Bubble after) async {
      await tester.pumpWidget(_host(before));
      final size = tester.getSize(find.byType(Bubble));
      await tester.pumpWidget(_host(after), phase: EnginePhase.layout);

      expect(tester.getSize(find.byType(Bubble)), size);
      return tester.renderObject(_painter).debugNeedsPaint;
    }

    testWidgets('not when nothing changes', (tester) async {
      final same = Bubble(
        nip: BubbleNip.leftTop,
        borderColor: Colors.red,
        child: child,
      );

      expect(await needsPaint(tester, same), isFalse);
    });

    final changes = {
      'color': Bubble(
        nip: BubbleNip.leftTop,
        borderColor: Colors.red,
        color: Colors.green,
        child: child,
      ),
      'borderColor': Bubble(
        nip: BubbleNip.leftTop,
        borderColor: Colors.blue,
        child: child,
      ),
      'borderWidth': Bubble(
        nip: BubbleNip.leftTop,
        borderColor: Colors.red,
        borderWidth: 2,
        child: child,
      ),
      'borderUp': Bubble(
        nip: BubbleNip.leftTop,
        borderColor: Colors.red,
        borderUp: false,
        child: child,
      ),
      'elevation': Bubble(
        nip: BubbleNip.leftTop,
        borderColor: Colors.red,
        elevation: 4,
        child: child,
      ),
      'shadowColor': Bubble(
        nip: BubbleNip.leftTop,
        borderColor: Colors.red,
        shadowColor: Colors.blue,
        child: child,
      ),
      'radius': Bubble(
        nip: BubbleNip.leftTop,
        borderColor: Colors.red,
        radius: const Radius.circular(3),
        child: child,
      ),
      'showNip': Bubble(
        nip: BubbleNip.leftTop,
        borderColor: Colors.red,
        showNip: false,
        child: child,
      ),
      'nip': Bubble(
        nip: BubbleNip.leftBottom,
        borderColor: Colors.red,
        child: child,
      ),
      'nipOffset': Bubble(
        nip: BubbleNip.leftTop,
        borderColor: Colors.red,
        nipOffset: 4,
        child: child,
      ),
    };
    for (final MapEntry(key: name, value: after) in changes.entries) {
      testWidgets('for a new $name', (tester) async {
        expect(await needsPaint(tester, after), isTrue);
      });
    }
  });

  group('Bubble paints', () {
    bool isShadow(Symbol method, List<dynamic> arguments) =>
        method == #drawShadow;

    testWidgets('shadow, fill, then border when the border is up',
        (tester) async {
      await tester.pumpWidget(
        _host(
          Bubble(
            color: Colors.green,
            borderColor: Colors.red,
            borderWidth: 2,
            child: const SizedBox(width: 20, height: 10),
          ),
        ),
      );

      expect(
        _painter,
        paints
          ..something(isShadow)
          ..path(color: Colors.green, style: PaintingStyle.fill)
          ..path(
            color: Colors.red,
            strokeWidth: 2,
            style: PaintingStyle.stroke,
          ),
      );
    });

    testWidgets('shadow, border, then fill when the border is down',
        (tester) async {
      await tester.pumpWidget(
        _host(
          Bubble(
            color: Colors.green,
            borderColor: Colors.red,
            borderUp: false,
            child: const SizedBox(width: 20, height: 10),
          ),
        ),
      );

      expect(
        _painter,
        paints
          ..something(isShadow)
          ..path(color: Colors.red, style: PaintingStyle.stroke)
          ..path(color: Colors.green, style: PaintingStyle.fill),
      );
    });

    testWidgets('no shadow at zero elevation, no border when transparent',
        (tester) async {
      await tester.pumpWidget(
        _host(
          Bubble(
            elevation: 0,
            child: const SizedBox(width: 20, height: 10),
          ),
        ),
      );

      expect(_painter, isNot(paints..something(isShadow)));
      expect(_painter, paintsExactlyCountTimes(#drawPath, 1));
      expect(
        _painter,
        paints..path(color: Colors.white, style: PaintingStyle.fill),
      );
    });

    testWidgets('no border at zero width', (tester) async {
      await tester.pumpWidget(
        _host(
          Bubble(
            borderColor: Colors.red,
            borderWidth: 0,
            child: const SizedBox(width: 20, height: 10),
          ),
        ),
      );

      expect(_painter, paintsExactlyCountTimes(#drawPath, 1));
    });
  });

  group('BubbleEdges', () {
    test('keeps unset sides null', () {
      const edges = BubbleEdges.only(top: 2);

      expect(edges.left, isNull);
      expect(edges.top, 2);
      expect(edges.right, isNull);
      expect(edges.bottom, isNull);
    });

    test('fills the sides its constructor names', () {
      const all = BubbleEdges.all(3);
      const symmetric = BubbleEdges.symmetric(vertical: 1, horizontal: 2);
      const ltrb = BubbleEdges.fromLTRB(1, 2, 3, 4);

      expect(
        [all.left, all.top, all.right, all.bottom],
        [3, 3, 3, 3],
      );
      expect(
        [symmetric.left, symmetric.top, symmetric.right, symmetric.bottom],
        [2, 1, 2, 1],
      );
      expect(
        [ltrb.left, ltrb.top, ltrb.right, ltrb.bottom],
        [1, 2, 3, 4],
      );
    });

    test('turns null sides into zero in edgeInsets', () {
      expect(
        const BubbleEdges.only(left: 5, bottom: 7).edgeInsets,
        const EdgeInsets.fromLTRB(5, 0, 0, 7),
      );
    });

    test('prints its four sides', () {
      expect(
        const BubbleEdges.only(top: 2).toString(),
        'BubbleEdges(null, 2.0, null, null)',
      );
    });
  });
}
