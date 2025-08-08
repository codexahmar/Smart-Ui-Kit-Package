import 'package:flutter/material.dart';

/// A fully customizable tile with leading, title, subtitle, and trailing widgets.
class SmartTile extends StatelessWidget {
  final Widget? leading;
  final IconData? icon;
  final double iconSize;

  final String title;
  final String? subtitle;

  final Widget? trailing;

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final Color? splashColor;
  final Color? highlightColor;

  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  final EdgeInsetsGeometry padding;
  final double spacing;
  final double trailingSpacing;

  final BorderRadiusGeometry borderRadius;

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
    this.onLongPress,
    this.backgroundColor,
    this.iconColor,
    this.textColor,
    this.splashColor,
    this.highlightColor,
    this.titleStyle,
    this.subtitleStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.spacing = 12,
    this.trailingSpacing = 12,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.border,
    this.elevation = 0,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final Color bg = backgroundColor ?? theme.cardColor;
    final Color iconClr = iconColor ?? theme.colorScheme.primary;
    final Color defaultTextColor =
        textColor ??
        theme.textTheme.bodyLarge?.color ??
        (isDark ? Colors.white : Colors.black87);

    final resolvedLeading =
        leading ??
        (icon != null ? Icon(icon, color: iconClr, size: iconSize) : null);

    return Material(
      color: bg,
      elevation: elevation,
      borderRadius: borderRadius,
      shadowColor: Colors.black12,
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,

        splashColor: splashColor ?? theme.splashColor,
        highlightColor: highlightColor ?? theme.highlightColor,
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
                SizedBox(width: spacing),
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
                            color: defaultTextColor,
                          ),
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        style:
                            subtitleStyle ??
                            TextStyle(
                              fontSize: 13,
                              color: defaultTextColor.withValues(alpha: 0.7),
                            ),
                      ),
                  ],
                ),
              ),
              if (trailing != null) ...[
                SizedBox(width: trailingSpacing),
                trailing!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
