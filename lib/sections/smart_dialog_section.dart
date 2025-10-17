import 'package:flutter/material.dart';
import 'package:smart_ui/widgets/smart_dialog.dart';
import 'package:smart_ui/widgets/smart_section.dart';
import 'package:smart_ui/smart_ui_layouts.dart';

class SmartDialogSection extends StatelessWidget {
  const SmartDialogSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartSection(
      title: "Smart Dialog",
      description: "Modern, customizable dialogs for every scenario.",
      children: [
        // ✅ 1. Confirm Logout Dialog with custom button
        SmartButtonAlt(
          label: "Confirm Logout",
          icon: const Icon(Icons.logout, size: 18),
          backgroundColor: Colors.cyan,
          textColor: Colors.white,
          onPressed: () {
            SmartDialog.show(
              context: context,
              title: "Logout?",
              icon: const Icon(Icons.logout, color: Colors.red),
              content: const Text(
                "Do you really want to logout of your account?",
              ),
              cancelTextStyle: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
              ),
              customConfirmButton: SmartButtonAlt(
                label: "Logout",
                icon: const Icon(Icons.logout, size: 16, color: Colors.white),
                backgroundColor: Colors.red,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                  print("User logged out");
                },
              ),
            );
          },
        ),

        const SizedBox(height: 12),
        // ✅ 2. Simple Confirmation Dialog with default button colors
        SmartButtonAlt(
          label: "Show Dialog",
          icon: const Icon(Icons.open_in_new, size: 18),
          backgroundColor: Colors.teal,
          textColor: Colors.white,
          onPressed: () {
            SmartDialog.show(
              context: context,
              title: "Confirm?",
              content: const Text("Do you really want to proceed?"),
              confirmText: "Yes",
              cancelText: "No",

              confirmButtonColor: Colors.green,
            );
          },
        ),

        const SizedBox(height: 12),

        // ✅ 3. Informational Dialog
        SmartButtonAlt(
          label: "Info Dialog",
          icon: const Icon(Icons.info_outline, size: 18, color: Colors.blue),
          backgroundColor: Colors.blue.shade50,
          textColor: Colors.blue.shade800,
          onPressed: () {
            SmartDialog.show(
              context: context,
              title: "Heads up!",
              icon: const Icon(Icons.info_outline, color: Colors.blue),
              content: const Text("We’ve updated our terms and policies."),
              backgroundColor: Colors.white,
              showCancel: false,
              confirmText: "Got it",
              confirmTextStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),

        const SizedBox(height: 12),

        // ✅ 4. Multi-Option Dialog
        SmartButtonAlt(
          label: "Multi-Option Dialog",
          icon: const Icon(Icons.settings, size: 18, color: Colors.teal),
          backgroundColor: Colors.teal.shade50,
          textColor: Colors.teal.shade700,
          onPressed: () {
            SmartDialog.show(
              context: context,
              title: "Choose Action",
              icon: const Icon(Icons.settings, color: Colors.teal),
              content: const Text("Please choose your preferred action below."),
              backgroundColor: Colors.white,
              actionsAlignment: MainAxisAlignment.spaceBetween,

              actions: [
                SmartButtonAlt(
                  label: "Backup",
                  icon: const Icon(
                    Icons.backup,
                    size: 16,
                    color: Colors.indigo,
                  ),
                  backgroundColor: Colors.indigo.shade50,
                  textColor: Colors.indigo,
                  onPressed: () {
                    Navigator.of(context).pop();
                    print("Backup selected");
                  },
                ),
                SmartButtonAlt(
                  label: "Reset",
                  icon: const Icon(Icons.refresh, size: 16, color: Colors.red),
                  backgroundColor: Colors.red.shade50,
                  textColor: Colors.red,
                  onPressed: () {
                    Navigator.of(context).pop();
                    print("Reset selected");
                  },
                ),
              ],
            );
          },
        ),

        const SizedBox(height: 12),

        // ✅ 5. Scrollable Content Dialog
        SmartButtonAlt(
          label: "Long Content Dialog",
          icon: const Icon(Icons.article, size: 18, color: Colors.deepPurple),
          backgroundColor: Colors.deepPurple.shade50,
          textColor: Colors.deepPurple,
          onPressed: () {
            SmartDialog.show(
              context: context,
              title: "Privacy Policy",
              icon: const Icon(Icons.lock_outline, color: Colors.deepPurple),
              scrollable: true,
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  10,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      "Clause ${index + 1}: This is some detailed policy information.",
                    ),
                  ),
                ),
              ),
              customConfirmButton: SmartButtonAlt(
                label: "Accept",
                backgroundColor: Colors.deepPurple,
                textColor: Colors.white,
                icon: const Icon(
                  Icons.check_circle,
                  size: 16,
                  color: Colors.white,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  print("Policy accepted");
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
