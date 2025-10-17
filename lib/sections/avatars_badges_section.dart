import 'package:flutter/material.dart';
import 'package:smart_ui/widgets/smart_avatar.dart';
import 'package:smart_ui/widgets/smart_badge.dart';
import 'package:smart_ui/widgets/smart_section.dart';

class AvatarsBadgesSection extends StatelessWidget {
  const AvatarsBadgesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartSection(
      title: "Avatars & Badges",
      description: "Profile avatars with status indicators.",
      children: [
        const Row(
          children: [
            SmartAvatar(
              imageUrl: "https://i.pravatar.cc/300",
              width: 60,
              height: 60,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            SmartBadge(
              label: "Active",
              color: Colors.green,
              textColor: Colors.white,
            ),
            const SizedBox(width: 8),
            SmartBadge(label: "Offline", color: Colors.grey),
            const SizedBox(width: 8),
            SmartBadge(
              label: "Pro",
              color: Colors.purple,
              textColor: Colors.white,
            ),
            const SizedBox(width: 8),
            Stack(
              children: [
                const Icon(Icons.notifications, size: 40, color: Colors.orange),
                Positioned(
                  right: 0,
                  top: 0,
                  child: SmartBadge(
                    label: "5",
                    color: Colors.red,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
