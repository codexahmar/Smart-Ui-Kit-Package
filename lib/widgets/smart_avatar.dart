import 'package:flutter/material.dart';

/// A fully customizable avatar widget with support for:
/// - Circular/rounded shape
/// - Network/local image
/// - Status indicator
/// - Border, fallback, gesture
class SmartAvatar extends StatelessWidget {
  final double size;
  final String? imageUrl;
  final ImageProvider? imageProvider;
  final BoxFit fit;
  final bool isCircular;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderWidth;
  final VoidCallback? onTap;
  final bool showStatus;
  final Color? statusColor;
  final double statusSize;
  final Widget? fallbackIcon;

  const SmartAvatar({
    super.key,
    this.imageUrl,
    this.imageProvider,
    this.size = 56,
    this.fit = BoxFit.cover,
    this.isCircular = true,
    this.borderRadius = 12,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 1,
    this.onTap,
    this.showStatus = false,
    this.statusColor,
    this.statusSize = 12,
    this.fallbackIcon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color bg = backgroundColor ?? theme.colorScheme.surfaceContainerHighest;
    final Color border = borderColor ?? theme.dividerColor;

    final radius = isCircular ? size / 2 : borderRadius;

    final ImageProvider image =
        imageProvider ??
        (imageUrl != null
            ? NetworkImage(imageUrl!)
            : const AssetImage('assets/images/avatar_placeholder.png'));

    Widget avatarImage = ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image(
        image: image,
        width: size,
        height: size,
        fit: fit,
        errorBuilder:
            (_, __, ___) => Container(
              width: size,
              height: size,
              color: bg,
              alignment: Alignment.center,
              child:
                  fallbackIcon ??
                  Icon(
                    Icons.person,
                    color: theme.colorScheme.onSurface.withOpacity(0.6),
                    size: size * 0.5,
                  ),
            ),
      ),
    );

    Widget avatar = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bg,
        shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircular ? null : BorderRadius.circular(borderRadius),
        border: Border.all(color: border, width: borderWidth),
      ),
      child: avatarImage,
    );

    if (onTap != null) {
      avatar = GestureDetector(onTap: onTap, child: avatar);
    }

    // Optional status dot
    if (showStatus) {
      avatar = Stack(
        clipBehavior: Clip.none,
        children: [
          avatar,
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: statusSize,
              height: statusSize,
              decoration: BoxDecoration(
                color: statusColor ?? Colors.green,
                shape: BoxShape.circle,
                border: Border.all(
                  color: theme.scaffoldBackgroundColor,
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return avatar;
  }
}
