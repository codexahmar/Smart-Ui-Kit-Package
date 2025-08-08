import 'package:flutter/material.dart';
import 'package:smart_ui_kit/widgets/smart_button.dart';

enum SmartCardVariant { compact, expanded, media, simple, iconOnly }

enum SmartCardLayout { card, tile, compact, bordered, minimal }

class SmartCard extends StatefulWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;

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
        TextStyle(fontSize: 14, color: textColor.withValues(alpha: 0.7));

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

    final IconData iconToShow = widget.icon ?? Icons.info_outline;
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

      case SmartCardVariant.simple:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title, style: resolvedTitleStyle),
            if (widget.subtitle != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(widget.subtitle!, style: resolvedSubtitleStyle),
              ),
          ],
        );

      case SmartCardVariant.iconOnly:
        return Center(
          child: Icon(iconToShow, size: resolvedIconSize, color: iconColor),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final Color bgColor = widget.backgroundColor ?? theme.cardColor;
    final Color icColor = widget.iconColor ?? theme.colorScheme.primary;
    final Color txColor = widget.textColor ?? theme.textTheme.bodyLarge!.color!;

    List<BoxShadow>? resolvedBoxShadow;
    BoxBorder? resolvedBorder;

    switch (widget.layout) {
      case SmartCardLayout.card:
        resolvedBoxShadow =
            widget.boxShadow ??
            [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: widget.elevation ?? 10,
                offset: const Offset(0, 4),
              ),
            ];
        break;

      case SmartCardLayout.tile:
        resolvedBoxShadow = null;
        break;

      case SmartCardLayout.compact:
        resolvedBoxShadow = null;
        break;

      case SmartCardLayout.bordered:
        resolvedBorder = Border.all(
          color: widget.iconColor ?? theme.dividerColor,
          width: 1.2,
        );
        break;

      case SmartCardLayout.minimal:
        resolvedBoxShadow = null;
        resolvedBorder = null;
        break;
    }

    return GestureDetector(
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      child: Container(
        padding: widget.padding,
        margin: widget.margin,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 16),
          border: widget.border ?? resolvedBorder,
          boxShadow: resolvedBoxShadow,
        ),
        child: widget.child ?? _buildContent(txColor, icColor),
      ),
    );
  }
}
