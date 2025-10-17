import 'package:flutter/material.dart';

class SmartDialog {
  static Future<void> show({
    required BuildContext context,

    // Core Content
    String? title,
    Widget? titleWidget,
    Widget? content,
    Widget? customContent,
    Widget? icon,

    // Actions
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    String confirmText = "OK",
    String cancelText = "Cancel",
    bool showCancel = true,
    bool showConfirm = true,
    Widget? customConfirmButton,
    Widget? customCancelButton,
    Widget? customActionsArea,

    // Dialog Behavior
    bool barrierDismissible = true,
    bool scrollable = false,

    // Layout
    List<Widget>? actions,
    MainAxisAlignment actionsAlignment = MainAxisAlignment.end,
    EdgeInsetsGeometry? actionsPadding,
    EdgeInsetsGeometry? contentPadding,
    EdgeInsetsGeometry? titlePadding,
    ShapeBorder? shape,
    double elevation = 6,

    // Styles
    Color? backgroundColor,
    TextStyle? titleStyle,
    TextStyle? contentTextStyle,
    TextStyle? confirmTextStyle,
    TextStyle? cancelTextStyle,

    // bg color for default button
    Color? confirmButtonColor,
    Color? cancelButtonColor,
  }) {
    final theme = Theme.of(context);

    return showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (ctx) {
        return AlertDialog(
          elevation: elevation,
          shape:
              shape ??
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          backgroundColor: backgroundColor ?? theme.dialogTheme.backgroundColor,
          contentPadding:
              contentPadding ??
              const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          titlePadding:
              titlePadding ??
              const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 0),
          title:
              titleWidget ??
              (title != null
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (icon != null) ...[icon, const SizedBox(width: 8)],
                        Expanded(
                          child: Text(
                            title,
                            style: titleStyle ?? theme.textTheme.titleLarge,
                          ),
                        ),
                      ],
                    )
                  : null),
          content:
              customContent ??
              (content != null
                  ? DefaultTextStyle(
                      style:
                          contentTextStyle ??
                          theme.textTheme.bodyMedium!.copyWith(fontSize: 15),
                      child: scrollable
                          ? SingleChildScrollView(child: content)
                          : content,
                    )
                  : null),
          actions: customActionsArea != null
              ? [customActionsArea]
              : actions ??
                    [
                      if (showCancel)
                        customCancelButton ??
                            TextButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                                onCancel?.call();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: cancelButtonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                cancelText,
                                style:
                                    cancelTextStyle ??
                                    theme.textTheme.labelLarge!.copyWith(
                                      color: cancelButtonColor != null
                                          ? Colors.white
                                          : theme.colorScheme.secondary,
                                    ),
                              ),
                            ),

                      if (showConfirm)
                        customConfirmButton ??
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                                onConfirm?.call();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    confirmButtonColor ??
                                    theme.colorScheme.primary,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                confirmText,
                                style:
                                    confirmTextStyle ??
                                    theme.textTheme.labelLarge!.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                    ],
          actionsAlignment: actionsAlignment,
          actionsPadding:
              actionsPadding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        );
      },
    );
  }
}
