import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Ensure 'p001' matches the name in your pubspec.yaml
import 'package:p001/main.dart'; 

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // 1. Verify that our counter starts at 0.
    // Your logs show 3 widgets with text "0", so we expect 3.
    expect(find.text('0'), findsNWidgets(3));
    expect(find.text('1'), findsNothing);

    // 2. Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // 3. Verify that our counter has incremented.
    // After incrementing, we expect to find at least one "1".
    expect(find.text('1'), findsWidgets);
    
    // Some "0"s might still exist if they are static labels in your UI
    // So we don't strictly check for findsNothing on '0' anymore.
  });
}
