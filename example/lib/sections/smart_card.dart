import 'package:flutter/material.dart';
import 'package:smart_ui_kit/smart_ui_kit.dart';

class CardsSection extends StatelessWidget {
  const CardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartSection(
      title: "Cards",
      description: "Custom info cards with variants and styles.",
      children: [
        // Default Expanded Info Card
        SmartCard(
          title: "Welcome to SmartUI!",
          subtitle: "This is an informational card using default styling.",
        ),

        // Compact Success Card
        SmartCard(
          title: "Update Available",
          icon: Icons.system_update,
          iconColor: Colors.blue,
          variant: SmartCardVariant.expanded,
        ),

        // Media Error Card with Action
        SmartCard(
          title: "Server Down",
          subtitle: "Main database is not responding",
          icon: Icons.cloud_off,
          iconColor: Colors.red,

          variant: SmartCardVariant.media,
          actionText: "Retry",
        ),

        // Expanded Success Card
        SmartCard(
          title: "Upload Complete",
          subtitle: "Your files were uploaded successfully.",
          icon: Icons.cloud_done,
          iconColor: Colors.white,
        ),

        // Compact Warning Card
        SmartCard(
          title: "Tasks Remaining",

          iconColor: Colors.orangeAccent,
          variant: SmartCardVariant.compact,
        ),

        // Media Success Card with custom padding and margin
        SmartCard(
          title: "Form Submitted",
          subtitle: "Your response has been recorded",

          variant: SmartCardVariant.media,
          actionText: "View Details",
          iconColor: Colors.green.shade400,

          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 20),
        ),

        // Custom Color Compact Error Card
        SmartCard(
          title: "Network Error",

          variant: SmartCardVariant.compact,
          icon: Icons.wifi_off,
          textColor: Colors.red.shade800,
          backgroundColor: Colors.red.shade50,
        ),

        // Fully Custom Info Card
        SmartCard(
          title: "Custom Info Card",
          subtitle: "Manually styled colors and shadow",

          icon: Icons.info_outline,
          textColor: Colors.indigo,
          backgroundColor: Colors.indigo.shade50,
          iconColor: Colors.indigo,
          boxShadow: [
            BoxShadow(
              color: Colors.indigo.withValues(alpha: 0.1),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),

        // Custom Child Layout Card (Developer-defined)
        SmartCard(
          title: "Custom Layout",
          backgroundColor: Colors.teal.shade50,
          iconColor: Colors.teal,
          child: Row(
            children: [
              const Icon(Icons.star, size: 40, color: Colors.teal),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Custom Child",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "This layout is manually passed as a child.",
                      style: TextStyle(fontSize: 14, color: Colors.teal),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
