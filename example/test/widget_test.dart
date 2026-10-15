import 'package:bubble/bubble.dart';
import 'package:example/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('the chat comes up with its bubbles', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('TODAY'), findsOneWidget);
    expect(find.text("Whats'up?"), findsOneWidget);
    expect(find.byType(Bubble), findsWidgets);
  });
}
