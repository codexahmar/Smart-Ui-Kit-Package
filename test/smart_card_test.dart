import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_ui/utils/smart_theme.dart';
import 'package:smart_ui/widgets/smart_card.dart' hide SmartCardLayout;

void main() {
  testWidgets('SmartCard displays title and icon', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SmartCard(
          title: 'Test Card',
          icon: Icons.star,
          level: SmartLevel.info,
        ),
      ),
    );
    expect(find.text('Test Card'), findsOneWidget);
    expect(find.byIcon(Icons.star), findsOneWidget);
  });
}
