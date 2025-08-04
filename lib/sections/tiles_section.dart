import 'package:flutter/material.dart';
import 'package:smart_ui/widgets/smart_section.dart';
import 'package:smart_ui/widgets/smart_tile.dart';
import 'package:smart_ui/widgets/smart_badge.dart';

class TilesSection extends StatelessWidget {
  const TilesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartSection(
      title: "Tiles",
      description: "Tappable compact info tiles.",
      children: [
        SmartTile(
          icon: Icons.wifi,
          title: "Wi-Fi",
          subtitle: "Connected",
          onTap: () {},
          iconColor: Colors.blue,
          trailing: const Icon(Icons.chevron_right),
        ),
        SmartTile(
          icon: Icons.bluetooth,
          title: "Bluetooth",
          subtitle: "Off",
          iconColor: Colors.grey,
          trailing: Switch(value: true, onChanged: (_) {}),
        ),
        SmartTile(
          icon: Icons.notifications,
          iconColor: Colors.orange,
          title: "Alerts",
          trailing: SmartBadge(label: "5", color: Colors.white),
        ),
      ],
    );
  }
}
