import 'package:flutter_test/flutter_test.dart';

import 'package:lab4_flutter_ui/main.dart';

void main() {
  testWidgets('App shows home screen and bottom navigation', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const Lab4App());
    await tester.pumpAndSettle();

    expect(find.text('Trang chủ'), findsWidgets);
    expect(find.text('Sản phẩm'), findsOneWidget);
    expect(find.text('Lab 4'), findsOneWidget);
    expect(find.text('Cá nhân'), findsOneWidget);
    expect(find.text('Chào mừng đến cửa hàng!'), findsOneWidget);
  });

  testWidgets('Products tab shows TabBar categories', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const Lab4App());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Sản phẩm'));
    await tester.pumpAndSettle();

    expect(find.text('Tất cả'), findsOneWidget);
    expect(find.text('Điện tử'), findsWidgets);
    expect(find.text('Thời trang'), findsWidgets);
    expect(find.text('Gia dụng'), findsWidgets);
    expect(find.text('iPhone 15 Pro'), findsOneWidget);
  });

  testWidgets('Lab tab shows all five exercises', (WidgetTester tester) async {
    await tester.pumpWidget(const Lab4App());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Lab 4'));
    await tester.pumpAndSettle();

    expect(find.text('Exercise 1 – Core Widgets Demo'), findsOneWidget);
    expect(find.text('Exercise 2 – Input Controls Demo'), findsOneWidget);
    expect(find.text('Exercise 3 – Layout Demo'), findsOneWidget);
    expect(find.text('Exercise 4 – App Structure & Theme'), findsOneWidget);
    expect(find.text('Exercise 5 – Common UI Fixes'), findsOneWidget);
  });
}
