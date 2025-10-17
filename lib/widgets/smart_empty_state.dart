import 'package:flutter/material.dart';

class SmartEmptyState extends StatelessWidget {
  final IconData? icon;
  final Widget? iconWidget; // For SVG, Lottie, etc. Optional.
  final String? title;
  final String? message;

  final TextStyle? titleStyle;
  final TextStyle? messageStyle;
  final double spacing;
  final Widget? action;
  final EdgeInsetsGeometry padding;
  final MainAxisAlignment alignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double iconSize;
  final Color? iconColor;

  const SmartEmptyState({
    super.key,
    this.icon,
    this.iconWidget,
    this.title,
    this.message,
    this.titleStyle,
    this.messageStyle,
    this.spacing = 16,
    this.action,
    this.padding = const EdgeInsets.all(24),
    this.alignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.iconSize = 64,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: padding,
      child: Column(
        mainAxisAlignment: alignment,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          if (iconWidget != null)
            iconWidget!
          else if (icon != null)
            Icon(icon, size: iconSize, color: iconColor ?? theme.disabledColor),

          if (title != null) ...[
            SizedBox(height: spacing),
            Text(
              title!,
              style:
                  titleStyle ??
                  theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
          ],

          if (message != null) ...[
            const SizedBox(height: 8),
            Text(
              message!,
              style: messageStyle ?? theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],

          if (action != null) ...[SizedBox(height: spacing), action!],
        ],
      ),
    );
  }
}
