import 'package:flutter/material.dart';
import 'package:smart_ui/widgets/smart_toast.dart';
import 'package:smart_ui/widgets/smart_section.dart';
import 'package:smart_ui/smart_ui_layouts.dart';

class SmartToastSection extends StatelessWidget {
  const SmartToastSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartSection(
      title: "Smart Toast",
      description: "Customizable toast notifications with varied buttons.",
      children: [
        // Solid green button with icon and rounded radius
        SmartButtonAlt(
          label: "Show Success Toast",
          icon: const Icon(Icons.check, color: Colors.white),
          backgroundColor: Colors.green.shade600,
          textColor: Colors.white,
          borderRadius: 16,
          onPressed: () {
            SmartToast.show(
              context,
              message: "✔️ Operation successful!",
              backgroundColor: Colors.green.shade600,
              icon: Icons.check_circle,
              textColor: Colors.white,
              duration: const Duration(seconds: 2),
            );
          },
        ),
        const SizedBox(height: 12),

        // Outlined orange button
        SmartButtonAlt(
          label: "Show Warning Toast",
          icon: const Icon(Icons.warning_amber_outlined, color: Colors.orange),
          backgroundColor: Colors.red,

          textColor: Colors.white,
          borderRadius: 20,
          onPressed: () {
            SmartToast.show(
              context,
              message: "⚠️ Warning! Check your input.",
              backgroundColor: Colors.orange.shade600,
              icon: Icons.warning_amber_outlined,
              textColor: Colors.white,
              duration: const Duration(seconds: 2),
            );
          },
        ),
        const SizedBox(height: 12),

        // Large font, greyish background, center toast
        SmartButtonAlt(
          label: "Show Center Toast",
          icon: const Icon(Icons.info_outline, color: Colors.white),
          backgroundColor: Colors.blueGrey,
          textColor: Colors.white,
          fontSize: 18,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          onPressed: () {
            SmartToast.show(
              context,
              message: "ℹ️ This is centered",
              backgroundColor: Colors.blueGrey,
              icon: Icons.info_outline,
              textColor: Colors.white,
              center: true,
              borderRadius: BorderRadius.circular(30),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            );
          },
        ),
        const SizedBox(height: 12),

        // Purple elevated button with dismiss callback
        SmartButtonAlt(
          label: "Toast with Dismiss Callback",
          icon: const Icon(Icons.close, color: Colors.white),
          backgroundColor: Colors.deepPurple,
          textColor: Colors.white,
          elevation: 4,
          borderRadius: 12,
          onPressed: () {
            SmartToast.show(
              context,
              message: "🧪 Toast dismissed",
              backgroundColor: Colors.indigo,
              textColor: Colors.white,
              onDismiss: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text("Toast removed")));
              },
            );
          },
        ),
      ],
    );
  }
}
