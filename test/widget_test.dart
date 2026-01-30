import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// IMPORTANT: If your project folder is not 'p001', 
// change 'p001' to the 'name' found in your pubspec.yaml
import 'package:p001/main.dart'; 

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // 1. Verify that our counter starts at 0.
    // We use findsWidgets because your logs show 3 widgets with text "0"
    expect(find.text('0'), findsWidgets);
    expect(find.text('1'), findsNothing);

    // 2. Tap the '+' icon and trigger a frame.
    // This looks for the increment button.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // 3. Verify that our counter has incremented.
    // This confirms that at least one "1" has appeared.
    expect(find.text('1'), findsWidgets);
  });
}
