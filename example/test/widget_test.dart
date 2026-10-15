import 'package:bubble/bubble.dart';
import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('the chat comes up with its bubbles', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('TODAY'), findsOneWidget);
    expect(find.text("Whats'up?"), findsOneWidget);
    expect(find.byType(Bubble), findsWidgets);
  });

  testWidgets('the app bar is teal, as on the README screenshots',
      (tester) async {
    await tester.pumpWidget(const MyApp());

    final bar = tester.widget<Material>(
      find
          .descendant(of: find.byType(AppBar), matching: find.byType(Material))
          .first,
    );
    expect(bar.color, Colors.teal);
  });
}
