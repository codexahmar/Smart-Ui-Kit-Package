import 'package:flutter/material.dart';
import 'package:smart_ui/widgets/smart_snackbar.dart';
import 'package:smart_ui/widgets/smart_section.dart';
import 'package:smart_ui/smart_ui_layouts.dart';

class SmartSnackbarSection extends StatelessWidget {
  const SmartSnackbarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartSection(
      title: "Smart Snackbar",
      description:
          "Show interactive snackbars with contextual styles, actions, icons, and more.",
      children: [
        // ✅ 1. Undo Action with confirmation
        SmartButtonAlt(
          label: "Undo Profile Update",
          backgroundColor: Colors.teal,
          textColor: Colors.white,
          icon: const Icon(Icons.undo, size: 18),
          onPressed: () {
            SmartSnackbar.show(
              context,
              message: "Profile updated successfully.",
              actionLabel: "Undo",
              actionStyle: const TextStyle(fontSize: 16, color: Colors.white),
              onActionPressed: () {
                SmartSnackbar.show(
                  context,
                  message: "Profile update reverted.",
                  backgroundColor: Colors.blue.shade700,
                  icon: Icons.undo,
                  textColor: Colors.white,
                );
              },
              backgroundColor: Colors.blue.shade600,
              textColor: Colors.white,
              icon: Icons.person,
            );
          },
        ),

        const SizedBox(height: 12),

        // ✅ 2. Success action (like saving settings)
        SmartButtonAlt(
          label: "Save Settings",
          backgroundColor: Colors.green.shade100,
          textColor: Colors.green.shade800,
          icon: const Icon(Icons.save, size: 18),
          onPressed: () {
            SmartSnackbar.show(
              context,
              message: "Settings saved successfully!",
              backgroundColor: Colors.green,
              textColor: Colors.white,
              icon: Icons.check_circle_outline,
              iconColor: Colors.white,
            );
          },
        ),

        const SizedBox(height: 12),

        // ✅ 3. Error handling use case
        SmartButtonAlt(
          label: "Trigger Error",
          backgroundColor: Colors.red.shade100,
          textColor: Colors.red.shade800,
          icon: const Icon(Icons.error_outline, size: 18),
          onPressed: () {
            SmartSnackbar.show(
              context,
              message: "Failed to load data.",
              backgroundColor: Colors.red.shade700,
              textColor: Colors.white,
              icon: Icons.error_outline,
              onDismissed: () {
                SmartSnackbar.show(
                  context,
                  message: "Error dismissed. Try again later.",
                  backgroundColor: Colors.grey.shade800,
                  icon: Icons.info_outline,
                  textColor: Colors.white,
                );
              },
            );
          },
        ),

        const SizedBox(height: 12),

        // ✅ 4. Informational tip/snackbar
        SmartButtonAlt(
          label: "Show Tip",
          backgroundColor: Colors.indigo.shade50,
          textColor: Colors.indigo,
          icon: const Icon(Icons.tips_and_updates, size: 18),
          onPressed: () {
            SmartSnackbar.show(
              context,
              message: "💡 Tip: Use long press to select multiple items!",
              backgroundColor: Colors.indigo,
              textColor: Colors.white,
              icon: Icons.tips_and_updates,
              iconColor: Colors.white,
              contentAlignment: MainAxisAlignment.center,
              textAlign: TextAlign.center,
              textMaxLines: 3,
              borderRadius: BorderRadius.circular(16),
            );
          },
        ),

        const SizedBox(height: 12),

        // ✅ 5. Custom styled update prompt with actions
        SmartButtonAlt(
          label: "App Update Available",
          backgroundColor: Colors.deepOrange.shade50,
          textColor: Colors.deepOrange.shade800,
          icon: const Icon(Icons.system_update, size: 18),
          onPressed: () {
            SmartSnackbar.show(
              context,
              message: "Version 2.1.0 is now available!",
              icon: Icons.system_update_alt,
              backgroundColor: Colors.deepOrange,
              textColor: Colors.white,
              actionLabel: "Update",
              onActionPressed: () => debugPrint("Updating app..."),

              elevation: 8,
              borderRadius: BorderRadius.circular(20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white24),
                borderRadius: BorderRadius.circular(20),
              ),
            );
          },
        ),
      ],
    );
  }
}
