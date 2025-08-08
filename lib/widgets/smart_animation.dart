// lib/widgets/animated_entry.dart
import 'package:flutter/material.dart';
import 'dart:async';

/// A highly customizable animation entry widget.
class SmartAnimation extends StatefulWidget {
  final Widget child;

  /// Type of animation to apply.
  final AnimationType animationType;

  /// Duration of the animation.
  final Duration duration;

  /// Delay before animation starts.
  final Duration delay;

  /// Offset used in slide or fade+slide.
  final Offset offset;

  /// Scale factor for scale animation.
  final double scaleBegin;

  /// Rotation angle (in radians).
  final double rotationAngle;

  /// Curve of the animation.
  final Curve curve;

  const SmartAnimation({
    super.key,
    required this.child,
    this.animationType = AnimationType.fadeSlide,
    this.duration = const Duration(milliseconds: 500),
    this.delay = Duration.zero,
    this.offset = const Offset(0, 0.1),
    this.scaleBegin = 0.95,
    this.rotationAngle = 0.05,
    this.curve = Curves.easeOut,
  });

  @override
  State<SmartAnimation> createState() => _SmartAnimationState();
}

class _SmartAnimationState extends State<SmartAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  Timer? _delayTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);

    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      _delayTimer = Timer(widget.delay, () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _delayTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        switch (widget.animationType) {
          case AnimationType.fade:
            return Opacity(opacity: _animation.value, child: child);

          case AnimationType.slide:
            return Transform.translate(
              offset: Offset(
                widget.offset.dx * (1 - _animation.value) * 100,
                widget.offset.dy * (1 - _animation.value) * 100,
              ),
              child: child,
            );

          case AnimationType.fadeSlide:
            return Opacity(
              opacity: _animation.value,
              child: Transform.translate(
                offset: Offset(
                  widget.offset.dx * (1 - _animation.value) * 100,
                  widget.offset.dy * (1 - _animation.value) * 100,
                ),
                child: child,
              ),
            );

          case AnimationType.scale:
            final scale =
                widget.scaleBegin + (1 - widget.scaleBegin) * _animation.value;
            return Transform.scale(scale: scale, child: child);

          case AnimationType.rotation:
            return Transform.rotate(
              angle: widget.rotationAngle * (1 - _animation.value),
              child: child,
            );

          case AnimationType.fadeScale:
            final scale =
                widget.scaleBegin + (1 - widget.scaleBegin) * _animation.value;
            return Opacity(
              opacity: _animation.value,
              child: Transform.scale(scale: scale, child: child),
            );
        }
      },
      child: widget.child,
    );
  }
}

/// Available animation types for AnimatedEntry.
enum AnimationType { fade, slide, fadeSlide, scale, fadeScale, rotation }
