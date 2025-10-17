import 'package:flutter/material.dart';

/// A fully customizable tappable tile with leading, title, subtitle, and trailing widgets.
class SmartTile extends StatelessWidget {
  final Widget? leading;
  final IconData? icon;
  final double iconSize;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  final EdgeInsetsGeometry padding;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final double elevation;
  final List<BoxShadow>? boxShadow;

  const SmartTile({
    super.key,
    this.leading,
    this.icon,
    this.iconSize = 28,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.backgroundColor,
    this.iconColor,
    this.textColor,
    this.titleStyle,
    this.subtitleStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.border,
    this.elevation = 0,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color bg = backgroundColor ?? theme.cardColor;
    final Color ic = iconColor ?? theme.colorScheme.primary;
    final Color tx =
        textColor ?? theme.textTheme.bodyLarge?.color ?? Colors.black;

    final Widget? resolvedLeading =
        leading ??
        (icon != null ? Icon(icon, color: ic, size: iconSize) : null);

    return Material(
      color: bg,
      elevation: elevation,
      borderRadius: borderRadius,
      shadowColor: Colors.black12,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            border: border,
            boxShadow: boxShadow,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (resolvedLeading != null) ...[
                resolvedLeading,
                const SizedBox(width: 12),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:
                          titleStyle ??
                          TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: tx,
                          ),
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        style:
                            subtitleStyle ??
                            TextStyle(fontSize: 13, color: tx.withOpacity(0.7)),
                      ),
                  ],
                ),
              ),
              if (trailing != null) ...[const SizedBox(width: 12), trailing!],
            ],
          ),
        ),
      ),
    );
  }
}
