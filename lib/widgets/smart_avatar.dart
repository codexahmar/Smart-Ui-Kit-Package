import 'package:flutter/material.dart';

/// A minimal avatar widget to show an image with adjustable width and height.
class SmartAvatar extends StatelessWidget {
  final double width;
  final double height;
  final String imageUrl;
  final BoxFit fit;

  const SmartAvatar({
    super.key,
    required this.imageUrl,
    this.width = 56,
    this.height = 56,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100), // Always circular
      child: Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        errorBuilder:
            (context, error, stackTrace) => Container(
              width: width,
              height: height,
              color: Colors.grey[300],
              child: const Icon(Icons.person, color: Colors.white),
            ),
      ),
    );
  }
}
