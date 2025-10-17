import 'package:flutter/material.dart';

class SmartChip extends StatelessWidget {
  /// Required label shown on the chip.
  final String label;

  /// Whether the chip is currently selected.
  final bool selected;

  /// Whether the chip is enabled.
  final bool isEnabled;

  /// Called when the chip is tapped (fallback if `onSelected` is not provided).
  final VoidCallback? onTap;

  /// Called when the chip selection changes (primary interaction).
  final ValueChanged<bool>? onSelected;

  /// Optional delete callback (if shown).
  final VoidCallback? onDeleted;

  /// Background color of the chip (when not selected).
  final Color? backgroundColor;

  /// Background color when selected.
  final Color? selectedColor;

  /// Color when chip is disabled.
  final Color? disabledColor;

  /// Text color of the label.
  final Color? textColor;

  /// Custom label style (overrides [textColor] if given).
  final TextStyle? labelStyle;

  /// Leading avatar/icon inside the chip.
  final Widget? avatar;

  /// Optional delete icon (if `onDeleted` is provided).
  final Icon? deleteIcon;

  /// Custom internal padding.
  final EdgeInsetsGeometry? padding;

  /// Optional border.
  final BorderSide? border;

  /// Elevation for shadow.
  final double elevation;

  /// Custom shape of the chip.
  final OutlinedBorder? shape;

  /// Use [FilterChip] if true, else uses [ChoiceChip].
  final bool useFilterChip;

  /// Optional tooltip.
  final String? tooltip;

  /// Show checkmark (only applies to [FilterChip]).
  final bool showCheckmark;

  const SmartChip({
    super.key,
    required this.label,
    this.selected = false,
    this.isEnabled = true,
    this.onTap,
    this.onSelected,
    this.onDeleted,
    this.backgroundColor,
    this.selectedColor,
    this.disabledColor,
    this.textColor,
    this.labelStyle,
    this.avatar,
    this.deleteIcon,
    this.padding,
    this.border,
    this.elevation = 0,
    this.shape,
    this.useFilterChip = false,
    this.tooltip,
    this.showCheckmark = true,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveTextColor =
        textColor ?? Theme.of(context).colorScheme.onSurface;
    final TextStyle effectiveLabelStyle =
        labelStyle ?? TextStyle(color: effectiveTextColor);

    final MaterialTapTargetSize targetSize = MaterialTapTargetSize.shrinkWrap;

    final chip =
        useFilterChip
            ? FilterChip(
              label: Text(label, style: effectiveLabelStyle),
              selected: selected,
              onSelected:
                  onSelected ??
                  (value) {
                    if (value) onTap?.call();
                  },

              avatar: avatar,
              deleteIcon: deleteIcon,
              onDeleted: onDeleted,
              selectedColor:
                  selectedColor ?? Theme.of(context).colorScheme.primary,
              backgroundColor:
                  backgroundColor ??
                  Theme.of(context).chipTheme.backgroundColor,
              disabledColor: disabledColor ?? Colors.grey.shade300,
              padding:
                  padding ??
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: shape ?? StadiumBorder(side: border ?? BorderSide.none),
              elevation: elevation,
              materialTapTargetSize: targetSize,
              showCheckmark: showCheckmark,
            )
            : ChoiceChip(
              label: Text(label, style: effectiveLabelStyle),
              selected: selected,
              onSelected:
                  isEnabled
                      ? (value) {
                        if (onSelected != null) {
                          onSelected!(value);
                        } else if (value) {
                          onTap?.call();
                        }
                      }
                      : null,

              avatar: avatar,
              selectedColor:
                  selectedColor ?? Theme.of(context).colorScheme.primary,
              backgroundColor:
                  backgroundColor ??
                  Theme.of(context).chipTheme.backgroundColor,
              disabledColor: disabledColor ?? Colors.grey.shade300,
              padding:
                  padding ??
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: shape ?? StadiumBorder(side: border ?? BorderSide.none),
              elevation: elevation,
              materialTapTargetSize: targetSize,
            );

    return tooltip != null ? Tooltip(message: tooltip!, child: chip) : chip;
  }
}
