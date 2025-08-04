import 'package:flutter/material.dart';

class SmartSnackbar {
  static void show(
    BuildContext context, {
    required String message,
    String? actionLabel,
    VoidCallback? onActionPressed,
    Duration duration = const Duration(seconds: 3),

    // Content customization
    int? textMaxLines,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
    Widget? leading,
    IconData? icon,
    Color? iconColor,

    // Snackbar styling
    Color backgroundColor = Colors.black87,
    Color textColor = Colors.white,
    TextStyle? textStyle,
    double elevation = 6.0,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(12)),
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    EdgeInsetsGeometry margin = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ),
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    MainAxisAlignment contentAlignment = MainAxisAlignment.start,

    // Action styling
    Color? actionTextColor,
    TextStyle? actionStyle,

    // Control
    bool dismissible = true,
    VoidCallback? onDismissed,
  }) {
    final theme = Theme.of(context);

    final snackBarContent = Row(
      mainAxisAlignment: contentAlignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leading != null) ...[
          leading,
          const SizedBox(width: 8),
        ] else if (icon != null) ...[
          Icon(icon, color: iconColor ?? textColor, size: 20),
          const SizedBox(width: 8),
        ],
        Expanded(
          child: Text(
            message,
            maxLines: textMaxLines,
            textAlign: textAlign,
            overflow: overflow,
            style: textStyle ?? TextStyle(color: textColor, fontSize: 14),
          ),
        ),
      ],
    );

    final snackBar = SnackBar(
      content: snackBarContent,
      duration: duration,
      backgroundColor: backgroundColor,
      elevation: elevation,
      margin: behavior == SnackBarBehavior.floating ? margin : null,
      padding: padding,
      behavior: behavior,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      action:
          actionLabel != null
              ? SnackBarAction(
                label: actionLabel,
                textColor: actionTextColor ?? theme.colorScheme.secondary,
                onPressed: onActionPressed ?? () {},
              )
              : null,
    );

    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar(); // Prevent stacking
    messenger.showSnackBar(snackBar).closed.then((_) {
      if (onDismissed != null) onDismissed();
    });
  }
}
