import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Import all section widgets from example
import 'package:example/sections/avatars_badges_section.dart';
import 'package:example/sections/buttons_inputs_section.dart';
import 'package:example/sections/smart_card.dart';
import 'package:example/sections/smart_chip_section.dart';
import 'package:example/sections/smart_dialog_section.dart';
import 'package:example/sections/smart_empty_state_section.dart';
import 'package:example/sections/smart_modal_bottom_sheet_section.dart';
import 'package:example/sections/smart_snackbar_section.dart';
import 'package:example/sections/smart_toast_section.dart';
import 'package:example/sections/tiles_section.dart';

void main() {
  // Helper to pump a widget in a MaterialApp
  Future<void> pumpSection(WidgetTester tester, Widget section) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: section)));
    await tester.pumpAndSettle();
  }

  testWidgets('AvatarsBadgesSection renders', (tester) async {
    await pumpSection(tester, const AvatarsBadgesSection());
    expect(find.text('Avatars & Badges'), findsOneWidget);
  });

  testWidgets('ButtonsInputsSection renders', (tester) async {
    await pumpSection(tester, const ButtonsInputsSection());
    expect(find.text('Buttons & Inputs'), findsOneWidget);
  });

  testWidgets('CardsSection renders', (tester) async {
    await pumpSection(tester, const CardsSection());
    expect(find.text('Cards'), findsOneWidget);
  });

  testWidgets('SmartChipSection renders', (tester) async {
    await pumpSection(tester, const SmartChipSection());
    expect(find.text('Smart Chips / Tags'), findsOneWidget);
  });

  testWidgets('SmartDialogSection renders', (tester) async {
    await pumpSection(tester, const SmartDialogSection());
    expect(find.text('Smart Dialog'), findsOneWidget);
  });

  testWidgets('SmartEmptyStateSection renders', (tester) async {
    await pumpSection(tester, const SmartEmptyStateSection());
    expect(find.text('Smart Empty State'), findsOneWidget);
  });

  testWidgets('SmartModalBottomSheetSection renders', (tester) async {
    await pumpSection(tester, const SmartModalBottomSheetSection());
    expect(find.text('Smart Modal Bottom Sheet'), findsOneWidget);
  });

  testWidgets('SmartSnackbarSection renders', (tester) async {
    await pumpSection(tester, const SmartSnackbarSection());
    expect(find.text('Smart Snackbar'), findsOneWidget);
  });

  testWidgets('SmartToastSection renders', (tester) async {
    await pumpSection(tester, const SmartToastSection());
    expect(find.text('Smart Toast'), findsOneWidget);
  });

  testWidgets('TilesSection renders', (tester) async {
    await pumpSection(tester, const TilesSection());
    expect(find.text('Tiles'), findsOneWidget);
  });
}
