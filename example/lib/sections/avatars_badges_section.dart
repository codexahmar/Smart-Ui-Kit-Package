import 'package:flutter/material.dart';
import 'package:smart_ui_kit/smart_ui_kit.dart';

class AvatarsBadgesSection extends StatelessWidget {
  const AvatarsBadgesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return SmartSection(
      title: "Avatars & Badges",
      description: "Profile avatars with status indicators.",
      children: [
        Row(
          children: [
            SmartAvatar(
              imageUrl: "https://i.pravatar.cc/100",
              size: 80,
              borderColor: Colors.blueAccent,
              borderWidth: 2,
              isCircular: true,
              showStatus: true,
              statusSize: 20,
              statusColor: Colors.greenAccent,
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            // ✅ Status badge - active
            SmartBadge(
              label: "Active",
              color: Colors.green,
              textColor: Colors.white,
            ),

            const SizedBox(width: 8),

            // ✅ Status badge - offline (auto theme color)
            SmartBadge(
              label: "Offline",
              color: theme.brightness == Brightness.dark
                  ? Colors.grey.shade700
                  : Colors.grey.shade300,
              textColor: theme.brightness == Brightness.dark
                  ? Colors.white70
                  : Colors.black87,
            ),

            const SizedBox(width: 8),

            // ✅ Premium / Pro user badge
            SmartBadge(
              label: "PRO",
              color: scheme.primary,
              textColor: scheme.onPrimary,
              fontSize: 11,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            ),

            const SizedBox(width: 8),

            // ✅ Notification icon with badge
            Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.notifications, size: 36, color: Colors.orange),

                // Notification count badge
                Positioned(
                  top: -4,
                  right: -4,
                  child: SmartBadge(
                    label: "5",
                    color: Colors.redAccent,
                    textColor: Colors.white,
                    fontSize: 10,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    radius: 8,
                    minWidth: 20,
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
