import 'dart:async';
import 'package:flutter/material.dart';

class SmartSplash extends StatefulWidget {
  final Widget image; // Logo or background image
  final Color backgroundColor;
  final int duration; // Duration in seconds
  final Widget nextScreen;
  final bool isFullScreenImage; // ✅ New flag

  const SmartSplash({
    super.key,
    required this.image,
    required this.nextScreen,
    this.backgroundColor = Colors.white,
    this.duration = 3,
    this.isFullScreenImage = true, // ✅ Default full screen
  });

  @override
  State<SmartSplash> createState() => _SmartSplashState();
}

class _SmartSplashState extends State<SmartSplash>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Fade animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    // Navigate after duration
    Timer(Duration(seconds: widget.duration), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => widget.nextScreen));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: widget.isFullScreenImage
            ? SizedBox.expand(
                child: FittedBox(fit: BoxFit.cover, child: widget.image),
              )
            : Center(child: widget.image),
      ),
    );
  }
}
