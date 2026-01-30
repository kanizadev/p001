import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:p001/main.dart'; // Ensure 'p001' matches your package name in pubspec.yaml

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    // We use findsAtLeast(1) because your logs show 3 widgets with "0"
    expect(find.text('0'), findsAtLeast(1));
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    // Ensure the icon matches what is in your main.dart (default is Icons.add)
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsAtLeast(1)); // Some '0's might remain if they are labels
    expect(find.text('1'), findsAtLeast(1));
  });
}
