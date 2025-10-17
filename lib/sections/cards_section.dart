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
      description: "Custom info cards.",
      children: [
        SmartCard(
          title: "Welcome to SmartUI!",
          level: SmartLevel.info,
          subtitle: "This is an informational card using default styling.",
          onTap: () => print("Info card tapped"),
        ),
        SmartCard(
          title: "Update Available",
          icon: Icons.system_update,
          level: SmartLevel.success,
          variant: SmartCardVariant.compact,
        ),
        SmartCard(
          title: "Server Down",
          subtitle: "Main database is not responding",
          icon: Icons.cloud_off,
          level: SmartLevel.error,
          variant: SmartCardVariant.media,
          actionText: "Retry",
          onActionPressed: () => print("Retry pressed"),
        ),
        SmartCard(
          title: "Upload Complete",
          subtitle: "Your files were uploaded successfully.",
          icon: Icons.cloud_done,
          level: SmartLevel.success,
        ),

        SmartCard(
          title: "Tasks Remaining",
          level: SmartLevel.warning,
          variant: SmartCardVariant.compact,
        ),
        SmartCard(
          title: "Form Submitted",
          subtitle: "Your response has been recorded",
          level: SmartLevel.success,
          variant: SmartCardVariant.media,
          actionText: "View Details",
          onActionPressed: () => print("Details clicked"),
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 20),
        ),
        SmartCard(
          title: "Network Error",
          level: SmartLevel.error,
          variant: SmartCardVariant.compact,
          icon: Icons.wifi_off,
          textColor: Colors.red.shade800,
          backgroundColor: Colors.red.shade50,
        ),
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
      ],
    );
  }
}
