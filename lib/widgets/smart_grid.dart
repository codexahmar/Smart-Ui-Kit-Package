import 'package:flutter/material.dart';

/// A smart, animated, and customizable grid layout for any widget.
class SmartGrid extends StatelessWidget {
  final List<Widget> children;
  final int crossAxisCount;
  final double spacing;
  final EdgeInsetsGeometry padding;
  final Duration animationDuration;
  final Curve animationCurve;
  final double childAspectRatio;

  const SmartGrid({
    super.key,
    required this.children,
    this.crossAxisCount = 2,
    this.spacing = 12.0,
    this.padding = const EdgeInsets.all(16),
    this.animationDuration = const Duration(milliseconds: 400),
    this.animationCurve = Curves.easeOut,
    this.childAspectRatio = 1.2,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: padding,
      itemCount: children.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder:
          (context, i) => AnimatedSwitcher(
            duration: animationDuration,
            switchInCurve: animationCurve,
            child: children[i],
          ),
    );
  }
}
