import 'package:flutter/material.dart';

/// A smart, animated, and customizable list layout for any widget.
class SmartList extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry padding;
  final double spacing;
  final Duration animationDuration;
  final Curve animationCurve;

  const SmartList({
    super.key,
    required this.children,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.spacing = 8.0,
    this.animationDuration = const Duration(milliseconds: 400),
    this.animationCurve = Curves.easeOut,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      itemCount: children.length,
      separatorBuilder: (_, __) => SizedBox(height: spacing),
      itemBuilder:
          (context, i) => AnimatedSwitcher(
            duration: animationDuration,
            switchInCurve: animationCurve,
            child: children[i],
          ),
    );
  }
}
