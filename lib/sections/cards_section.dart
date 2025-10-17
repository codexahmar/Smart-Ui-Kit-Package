import 'package:flutter/material.dart';
import 'package:smart_ui/utils/smart_theme.dart';
import 'package:smart_ui/widgets/smart_section.dart';
import 'package:smart_ui/widgets/smart_card.dart';

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
          level: SmartLevel.info,
          subtitle: "This is an informational card using default styling.",
          onTap: () => print("Info card tapped"),
        ),

        // Compact Success Card
        SmartCard(
          title: "Update Available",
          icon: Icons.system_update,
          iconColor: Colors.blue,

          level: SmartLevel.success,
          variant: SmartCardVariant.expanded,
        ),

        // Media Error Card with Action
        SmartCard(
          title: "Server Down",
          subtitle: "Main database is not responding",
          icon: Icons.cloud_off,
          iconColor: Colors.red,
          level: SmartLevel.error,
          variant: SmartCardVariant.media,
          actionText: "Retry",

          onActionPressed: () => print("Retry pressed"),
        ),

        // Expanded Success Card
        SmartCard(
          title: "Upload Complete",
          subtitle: "Your files were uploaded successfully.",
          icon: Icons.cloud_done,
          iconColor: Colors.white,
          level: SmartLevel.success,
        ),

        // Compact Warning Card
        SmartCard(
          title: "Tasks Remaining",
          level: SmartLevel.warning,
          iconColor: Colors.orangeAccent,
          variant: SmartCardVariant.compact,
        ),

        // Media Success Card with custom padding and margin
        SmartCard(
          title: "Form Submitted",
          subtitle: "Your response has been recorded",
          level: SmartLevel.success,
          variant: SmartCardVariant.media,
          actionText: "View Details",
          iconColor: Colors.green.shade400,
          onActionPressed: () => print("Details clicked"),
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 20),
        ),

        // Custom Color Compact Error Card
        SmartCard(
          title: "Network Error",
          level: SmartLevel.error,
          variant: SmartCardVariant.compact,
          icon: Icons.wifi_off,
          textColor: Colors.red.shade800,
          backgroundColor: Colors.red.shade50,
        ),

        // Fully Custom Info Card
        SmartCard(
          title: "Custom Info Card",
          subtitle: "Manually styled colors and shadow",
          level: SmartLevel.info,
          icon: Icons.info_outline,
          textColor: Colors.indigo,
          backgroundColor: Colors.indigo.shade50,
          iconColor: Colors.indigo,
          boxShadow: [
            BoxShadow(
              color: Colors.indigo.withOpacity(0.1),
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
