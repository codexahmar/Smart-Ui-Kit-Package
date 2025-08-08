import 'package:flutter/material.dart';

/// A highly customizable badge for notifications, status, or labels.
/// Works as both a dot badge or a labeled badge depending on [label].
class SmartBadge extends StatelessWidget {
  /// Optional label text. If null or empty, a dot badge is shown.
  final String? label;

  /// Background color of the badge.
  final Color? color;

  /// Text color for the label badge.
  final Color? textColor;

  /// Optional text style override (applies only to label).
  final TextStyle? textStyle;

  /// Border radius for label badge.
  final double radius;

  /// Optional font size override.
  final double? fontSize;

  /// Padding inside label badge.
  final EdgeInsetsGeometry? padding;

  /// Size for the dot badge (if [label] is null).
  final double dotSize;

  /// Optional border for both label and dot.
  final Border? border;

  /// Optional minimum width for label badge.
  final double? minWidth;

  /// Optional shape override.
  final BoxShape shape;

  const SmartBadge({
    super.key,
    this.label,
    this.color,
    this.textColor,
    this.textStyle,
    this.radius = 10,
    this.fontSize,
    this.padding,
    this.dotSize = 10,
    this.border,
    this.minWidth,
    this.shape = BoxShape.rectangle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final Color defaultBg =
        color ?? theme.colorScheme.secondary.withValues(alpha: 0.9);
    final Color defaultFg = textColor ?? theme.colorScheme.onSecondary;

    final bool isDot = label == null || label!.trim().isEmpty;

    if (isDot) {
      return Container(
        width: dotSize,
        height: dotSize,
        decoration: BoxDecoration(
          color: defaultBg,
          shape: BoxShape.circle,
          border: border,
        ),
      );
    }

    final style =
        textStyle ??
        TextStyle(
          color: defaultFg,
          fontSize: fontSize ?? 12,
          fontWeight: FontWeight.w600,
        );

    return Container(
      constraints: minWidth != null
          ? BoxConstraints(minWidth: minWidth!)
          : const BoxConstraints(),
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: defaultBg,
        shape: shape,
        border: border,
        borderRadius: shape == BoxShape.rectangle
            ? BorderRadius.circular(radius)
            : null,
      ),
      child: Text(label!, style: style, textAlign: TextAlign.center),
    );
  }
}
