import 'package:flutter/material.dart';

/// A fully customizable animated header widget.
class SmartHeader extends StatelessWidget {
  /// Default title text.
  final String? title;

  /// Default subtitle text.
  final String? subtitle;

  /// Optional custom title widget (overrides [title]).
  final Widget? customTitle;

  /// Optional custom subtitle widget (overrides [subtitle]).
  final Widget? customSubtitle;

  /// An optional action widget (e.g., icon, button).
  final Widget? action;

  /// Style for title if [customTitle] is not provided.
  final TextStyle? titleStyle;

  /// Style for subtitle if [customSubtitle] is not provided.
  final TextStyle? subtitleStyle;

  /// Optional padding around the header.
  final EdgeInsetsGeometry padding;

  /// Controls layout of the row: start, center, end.
  final MainAxisAlignment alignment;

  /// Whether to show the animation.
  final bool animate;

  /// Duration of the entrance animation.
  final Duration animationDuration;

  /// Space between title and subtitle.
  final double titleSubtitleSpacing;

  /// Space between left (title block) and right (action) widget.
  final double spacingBetween;

  const SmartHeader({
    super.key,
    this.title,
    this.subtitle,
    this.customTitle,
    this.customSubtitle,
    this.action,
    this.titleStyle,
    this.subtitleStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.alignment = MainAxisAlignment.spaceBetween,
    this.animate = true,
    this.animationDuration = const Duration(milliseconds: 500),
    this.titleSubtitleSpacing = 4,
    this.spacingBetween = 12,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget titleWidget =
        customTitle ??
        Text(
          title ?? '',
          style:
              titleStyle ??
              theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        );

    Widget? subtitleWidget =
        customSubtitle ??
        (subtitle != null
            ? Padding(
              padding: EdgeInsets.only(top: titleSubtitleSpacing),
              child: Text(
                subtitle!,
                style: subtitleStyle ?? theme.textTheme.bodyMedium,
              ),
            )
            : null);

    Widget content = Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: alignment,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleWidget,
                if (subtitleWidget != null) subtitleWidget,
              ],
            ),
          ),
          if (action != null) ...[SizedBox(width: spacingBetween), action!],
        ],
      ),
    );

    if (!animate) return content;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: animationDuration,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, (1 - value) * 16),
            child: child,
          ),
        );
      },
      child: content,
    );
  }
}
