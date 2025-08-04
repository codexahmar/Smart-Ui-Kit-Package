import 'package:flutter/material.dart';

class SmartToast {
  static void show(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 2),
    Color backgroundColor = Colors.black87,
    Color textColor = Colors.white,
    TextStyle? textStyle,
    EdgeInsets padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(12)),
    IconData? icon,
    Color? iconColor,
    double? width,
    double bottomOffset = 80,
    double? topOffset,
    bool showAtTop = false,
    bool center = false,
    VoidCallback? onDismiss,
    List<BoxShadow>? boxShadow,
    Curve animationCurve = Curves.easeOut,
    Duration animationDuration = const Duration(milliseconds: 300),
  }) {
    final overlay = Overlay.of(context);
    final entry = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: 24,
          right: 24,
          top:
              showAtTop
                  ? topOffset ?? 80
                  : (center ? MediaQuery.of(context).size.height / 2 : null),
          bottom: showAtTop || center ? null : bottomOffset,
          child: AnimatedSlide(
            duration: animationDuration,
            curve: animationCurve,
            offset: const Offset(0, 0),
            child: AnimatedOpacity(
              duration: animationDuration,
              opacity: 1.0,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: width,
                  padding: padding,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: borderRadius,
                    boxShadow: boxShadow,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (icon != null)
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Icon(
                            icon,
                            color: iconColor ?? textColor,
                            size: 20,
                          ),
                        ),
                      Expanded(
                        child: Text(
                          message,
                          style:
                              textStyle ??
                              TextStyle(color: textColor, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    overlay.insert(entry);
    Future.delayed(duration, () {
      entry.remove();
      onDismiss?.call();
    });
  }
}
