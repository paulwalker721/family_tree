// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:family_tree/main.dart';

void main() {
  testWidgets('Family tree screen renders the radial map', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    expect(find.text('Family Tree'), findsOneWidget);
    expect(find.text('Ava Khan'), findsOneWidget);
    expect(find.text('Father'), findsOneWidget);
    expect(find.text('Mother'), findsOneWidget);
  });
}
