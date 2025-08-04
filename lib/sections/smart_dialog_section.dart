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
        // Logout Confirmation
        SmartButtonAlt(
          label: "Confirm Logout",
          icon: const Icon(Icons.logout, size: 18, color: Colors.red),
          backgroundColor: Colors.red.shade50,
          textColor: Colors.red.shade700,
          onPressed: () {
            SmartDialog.show(
              context: context,
              title: "Logout?",
              icon: const Icon(Icons.logout, color: Colors.red),
              content: const Text(
                "Do you really want to logout of your account?",
              ),
              backgroundColor: Colors.white,
              titleStyle: const TextStyle(fontWeight: FontWeight.w600),
              customConfirmButton: SmartButtonAlt(
                label: "Logout",
                icon: const Icon(Icons.logout, size: 16, color: Colors.white),
                backgroundColor: Colors.red,
                textColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  print("User logged out");
                },
              ),
              customCancelButton: SmartButtonAlt(
                label: "Stay Logged In",

                textColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  print("Logout cancelled");
                },
              ),
            );
          },
        ),

        const SizedBox(height: 12),

        // Destructive Delete Warning
        SmartButtonAlt(
          label: "Delete Warning",
          icon: const Icon(
            Icons.delete_forever,
            size: 18,
            color: Colors.deepOrange,
          ),
          backgroundColor: Colors.deepOrange.shade50,
          textColor: Colors.deepOrange,
          onPressed: () {
            SmartDialog.show(
              context: context,
              title: "Delete Item?",
              icon: const Icon(Icons.delete_forever, color: Colors.deepOrange),
              content: const Text(
                "This action is permanent and cannot be undone.",
              ),

              titleStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
              customConfirmButton: SmartButtonAlt(
                label: "Delete",
                icon: const Icon(Icons.delete, size: 16, color: Colors.white),
                backgroundColor: Colors.deepOrange,
                textColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  print("Item deleted");
                },
              ),
              customCancelButton: SmartButtonAlt(
                label: "Cancel",

                textColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  print("Deletion cancelled");
                },
              ),
            );
          },
        ),

        const SizedBox(height: 12),

        // Informational Only
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
              customConfirmButton: SmartButtonAlt(
                label: "Got it",
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                icon: const Icon(Icons.check, size: 16, color: Colors.white),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  print("User acknowledged");
                },
              ),
            );
          },
        ),

        const SizedBox(height: 12),

        // Multi-Action Dialog
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
              showCancel: false,
              showConfirm: false,
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actionsPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    print("Reset selected");
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
