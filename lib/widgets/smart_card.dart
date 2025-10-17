// lib/widgets/smart_card.dart
import 'package:flutter/material.dart';
import 'package:smart_ui/utils/smart_theme.dart';

enum SmartCardVariant { compact, expanded, media }

enum SmartCardLayout { card, tile, compact }

class SmartCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final SmartLevel level;
  final String? actionText;
  final VoidCallback? onActionPressed;
  final SmartCardVariant variant;
  final SmartCardLayout layout;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final double? borderRadius;
  final List<BoxShadow>? boxShadow;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  const SmartCard({
    super.key,
    required this.title,
    this.icon,
    this.subtitle,
    this.level = SmartLevel.info,
    this.actionText,
    this.onActionPressed,
    this.variant = SmartCardVariant.expanded,
    this.layout = SmartCardLayout.card,
    this.onTap,
    this.onLongPress,
    this.backgroundColor,
    this.iconColor,
    this.textColor,
    this.borderRadius,
    this.boxShadow,
    this.padding = const EdgeInsets.all(16),
    this.margin = const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
  });

  Widget _buildContent(Color textColor, Color iconColor) {
    TextStyle titleStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: textColor,
    );

    TextStyle subtitleStyle = TextStyle(
      fontSize: 14,
      color: textColor.withOpacity(0.8),
    );

    Widget actionButton() {
      return (actionText != null && onActionPressed != null)
          ? ElevatedButton(
            onPressed: onActionPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: iconColor,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
            child: Text(actionText!),
          )
          : const SizedBox.shrink();
    }

    final IconData iconToShow = icon ?? SmartTheme.defaultIcon(level);

    switch (variant) {
      case SmartCardVariant.compact:
        return Row(
          children: [
            Icon(iconToShow, size: 30, color: iconColor),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 16, color: textColor),
              ),
            ),
          ],
        );

      case SmartCardVariant.media:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: titleStyle),
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(subtitle!, style: subtitleStyle),
              ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(iconToShow, size: 40, color: iconColor),
                const Spacer(),
                actionButton(),
              ],
            ),
          ],
        );

      case SmartCardVariant.expanded:
      default:
        return Row(
          children: [
            Icon(iconToShow, size: 40, color: iconColor),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: titleStyle),
                  if (subtitle != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(subtitle!, style: subtitleStyle),
                    ),
                  if (actionText != null && onActionPressed != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: actionButton(),
                    ),
                ],
              ),
            ),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final brightness = theme.brightness;

    final bgColor =
        backgroundColor ?? SmartTheme.backgroundColor(level, brightness);
    final icColor = iconColor ?? SmartTheme.iconColor(level);
    final txColor = textColor ?? SmartTheme.textColor(level, brightness);

    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
          boxShadow:
              boxShadow ??
              [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
        ),
        child: _buildContent(txColor, icColor),
      ),
    );
  }
}
