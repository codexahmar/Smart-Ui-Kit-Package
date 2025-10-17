import 'package:flutter/material.dart';

import 'package:smart_ui_kit/smart_ui_kit.dart';

class SmartEmptyStateSection extends StatelessWidget {
  const SmartEmptyStateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartSection(
      title: "Smart Empty State",
      description: "Minimal yet powerful UI for empty screens or data.",
      children: [
        // Basic empty state with icon only
        const SmartEmptyState(
          icon: Icons.inbox,
          title: "No Messages",
          message: "You don’t have any messages yet. Come back later.",
        ),
        const SizedBox(height: 24),

        // SVG-based empty state
        // SmartEmptyState(
        //   iconWidget: SvgPicture.asset(
        //     'assets/illustrations/empty_box.svg',
        //     height: 120,
        //   ),
        //   title: "No Orders Found",
        //   message: "Looks like you haven’t placed any orders yet.",
        //   action: SmartButtonAlt(
        //     label: "Start Shopping",
        //     backgroundColor: Colors.deepPurple,
        //     textColor: Colors.white,
        //     onPressed: () => print("Redirect to shop"),
        //   ),
        // ),
        const SizedBox(height: 24),

        // Styled empty state with outlined action
        SmartEmptyState(
          icon: Icons.search_off,
          title: "Nothing Found",
          message: "We couldn’t find anything matching your search.",
          iconColor: Colors.orange,
          spacing: 12,
          titleStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          messageStyle: const TextStyle(color: Colors.black54),
          action: SmartButtonAlt(label: "Try Again", textColor: Colors.white),
        ),
        const SizedBox(height: 24),

        // No icon or SVG
        const SmartEmptyState(
          title: "You're All Caught Up!",
          message: "There’s nothing pending right now. Enjoy your day!",
        ),
      ],
    );
  }
}
