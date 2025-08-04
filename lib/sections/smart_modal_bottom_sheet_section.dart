import 'package:flutter/material.dart';
import 'package:smart_ui/widgets/smart_modal.dart';
import 'package:smart_ui/widgets/smart_section.dart';
import 'package:smart_ui/smart_ui_layouts.dart';

class SmartModalBottomSheetSection extends StatelessWidget {
  const SmartModalBottomSheetSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartSection(
      title: "Smart Modal Bottom Sheet",
      description: "Modern modal bottom sheets with full customization.",
      children: [
        // 1. Quick Settings Modal
        SmartButtonAlt(
          label: "Show Quick Settings",
          icon: const Icon(Icons.settings, size: 18),
          backgroundColor: Colors.grey.shade200,
          textColor: Colors.black87,
          onPressed: () {
            SmartModalBottomSheet.show(
              context: context,
              title: "Quick Settings",
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("• Enable Notifications"),
                  SizedBox(height: 8),
                  Text("• Dark Mode"),
                  SizedBox(height: 8),
                  Text("• Backup Data"),
                ],
              ),
            );
          },
        ),

        const SizedBox(height: 12),

        // 2. Modal with Form
        SmartButtonAlt(
          label: "Open Feedback Form",
          icon: const Icon(Icons.feedback_outlined, size: 18),
          backgroundColor: Colors.blue.shade50,
          textColor: Colors.blue,
          onPressed: () {
            final controller = TextEditingController();

            SmartModalBottomSheet.show(
              context: context,
              title: "Send Feedback",
              isScrollControlled: true,
              contentPadding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Your feedback is valuable."),
                  const SizedBox(height: 12),
                  TextField(
                    controller: controller,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "Write your message here...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                SmartButtonAlt(
                  label: "Submit",
                  backgroundColor: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                    print("Feedback: ${controller.text}");
                  },
                ),
              ],
            );
          },
        ),

        const SizedBox(height: 12),

        // 3. Action Sheet (Compact)
        SmartButtonAlt(
          label: "Open Action Sheet",
          icon: const Icon(Icons.share, size: 18),
          backgroundColor: Colors.green.shade50,
          textColor: Colors.green.shade700,
          onPressed: () {
            SmartModalBottomSheet.show(
              context: context,
              title: "Share via",
              showDragHandle: false,
              actionsAlignment: MainAxisAlignment.spaceEvenly,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.share, size: 32),
                  Icon(Icons.copy, size: 32),
                  Icon(Icons.bookmark, size: 32),
                ],
              ),
            );
          },
        ),

        const SizedBox(height: 12),
      ],
    );
  }
}
