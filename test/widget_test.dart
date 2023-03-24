// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:qrscan/main.dart';

void main() {
  testWidgets('Main Widget Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    expect(find.text("QR Code Scanner"), findsOneWidget);
    expect(find.text("Saved Item"), findsNothing);

    await tester.tap(find.text("Saved Item"));
    await tester.pump();

    expect(find.text("QR Code Scanner"), findsOneWidget);
    expect(find.text("Saved Item"), findsNothing);
  });
}
