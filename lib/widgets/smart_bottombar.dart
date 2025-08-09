import 'dart:ui';
import 'package:flutter/material.dart';

class SmartBottomBarItem {
  final Widget icon;
  final Widget? activeIcon;
  final String label;
  final Color activeColor;
  final Color inactiveColor;

  SmartBottomBarItem({
    required this.icon,
    this.activeIcon,
    required this.label,
    required this.activeColor,
    required this.inactiveColor,
  });
}

class SmartBottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<SmartBottomBarItem> items;

  // Style properties
  final double elevation;
  final BorderRadius borderRadius;
  final EdgeInsets margin;
  final bool fullWidth;
  final double height;
  final Gradient? backgroundGradient;
  final Color? backgroundColor;

  // Blur options
  final bool enableBlur;
  final double blurSigma;

  // Label options
  final bool showLabels;

  const SmartBottomBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.elevation = 10,
    this.borderRadius = const BorderRadius.all(Radius.circular(30)),
    this.margin = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.fullWidth = false,
    this.height = 60,
    this.backgroundGradient,
    this.backgroundColor,
    this.enableBlur = true,
    this.blurSigma = 15,
    this.showLabels = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final barContent = Container(
      height: height,
      margin: fullWidth ? EdgeInsets.zero : margin,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: [
          if (elevation > 0)
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: elevation,
              offset: const Offset(0, 5),
            ),
        ],
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: enableBlur
            ? BackdropFilter(
                filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
                child: _buildBarBackground(),
              )
            : _buildBarBackground(),
      ),
    );

    return barContent;
  }

  Widget _buildBarBackground() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color:
            backgroundColor ??
            Colors.white.withOpacity(backgroundGradient == null ? 0.1 : 0),
        gradient: backgroundGradient,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final bool isActive = index == currentIndex;

          return GestureDetector(
            onTap: () => onTap(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isActive
                    ? item.activeColor.withOpacity(0.2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  AnimatedScale(
                    scale: isActive ? 1.2 : 1.0,
                    duration: const Duration(milliseconds: 250),
                    child: isActive
                        ? (item.activeIcon ?? item.icon)
                        : item.icon,
                  ),
                  if (isActive && showLabels) ...[
                    const SizedBox(width: 6),
                    AnimatedOpacity(
                      opacity: isActive ? 1 : 0,
                      duration: const Duration(milliseconds: 250),
                      child: Text(
                        item.label,
                        style: TextStyle(
                          color: item.activeColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
