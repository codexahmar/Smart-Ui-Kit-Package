// lib/pages/smart_showcase_page.dart
import 'package:flutter/material.dart';
import 'package:smart_ui/sections/smart_chip_section.dart';
import 'package:smart_ui/sections/smart_dialog_section.dart';
import 'package:smart_ui/sections/smart_empty_state_section.dart';
import 'package:smart_ui/sections/smart_modal_bottom_sheet_section.dart';
import 'package:smart_ui/sections/smart_snackbar_section.dart';
import 'package:smart_ui/sections/smart_toast_section.dart';
import 'package:smart_ui/widgets/smart_header.dart';
import 'package:smart_ui/sections/buttons_inputs_section.dart';
import 'package:smart_ui/sections/avatars_badges_section.dart';
import 'package:smart_ui/sections/tiles_section.dart';
import 'package:smart_ui/sections/cards_section.dart';

class SmartShowcasePage extends StatelessWidget {
  const SmartShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(title: const Text('Smart UI Widgets Launching Soon')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SmartHeader(
              title: "Smart UI Layouts",
              subtitle: "Build beautiful UIs faster with reusable components.",
              titleStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
                letterSpacing: 0.5,
              ),
              subtitleStyle: TextStyle(
                fontSize: 14,
                color: isDark ? Colors.white70 : Colors.black87,
              ),
              action: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color:
                      isDark
                          ? const Color.fromRGBO(255, 193, 7, 0.2)
                          : const Color.fromRGBO(255, 193, 7, 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.auto_awesome,
                  color: Colors.amber,
                  size: 24,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              alignment: MainAxisAlignment.spaceBetween,
              animationDuration: const Duration(milliseconds: 600),
              spacingBetween: 16,
              titleSubtitleSpacing: 6,
            ),

            SizedBox(height: 24),
            ButtonsInputsSection(),
            SizedBox(height: 24),
            AvatarsBadgesSection(),
            SizedBox(height: 24),
            TilesSection(),
            SizedBox(height: 24),
            CardsSection(),
            SizedBox(height: 24),
            SmartToastSection(),
            SizedBox(height: 24),
            SmartChipSection(),
            SizedBox(height: 24),
            SmartSnackbarSection(),
            SizedBox(height: 24),
            SmartDialogSection(),
            SizedBox(height: 24),
            SmartModalBottomSheetSection(),
            SizedBox(height: 24),
            SmartEmptyStateSection(),
          ],
        ),
      ),
    );
  }
}
