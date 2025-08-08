import 'package:flutter/material.dart';

class SmartModalBottomSheet {
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,

    // Title
    String? title,
    Widget? titleWidget,

    // Actions / Footer
    List<Widget>? actions,
    Widget? footer,
    MainAxisAlignment actionsAlignment = MainAxisAlignment.end,

    // Behavior
    bool isScrollControlled = true,
    bool useRootNavigator = true,
    bool enableDrag = true,
    bool showDragHandle = true,
    bool expand = false,
    bool useSafeArea = true,

    // Customization
    Color? backgroundColor,
    Color? barrierColor,
    double? elevation,
    ShapeBorder? shape,
    Clip clipBehavior = Clip.none,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? contentPadding,
    EdgeInsetsGeometry? actionsPadding,
    BoxConstraints? constraints,
    ScrollPhysics? scrollPhysics,
    Duration? animationDuration,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      useRootNavigator: useRootNavigator,
      isScrollControlled: isScrollControlled,
      enableDrag: enableDrag,
      backgroundColor: backgroundColor ?? Theme.of(context).canvasColor,
      elevation: elevation,
      barrierColor: barrierColor,
      clipBehavior: clipBehavior,
      shape:
          shape ??
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
      constraints: constraints,
      transitionAnimationController: animationDuration != null
          ? AnimationController(
              vsync: Navigator.of(context),
              duration: animationDuration,
            )
          : null,
      builder: (_) {
        final mediaQuery = MediaQuery.of(context);
        final bottomPadding = mediaQuery.viewInsets.bottom;

        final modalContent = Padding(
          padding:
              padding ??
              EdgeInsets.only(
                bottom: bottomPadding > 0 ? bottomPadding : 24,
                top: 16,
                left: 20,
                right: 20,
              ),
          child: Column(
            mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showDragHandle)
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),

              // Title section
              if (titleWidget != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: titleWidget,
                )
              else if (title != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              // Main content
              if (contentPadding != null)
                Padding(padding: contentPadding, child: child)
              else
                child,

              // Actions
              if (actions != null && actions.isNotEmpty)
                Padding(
                  padding:
                      actionsPadding ??
                      const EdgeInsets.only(top: 20, bottom: 12),
                  child: Row(
                    mainAxisAlignment: actionsAlignment,
                    children: actions,
                  ),
                ),

              // Footer (CTA section or anything)
              if (footer != null)
                Padding(padding: const EdgeInsets.only(top: 12), child: footer),
            ],
          ),
        );

        final contentWrapper = scrollPhysics != null
            ? SingleChildScrollView(physics: scrollPhysics, child: modalContent)
            : SingleChildScrollView(child: modalContent);

        return useSafeArea ? SafeArea(child: contentWrapper) : contentWrapper;
      },
    );
  }
}
