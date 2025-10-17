import 'package:flutter/material.dart';

enum ToastPosition { top, bottom, center, custom }

class SmartToast {
  static void show(
    BuildContext context, {
    required String message,

    // Text
    TextStyle? textStyle,
    Color? textColor,

    // Background & Styling
    Color? backgroundColor,
    BorderRadiusGeometry borderRadius = const BorderRadius.all(
      Radius.circular(12),
    ),
    List<BoxShadow>? boxShadow,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    double? width,
    double? height,
    ShapeBorder? shape,

    // Icons
    Widget? leading,
    Widget? trailing,
    IconData? icon,
    Color? iconColor,
    double iconSize = 20,

    // Timing
    Duration duration = const Duration(seconds: 2),

    // Positioning
    ToastPosition position = ToastPosition.bottom,
    double topOffset = 80,
    double bottomOffset = 80,
    double customOffset = 200,
    bool tapToDismiss = true,

    // Callbacks
    VoidCallback? onDismiss,
    VoidCallback? onTap,
  }) {
    final overlay = Overlay.of(context);
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    // Use theme defaults if not provided
    final Color finalBackgroundColor =
        backgroundColor ?? theme.colorScheme.surfaceContainerHighest;
    final Color finalTextColor = textColor ?? theme.colorScheme.onSurface;

    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) {
        // Toast content
        Widget toastContent = GestureDetector(
          onTap: () {
            if (tapToDismiss) entry.remove();
            onTap?.call();
          },
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: width,
              height: height,
              padding: padding,
              decoration:
                  shape != null
                      ? ShapeDecoration(
                        color: finalBackgroundColor,
                        shape: shape,
                        shadows: boxShadow,
                      )
                      : BoxDecoration(
                        color: finalBackgroundColor,
                        borderRadius: borderRadius,
                        boxShadow: boxShadow,
                      ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (leading != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: leading,
                    )
                  else if (icon != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(
                        icon,
                        color: iconColor ?? finalTextColor,
                        size: iconSize,
                      ),
                    ),
                  Expanded(
                    child: Text(
                      message,
                      style:
                          textStyle ??
                          theme.textTheme.bodyMedium?.copyWith(
                            color: finalTextColor,
                          ),
                    ),
                  ),
                  if (trailing != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: trailing,
                    ),
                ],
              ),
            ),
          ),
        );

        // Positioning logic
        double? top, bottom;
        switch (position) {
          case ToastPosition.top:
            top = topOffset;
            break;
          case ToastPosition.center:
            top = screenSize.height / 2;
            break;
          case ToastPosition.custom:
            top = customOffset;
            break;
          case ToastPosition.bottom:
            bottom = bottomOffset;
        }

        return Positioned(
          left: 24,
          right: 24,
          top: top,
          bottom: bottom,
          child: toastContent,
        );
      },
    );

    // Show and remove
    overlay.insert(entry);
    Future.delayed(duration, () {
      if (entry.mounted) {
        entry.remove();
        onDismiss?.call();
      }
    });
  }
}
