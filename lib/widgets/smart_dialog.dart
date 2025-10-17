import 'package:flutter/material.dart';

class SmartDialog {
  static Future<void> show({
    required BuildContext context,

    // Core
    String? title,
    Widget? content,
    Widget? icon,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,

    // Text
    String confirmText = "OK",
    String cancelText = "Cancel",

    // Flags
    bool showCancel = true,
    bool showConfirm = true,
    bool barrierDismissible = true,
    bool scrollable = false,

    // Layouts
    List<Widget>? actions,
    MainAxisAlignment actionsAlignment = MainAxisAlignment.end,
    EdgeInsetsGeometry? actionsPadding,
    EdgeInsetsGeometry? contentPadding,
    ShapeBorder? shape,
    double elevation = 6,

    // Styles
    Color? backgroundColor,
    TextStyle? titleStyle,
    TextStyle? contentTextStyle,
    TextStyle? confirmTextStyle,
    TextStyle? cancelTextStyle,

    // Fully custom buttons
    Widget? customConfirmButton,
    Widget? customCancelButton,
  }) {
    final ThemeData theme = Theme.of(context);

    return showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (ctx) {
        return AlertDialog(
          shape:
              shape ??
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: elevation,
          backgroundColor: backgroundColor ?? theme.dialogBackgroundColor,
          contentPadding:
              contentPadding ??
              const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          title:
              title != null
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
                  : null,
          content:
              content != null
                  ? DefaultTextStyle(
                    style:
                        contentTextStyle ??
                        theme.textTheme.bodyMedium!.copyWith(fontSize: 15),
                    child:
                        scrollable
                            ? SingleChildScrollView(child: content)
                            : content,
                  )
                  : null,
          actions:
              actions ??
              [
                if (showCancel)
                  customCancelButton ??
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                          onCancel?.call();
                        },
                        child: Text(
                          cancelText,
                          style:
                              cancelTextStyle ??
                              theme.textTheme.labelLarge!.copyWith(
                                color: theme.colorScheme.secondary,
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
                          backgroundColor: theme.colorScheme.primary,
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
