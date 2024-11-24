import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:openreads/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized() ;
  testWidgets('App initializes and shows a button', (WidgetTester tester) async {
    app.main(); // Launch your app

    await tester.pump();
    await tester.pumpAndSettle(); // Wait for animations
    sleep(Duration(seconds:100));

    await tester.pumpAndSettle();
    find.widgetWithText(SafeArea, 'Welcome to Openreads');

    final Finder swipeArea = find.byType(PageView);
    await tester.drag(swipeArea, const Offset(-300, 0));
    await tester.pumpAndSettle();
    await tester.drag(swipeArea, const Offset(-300, 0));
    await tester.pumpAndSettle();
    await tester.drag(swipeArea, const Offset(-300, 0));
    await tester.pumpAndSettle();

    final Finder button = find.text('Go to the app');
    await tester.tap(button);
    await tester.pumpAndSettle();

    await Future<void>.delayed(Duration.zero); // Keeps the test alive
    while (true) {
      await Future<void>.delayed(const Duration(seconds: 1));
    }
  });
}
