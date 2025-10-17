import 'package:flutter/material.dart';

/// A section widget that groups SmartCards with a header and optional description.
class SmartSection extends StatelessWidget {
  final String title;
  final String? description;
  final List<Widget> children;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry cardSpacing;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final Color? backgroundColor;

  const SmartSection({
    super.key,
    required this.title,
    required this.children,
    this.description,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.cardSpacing = const EdgeInsets.symmetric(vertical: 4),
    this.titleStyle,
    this.descriptionStyle,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: backgroundColor ?? theme.cardColor.withOpacity(0.04),
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                titleStyle ??
                theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          if (description != null)
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 8),
              child: Text(
                description!,
                style: descriptionStyle ?? theme.textTheme.bodyMedium,
              ),
            ),
          ...children
              .expand((w) => [w, SizedBox(height: cardSpacing.vertical / 2)])
              .toList()
            ..removeLast(),
        ],
      ),
    );
  }
}
