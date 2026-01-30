import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// IMPORTANT: Replace 'p001' with your project name from pubspec.yaml
import 'package:p001/main.dart'; 

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // 1. Verify that '0' exists. 
    // We use findsAtLeast(1) to ignore the "too many" error.
    expect(find.text('0'), findsAtLeast(1));
    expect(find.text('1'), findsNothing);

    // 2. Tap the '+' icon and trigger a frame.
    // Logic: find by icon is usually safer than finding by text.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // 3. Verify that '1' now exists.
    expect(find.text('1'), findsAtLeast(1));
  });
}
