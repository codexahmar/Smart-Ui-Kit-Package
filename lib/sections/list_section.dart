import 'package:flutter/material.dart';
import 'package:smart_ui/utils/smart_theme.dart';
import 'package:smart_ui/widgets/smart_section.dart';
import 'package:smart_ui/widgets/smart_card.dart';

class ListSection extends StatelessWidget {
  const ListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartSection(
      title: "List",
      description: "Cards in scrollable list.",
      children: [
        Column(
          children: const [
            SmartCard(
              title: "List Item 1",
              icon: Icons.list,
              level: SmartLevel.info,
              variant: SmartCardVariant.compact,
            ),
            SmartCard(
              title: "List Item 2",
              icon: Icons.list_alt,
              level: SmartLevel.success,
              variant: SmartCardVariant.expanded,
            ),
            SmartCard(
              title: "List Item 3",
              icon: Icons.list_sharp,
              level: SmartLevel.warning,
              variant: SmartCardVariant.media,
            ),
          ],
        ),
      ],
    );
  }
}
