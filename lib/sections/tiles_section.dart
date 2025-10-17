import 'package:flutter/material.dart';
import 'package:smart_ui/widgets/smart_section.dart';
import 'package:smart_ui/widgets/smart_tile.dart';
import 'package:smart_ui/widgets/smart_badge.dart';

class TilesSection extends StatelessWidget {
  const TilesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SmartSection(
      title: "Tiles",
      description: "Tappable compact info tiles with custom behavior.",
      children: [
        // Basic info tile with icon and trailing arrow
        SmartTile(
          icon: Icons.wifi,
          title: "Wi-Fi",
          subtitle: "Connected",
          onTap: () {},
          iconColor: Colors.blueAccent,
          backgroundColor: isDark ? Colors.grey[900] : Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          trailing: const Icon(Icons.chevron_right),
        ),

        const SizedBox(height: 12),

        // Tile with trailing switch
        SmartTile(
          icon: Icons.bluetooth,
          title: "Bluetooth",
          subtitle: "Off",
          iconColor: Colors.indigo,
          borderRadius: BorderRadius.circular(12),
          trailingSpacing: 0,
          trailing: Switch(value: false, onChanged: (_) {}),
        ),

        const SizedBox(height: 12),

        // Tile with SmartBadge (notifications)
        SmartTile(
          icon: Icons.notifications,
          title: "Alerts",
          iconColor: Colors.orange,
          backgroundColor: isDark ? Colors.grey[850] : Colors.white,
          border: Border.all(color: theme.dividerColor),
          borderRadius: BorderRadius.circular(12),
          trailing: SmartBadge(
            label: "5",
            color: Colors.red,
            textColor: Colors.white,
          ),
        ),

        const SizedBox(height: 12),

        // Tile with long press, box shadow and status indicator
        SmartTile(
          title: "Admin Mode",
          subtitle: "Tap and hold to enable",
          icon: Icons.shield,
          iconColor: Colors.green,
          onLongPress: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Admin Mode Activated")),
            );
          },
          borderRadius: BorderRadius.circular(14),
          backgroundColor: isDark ? Colors.green[900] : Colors.green[50],
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
          trailing: const Icon(Icons.lock_open),
        ),

        const SizedBox(height: 12),

        // Tile with full custom leading widget (avatar or image)
        SmartTile(
          leading: CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage("https://i.pravatar.cc/100"),
          ),
          title: "User Profile",
          subtitle: "View and edit details",
          onTap: () {},
          trailing: const Icon(Icons.person),
          borderRadius: BorderRadius.circular(12),
        ),
      ],
    );
  }
}
