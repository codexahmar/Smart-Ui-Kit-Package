import 'package:flutter/material.dart';
import 'package:smart_ui/widgets/smart_chip.dart';
import 'package:smart_ui/widgets/smart_section.dart';

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
            // Flutter Chip
            SmartChip(
              label: "Flutter",
              selected: _selectedTags.contains("Flutter"),
              onSelected: (_) => _toggle("Flutter"),

              backgroundColor: Colors.teal,
              selectedColor: const Color(0xFF0288D1),
              textColor: Colors.white,
              border: BorderSide(color: Colors.teal.shade100),
              elevation: 2,
              tooltip: "Flutter framework",
            ),

            // React Chip
            SmartChip(
              label: "React",
              selected: _selectedTags.contains("React"),
              onSelected: (_) => _toggle("React"),
              deleteIcon: const Icon(Icons.close, size: 16),
              onDeleted: () => debugPrint("React tag removed"),
              backgroundColor: const Color(0xFFE3F2FD),
              selectedColor: const Color(0xFF2196F3),
              textColor: const Color(0xFF0D47A1),
              border: const BorderSide(color: Color(0xFF90CAF9)),
              tooltip: "React.js tag",
              elevation: 2,
            ),

            // Design Chip
            SmartChip(
              label: "Design",

              selected: _selectedTags.contains("Design"),
              onSelected: (_) => _toggle("Design"),
              backgroundColor: Colors.amber,
              selectedColor: const Color(0xFFBA68C8),
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 3,
              tooltip: "UI/UX Design tag",
            ),
          ],
        ),
      ],
    );
  }
}
