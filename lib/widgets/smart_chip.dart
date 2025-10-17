import 'package:flutter/material.dart';

/// A fully customizable SmartChip supporting both FilterChip and ChoiceChip behaviors.
class SmartChip extends StatelessWidget {
  final String label;
  final Widget? avatar;
  final bool isSelected;
  final bool isEnabled;
  final bool isFilterChip; // true = FilterChip, false = ChoiceChip
  final ValueChanged<bool>? onSelected;
  final VoidCallback? onTap;
  final Color? selectedColor;
  final Color? disabledColor;
  final Color? backgroundColor;
  final Color? selectedTextColor;
  final Color? textColor;
  final Color? borderColor;
  final double borderRadius;
  final double elevation;
  final EdgeInsets padding;
  final TextStyle? textStyle;

  const SmartChip({
    Key? key,
    required this.label,
    this.avatar,
    this.isSelected = false,
    this.isEnabled = true,
    this.isFilterChip = true,
    this.onSelected,
    this.onTap,
    this.selectedColor,
    this.disabledColor,
    this.backgroundColor,
    this.selectedTextColor,
    this.textColor,
    this.borderColor,
    this.borderRadius = 16.0,
    this.elevation = 0.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chipLabel = Text(
      label,
      style:
          textStyle ??
          TextStyle(
            color:
                isSelected
                    ? selectedTextColor ?? Colors.white
                    : textColor ?? Colors.black,
          ),
    );

    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      side: BorderSide(color: borderColor ?? Colors.transparent),
    );

    if (isFilterChip) {
      return FilterChip(
        label: chipLabel,
        avatar: avatar,
        selected: isSelected,
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
        backgroundColor: backgroundColor,
        selectedColor: selectedColor,
        disabledColor: disabledColor,
        elevation: elevation,
        shape: shape,
        padding: padding,
        labelStyle: textStyle,
        checkmarkColor: selectedTextColor,
      );
    } else {
      return ChoiceChip(
        label: chipLabel,
        avatar: avatar,
        selected: isSelected,
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
        backgroundColor: backgroundColor,
        selectedColor: selectedColor,
        disabledColor: disabledColor,
        elevation: elevation,
        shape: shape,
        padding: padding,
        labelStyle: textStyle,
      );
    }
  }
}
