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
      description: "Interactive snackbars with different styles and purposes.",
      children: [
        // ✅ 1. Undo Snackbar with nested confirmation
        SmartButtonAlt(
          label: "Show Undo Snackbar",
          backgroundColor: Colors.blueGrey.shade100,
          textColor: Colors.blueGrey.shade800,
          icon: const Icon(Icons.undo, size: 18),
          onPressed: () {
            SmartSnackbar.show(
              context,
              message: "Profile updated!",
              actionLabel: "Undo",
              actionTextColor: Colors.white,
              onActionPressed: () {
                SmartSnackbar.show(
                  context,
                  message: "Undo clicked",
                  backgroundColor: Colors.blueGrey,
                  icon: Icons.undo,
                );
              },
            );
          },
        ),

        const SizedBox(height: 12),

        // ✅ 2. Success Snackbar with icon and green background
        SmartButtonAlt(
          label: "Show Success Snackbar",
          backgroundColor: Colors.green,
          textColor: Colors.white,
          icon: const Icon(
            Icons.check_circle_outline,
            size: 18,
            color: Colors.white,
          ),
          onPressed: () {
            SmartSnackbar.show(
              context,
              message: "Saved successfully!",
              backgroundColor: Colors.green,
              textColor: Colors.white,
              icon: Icons.check_circle_outline,
              iconColor: Colors.white,
            );
          },
        ),

        const SizedBox(height: 12),

        // ✅ 3. Error Snackbar with red background and dismiss callback
        SmartButtonAlt(
          label: "Show Error Snackbar",
          backgroundColor: Colors.red.shade700,
          textColor: Colors.white,
          icon: const Icon(Icons.error_outline, size: 18, color: Colors.white),
          onPressed: () {
            SmartSnackbar.show(
              context,
              message: "Something went wrong!",
              backgroundColor: Colors.red.shade700,
              textColor: Colors.white,
              icon: Icons.error_outline,
              onDismissed: () {
                SmartSnackbar.show(
                  context,
                  message: "Snackbar dismissed!",
                  backgroundColor: Colors.black87,
                  icon: Icons.info_outline,
                );
              },
            );
          },
        ),

        const SizedBox(height: 12),

        // ✅ 4. Info Snackbar with center alignment and multiline support
        SmartButtonAlt(
          label: "Show Info Snackbar",
          backgroundColor: Colors.indigo.shade50,
          textColor: Colors.indigo,
          icon: const Icon(Icons.info, size: 18, color: Colors.indigo),
          onPressed: () {
            SmartSnackbar.show(
              context,
              message: "🧠 Tip: You can hold an item to select multiple.",
              backgroundColor: Colors.indigo,
              textColor: Colors.white,
              icon: Icons.info_outline,
              iconColor: Colors.white,
              contentAlignment: MainAxisAlignment.center,
              textAlign: TextAlign.center,
              textMaxLines: 3,
            );
          },
        ),

        const SizedBox(height: 12),

        // ✅ 5. Custom Styled Snackbar with icon widget and action style
        SmartButtonAlt(
          label: "Show Styled Snackbar",
          backgroundColor: Colors.deepOrange.shade100,
          textColor: Colors.deepOrange,
          icon: const Icon(Icons.settings, size: 18, color: Colors.deepOrange),
          onPressed: () {
            SmartSnackbar.show(
              context,
              message: "New update available!",
              icon: Icons.system_update_alt,
              backgroundColor: Colors.deepOrange,
              textColor: Colors.white,
              actionLabel: "Update",
              onActionPressed: () => debugPrint("Update triggered!"),
              actionTextColor: Colors.yellowAccent,
              elevation: 10,
              borderRadius: BorderRadius.circular(20),
            );
          },
        ),
      ],
    );
  }
}
