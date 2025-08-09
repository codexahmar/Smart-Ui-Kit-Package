import 'package:example/sections/avatars_badges_section.dart';
import 'package:example/sections/buttons_inputs_section.dart';
import 'package:example/sections/smart_card.dart';
import 'package:example/sections/smart_chip_section.dart';
import 'package:example/sections/smart_dialog_section.dart';
import 'package:example/sections/smart_empty_state_section.dart';
import 'package:example/sections/smart_modal_bottom_sheet_section.dart';
import 'package:example/sections/smart_onboarding_section.dart';
import 'package:example/sections/smart_snackbar_section.dart';
import 'package:example/sections/smart_toast_section.dart';
import 'package:example/sections/tiles_section.dart';
import 'package:flutter/material.dart';
import 'package:smart_ui_kit/smart_ui_kit.dart';

class SmartShowcasePage extends StatefulWidget {
  const SmartShowcasePage({super.key});

  @override
  State<SmartShowcasePage> createState() => _SmartShowcasePageState();
}

class _SmartShowcasePageState extends State<SmartShowcasePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Home tab: all sections, others: demo text
    final List<Widget> tabContents = [
      SingleChildScrollView(
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
                  color: isDark
                      ? Colors.amber.withValues(alpha: 0.2)
                      : Colors.amber.withValues(alpha: 0.1),
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
            SmartOnboardingSection(),
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
      Center(
        child: Text(
          'Search Tab',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      Center(
        child: Text(
          'Profile Tab',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Smart UI Widgets Launching Soon')),
      body: tabContents[_selectedIndex],
      bottomNavigationBar: SmartBottomBar(
        height: 80,
        fullWidth: true,
        backgroundColor: Colors.teal,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: [
          SmartBottomBarItem(
            icon: const Icon(Icons.home_outlined, color: Colors.white),
            activeIcon: const Icon(Icons.home, color: Colors.white),
            label: "Home",
            activeColor: Colors.white,
            inactiveColor: Colors.white70,
          ),
          SmartBottomBarItem(
            icon: const Icon(Icons.search, color: Colors.white),
            label: "Search",
            activeColor: Colors.white,
            inactiveColor: Colors.white54,
          ),
          SmartBottomBarItem(
            icon: const Icon(Icons.person_outline, color: Colors.white),
            activeIcon: const Icon(Icons.person, color: Colors.white),
            label: "Profile",
            activeColor: Colors.white,
            inactiveColor: Colors.white38,
          ),
        ],
      ),
    );
  }
}
