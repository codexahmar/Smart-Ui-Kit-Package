import 'package:flutter/material.dart';
import 'package:smart_ui/utils/smart_theme.dart';
import 'package:smart_ui/widgets/smart_button.dart';


enum SmartCardVariant { compact, expanded, media }

enum SmartCardLayout { card, tile, compact }

class SmartCard extends StatefulWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final SmartLevel level;

  final String? actionText;
  final VoidCallback? onActionPressed;
  final Widget Function(BuildContext context)? actionBuilder;

  final SmartCardVariant variant;
  final SmartCardLayout layout;

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;

  final double? borderRadius;
  final double? iconSize;
  final double? elevation;

  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;

  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  final Widget? child;

  const SmartCard({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.level = SmartLevel.info,
    this.actionText,
    this.onActionPressed,
    this.actionBuilder,
    this.variant = SmartCardVariant.expanded,
    this.layout = SmartCardLayout.card,
    this.onTap,
    this.onLongPress,
    this.backgroundColor,
    this.iconColor,
    this.textColor,
    this.borderRadius,
    this.iconSize,
    this.elevation,
    this.border,
    this.boxShadow,
    this.padding = const EdgeInsets.all(16),
    this.margin = const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    this.titleStyle,
    this.subtitleStyle,
    this.child,
  });

  @override
  State<SmartCard> createState() => _SmartCardState();
}

class _SmartCardState extends State<SmartCard> {
  Widget _buildContent(Color textColor, Color iconColor) {
    final TextStyle resolvedTitleStyle =
        widget.titleStyle ??
        TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor);

    final TextStyle resolvedSubtitleStyle =
        widget.subtitleStyle ??
        TextStyle(fontSize: 14, color: textColor.withOpacity(0.75));

    Widget buildActionButton() {
      if (widget.actionBuilder != null) return widget.actionBuilder!(context);

      if (widget.actionText != null && widget.onActionPressed != null) {
        return SmartButtonAlt(
          label: widget.actionText!,
          onPressed: widget.onActionPressed,
          backgroundColor: iconColor,
          textColor: Colors.white,
          borderRadius: 8,
          fontSize: 14,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        );
      }

      return const SizedBox.shrink();
    }

    final IconData iconToShow =
        widget.icon ?? SmartTheme.defaultIcon(widget.level);
    final double resolvedIconSize = widget.iconSize ?? 40;

    switch (widget.variant) {
      case SmartCardVariant.compact:
        return Row(
          children: [
            Icon(iconToShow, size: 30, color: iconColor),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 16, color: textColor),
              ),
            ),
          ],
        );

      case SmartCardVariant.media:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title, style: resolvedTitleStyle),
            if (widget.subtitle != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(widget.subtitle!, style: resolvedSubtitleStyle),
              ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(iconToShow, size: resolvedIconSize, color: iconColor),
                const Spacer(),
                buildActionButton(),
              ],
            ),
          ],
        );

      case SmartCardVariant.expanded:
      default:
        return Row(
          children: [
            Icon(iconToShow, size: resolvedIconSize, color: iconColor),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title, style: resolvedTitleStyle),
                  if (widget.subtitle != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        widget.subtitle!,
                        style: resolvedSubtitleStyle,
                      ),
                    ),
                  if (widget.actionText != null &&
                      widget.onActionPressed != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: buildActionButton(),
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

    final Color bgColor =
        widget.backgroundColor ??
        SmartTheme.backgroundColor(widget.level, brightness);
    final Color icColor =
        widget.iconColor ?? SmartTheme.iconColor(widget.level);
    final Color txColor =
        widget.textColor ?? SmartTheme.textColor(widget.level, brightness);

    return GestureDetector(
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      child: Container(
        padding: widget.padding,
        margin: widget.margin,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 16),
          border: widget.border,
          boxShadow:
              widget.boxShadow ??
              [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: widget.elevation ?? 10,
                  offset: const Offset(0, 4),
                ),
              ],
        ),
        child: widget.child ?? _buildContent(txColor, icColor),
      ),
    );
  }
}
