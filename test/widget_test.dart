import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:booknest/data/book_data.dart';
import 'package:booknest/main.dart';

void main() {
  test('the sample collection contains ten books', () {
    expect(sampleBooks.length, 10);
  });

  testWidgets('splash screen opens Home after three seconds', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const BookNestApp());

    expect(find.text('Your Personal Digital Library'), findsOneWidget);

    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    expect(find.text('Welcome to your library'), findsOneWidget);
  });

  testWidgets('book list opens a detail page and returns with back', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const BookNestApp());
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Books').last);
    await tester.pumpAndSettle();
    expect(find.text('Explore Books'), findsOneWidget);

    await tester.tap(find.text('Atomic Habits'));
    await tester.pumpAndSettle();
    expect(find.text('by James Clear'), findsOneWidget);

    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();
    expect(find.text('Explore Books'), findsOneWidget);
  });

  testWidgets('About screen shows the six required categories', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const BookNestApp());
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('About').first);
    await tester.pumpAndSettle();

    expect(find.byType(GridView), findsOneWidget);
    expect(find.text('Fiction'), findsOneWidget);
    expect(find.text('Science'), findsOneWidget);
    expect(find.text('Technology'), findsOneWidget);
    expect(find.text('History'), findsOneWidget);
    expect(find.text('Biography'), findsOneWidget);
    expect(find.text('Self-Development'), findsOneWidget);
  });
}
