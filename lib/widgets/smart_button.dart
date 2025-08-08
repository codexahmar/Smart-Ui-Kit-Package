import 'package:flutter/material.dart';

/// A fully customizable alternate Smart Button.
class SmartButtonAlt extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;

  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;

  final double borderRadius;
  final double fontSize;
  final double elevation;
  final bool isOutlined;
  final EdgeInsetsGeometry padding;
  final double? height;
  final double? width;

  const SmartButtonAlt({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius = 12,
    this.fontSize = 16,
    this.elevation = 2.0,
    this.isOutlined = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final Color defaultBg = theme.colorScheme.primary;
    final Color defaultFg = theme.colorScheme.onPrimary;
    final Color defaultBorder = defaultBg;

    final Color resolvedBg = backgroundColor ?? defaultBg;
    final Color resolvedFg = textColor ?? defaultFg;
    final Color resolvedBorder = borderColor ?? defaultBorder;

    return Material(
      color: Colors.transparent,
      elevation: elevation,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          height: height,
          width: width,
          padding: padding,
          decoration: BoxDecoration(
            color: isOutlined
                ? theme.colorScheme.surface.withValues(alpha: 0.02)
                : resolvedBg,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: isOutlined ? resolvedBorder : Colors.transparent,
              width: isOutlined ? 1.5 : 0,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[icon!, const SizedBox(width: 8)],
              Text(
                label,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                  color: isOutlined ? resolvedBorder : resolvedFg,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
