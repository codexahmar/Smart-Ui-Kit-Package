import 'package:flutter/material.dart';

import 'package:smart_ui_kit/smart_ui_kit.dart';

class SmartChipSection extends StatefulWidget {
  const SmartChipSection({super.key});

  @override
  State<SmartChipSection> createState() => _SmartChipSectionState();
}

class _SmartChipSectionState extends State<SmartChipSection> {
  final Set<String> _selectedTags = {"All"};

  void _toggle(String label) {
    setState(() {
      if (_selectedTags.contains(label)) {
        _selectedTags.remove(label);
      } else {
        _selectedTags.add(label);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SmartSection(
      title: "Smart Chips / Tags",
      description: "Customizable tags for filters, categories, and actions.",
      children: [
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            // Flutter Chip (FilterChip)
            SmartChip(
              label: "Flutter",
              isSelected: _selectedTags.contains("Flutter"),
              onSelected: (_) => _toggle("Flutter"),
              backgroundColor: Colors.teal,
              selectedColor: Colors.orange,
              selectedTextColor: Colors.white,
              textColor: Colors.white,

              elevation: 2,
              isFilterChip: true,
            ),

            // React Chip (ChoiceChip)
            SmartChip(
              label: "React",
              isSelected: _selectedTags.contains("React"),
              onSelected: (_) => _toggle("React"),
              backgroundColor: const Color(0xFFE3F2FD),
              selectedColor: const Color(0xFF2196F3),
              selectedTextColor: Colors.white,
              textColor: const Color(0xFF0D47A1),

              elevation: 2,
              isFilterChip: false, // Shows how it works as a ChoiceChip
            ),

            // Design Chip (with custom shape via borderRadius)
            SmartChip(
              label: "UI/UX",
              isSelected: _selectedTags.contains("Design"),
              onSelected: (_) => _toggle("Design"),
              backgroundColor: Colors.amber,
              selectedColor: const Color(0xFFBA68C8),
              selectedTextColor: Colors.white,
              textColor: Colors.white,
              borderRadius: 8,
              elevation: 3,
              isFilterChip: true,
            ),
          ],
        ),
      ],
    );
  }
}
