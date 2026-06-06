import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lab4_flutter_ui/main.dart';

void main() {
  testWidgets('App opens movie list with bottom navigation', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MovieApp());
    await tester.pumpAndSettle();

    expect(find.text('Phim'), findsOneWidget);
    expect(find.text('Khám phá'), findsOneWidget);
    expect(find.text('Cá nhân'), findsOneWidget);
    expect(find.text('Movies'), findsOneWidget);
    expect(find.text('Dune: Part Two'), findsOneWidget);
  });

  testWidgets('Movie list navigates to detail screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MovieApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Dune: Part Two'));
    await tester.pumpAndSettle();

    expect(find.text('Trailers'), findsOneWidget);
    expect(find.text('Official Trailer #1'), findsOneWidget);
    expect(find.text('Favorite'), findsOneWidget);
  });

  testWidgets('Browse tab filters movies by search', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MovieApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Khám phá'));
    await tester.pumpAndSettle();

    expect(find.text('Find a Movie'), findsWidgets);
    expect(find.text('6 movies'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'deadpool');
    await tester.pumpAndSettle();

    expect(find.text('Deadpool & Wolverine'), findsOneWidget);
    expect(find.text('1 movies'), findsOneWidget);
  });

  testWidgets('Profile links to UI fundamentals', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MovieApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Cá nhân'));
    await tester.pumpAndSettle();

    expect(find.text('UI Fundamentals'), findsOneWidget);

    await tester.tap(find.text('UI Fundamentals'));
    await tester.pumpAndSettle();

    expect(find.text('Core Widgets'), findsOneWidget);
    expect(find.text('Common UI Fixes'), findsOneWidget);
  });
}
