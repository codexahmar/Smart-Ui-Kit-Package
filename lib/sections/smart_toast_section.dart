import 'package:flutter/material.dart';

import 'package:smart_ui/widgets/smart_button.dart';
import 'package:smart_ui/widgets/smart_section.dart';
import 'package:smart_ui/widgets/smart_toast.dart';

class SmartToastSection extends StatelessWidget {
  const SmartToastSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartSection(
      title: "Smart Toast",
      description:
          "Customizable toast notifications with various configurations.",
      children: [
        // === Basic Toasts ===
        SmartButtonAlt(
          label: "Show Info Toast",
          icon: const Icon(Icons.info, color: Colors.white),
          backgroundColor: Colors.blueGrey,
          textColor: Colors.white,
          borderRadius: 12,
          onPressed: () {
            SmartToast.show(
              context,
              message: "This is an info toast.",
              backgroundColor: Colors.blueGrey,
              textColor: Colors.white,
              icon: Icons.info,
            );
          },
        ),
        const SizedBox(height: 12),

        SmartButtonAlt(
          label: "Show Success Toast",
          icon: const Icon(Icons.check_circle, color: Colors.white),
          backgroundColor: Colors.green,
          textColor: Colors.white,
          borderRadius: 12,
          onPressed: () {
            SmartToast.show(
              context,
              message: "Operation completed successfully.",
              backgroundColor: Colors.green,
              textColor: Colors.white,
              icon: Icons.check_circle,
            );
          },
        ),
        const SizedBox(height: 12),

        SmartButtonAlt(
          label: "Show Error Toast",
          icon: const Icon(Icons.error, color: Colors.white),
          backgroundColor: Colors.red,
          textColor: Colors.white,
          borderRadius: 12,
          onPressed: () {
            SmartToast.show(
              context,
              message: "An error occurred during the operation.",
              backgroundColor: Colors.red,
              textColor: Colors.white,
              icon: Icons.error,
            );
          },
        ),
        const SizedBox(height: 12),

        SmartButtonAlt(
          label: "Show Warning Toast",
          icon: const Icon(Icons.warning, color: Colors.white),
          backgroundColor: Colors.orange.shade700,
          textColor: Colors.white,
          borderRadius: 12,
          onPressed: () {
            SmartToast.show(
              context,
              message: "Please double-check your input.",
              backgroundColor: Colors.orange.shade700,
              textColor: Colors.white,
              icon: Icons.warning,
            );
          },
        ),

        const SizedBox(height: 24),

        // === Position Variants ===
        SmartButtonAlt(
          label: "Top Positioned Toast",
          icon: const Icon(Icons.vertical_align_top, color: Colors.black),
          backgroundColor: Colors.amber,
          textColor: Colors.black,
          borderRadius: 12,
          onPressed: () {
            SmartToast.show(
              context,
              message: "This toast appears at the top.",
              position: ToastPosition.top,
              backgroundColor: Colors.amber,
              textColor: Colors.black,
              icon: Icons.vertical_align_top,
            );
          },
        ),
        const SizedBox(height: 12),

        SmartButtonAlt(
          label: "Center Positioned Toast",
          icon: const Icon(Icons.center_focus_strong, color: Colors.white),
          backgroundColor: Colors.purple,
          textColor: Colors.white,
          borderRadius: 12,
          onPressed: () {
            SmartToast.show(
              context,
              message: "This toast is centered on screen.",
              position: ToastPosition.center,
              backgroundColor: Colors.purple,
              textColor: Colors.white,
              icon: Icons.center_focus_strong,
            );
          },
        ),

        const SizedBox(height: 24),

        // === Duration + Dismiss ===
        SmartButtonAlt(
          label: "5-Second Toast",
          icon: const Icon(Icons.timer, color: Colors.white),
          backgroundColor: Colors.indigo,
          textColor: Colors.white,
          borderRadius: 12,
          onPressed: () {
            SmartToast.show(
              context,
              message: "This toast will stay for 5 seconds.",
              duration: const Duration(seconds: 5),
              textColor: Colors.white,
              backgroundColor: Colors.indigo,
              icon: Icons.timer,
            );
          },
        ),
        const SizedBox(height: 12),

        SmartButtonAlt(
          label: "Toast with Dismiss Callback",
          icon: const Icon(Icons.close, color: Colors.white),
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          borderRadius: 12,
          onPressed: () {
            SmartToast.show(
              context,
              message: "This toast will trigger a callback when dismissed.",
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              icon: Icons.close,
              onDismiss: () {
                debugPrint("SmartToast dismissed!");
              },
            );
          },
        ),
      ],
    );
  }
}
