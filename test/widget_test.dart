import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tejs_app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const TejsApp());

    expect(find.text('TEJS APP'), findsOneWidget);
    expect(find.text('Trending Now'), findsOneWidget);
  });

  testWidgets('Navigation test', (WidgetTester tester) async {
    await tester.pumpWidget(const TejsApp());

    expect(find.byType(HomeScreen), findsOneWidget);

    await tester.tap(find.byIcon(Icons.videogame_asset_outlined));
    await tester.pumpAndSettle();

    expect(find.text('Games'), findsOneWidget);
  });
}
