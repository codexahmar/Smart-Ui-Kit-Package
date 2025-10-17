import 'package:flutter/material.dart';

/// A customizable badge for notifications, status, or labels.
/// Can be used with or without a label (dot badge).
class SmartBadge extends StatelessWidget {
  final String? label;
  final Color? color;
  final Color? textColor;
  final double radius;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final double? dotSize;
  final Border? border;

  const SmartBadge({
    super.key,
    this.label,
    this.color,
    this.textColor,
    this.radius = 10,
    this.fontSize,
    this.padding,
    this.dotSize = 10,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color bg = color ?? theme.colorScheme.secondary;
    final Color fg = textColor ?? theme.colorScheme.onSecondary;

    // Dot badge (no label)
    if (label == null || label!.isEmpty) {
      return Container(
        width: dotSize,
        height: dotSize,
        decoration: BoxDecoration(
          color: bg,
          shape: BoxShape.circle,
          border: border,
        ),
      );
    }

    // Text badge
    return Container(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(radius),
        border: border,
      ),
      child: Text(
        label!,
        style: TextStyle(
          color: fg,
          fontSize: fontSize ?? 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
