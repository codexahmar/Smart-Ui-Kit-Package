import 'package:flutter/material.dart';

/// Levels for consistent UI feedback.
enum SmartLevel { info, success, warning, error }

class SmartTheme {
  static Color backgroundColor(SmartLevel level, Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    switch (level) {
      case SmartLevel.success:
        return isDark
            ? const Color(0xFF2E7D32) // Dark green
            : const Color(0xFFE8F5E9); // Light green background
      case SmartLevel.warning:
        return isDark
            ? const Color(0xFFF57C00) // Orange dark
            : const Color(0xFFFFF3E0); // Light orange background
      case SmartLevel.error:
        return isDark
            ? const Color(0xFFD32F2F) // Dark red
            : const Color(0xFFFFEBEE); // Light red background
      case SmartLevel.info:
        return isDark
            ? const Color(0xFF455A64) // BlueGrey dark
            : const Color(0xFFE3F2FD); // Light blue background
    }
  }

  static Color textColor(SmartLevel level, Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    return isDark ? Colors.white : Colors.black87;
  }

  static Color iconColor(SmartLevel level) {
    switch (level) {
      case SmartLevel.success:
        return const Color(0xFF2E7D32); // Green
      case SmartLevel.warning:
        return const Color(0xFFF57C00); // Orange
      case SmartLevel.error:
        return const Color(0xFFD32F2F); // Red
      case SmartLevel.info:
        return const Color(0xFF1976D2); // Blue
    }
  }

  static IconData defaultIcon(SmartLevel level) {
    switch (level) {
      case SmartLevel.success:
        return Icons.check_circle;
      case SmartLevel.warning:
        return Icons.warning;
      case SmartLevel.error:
        return Icons.error;
      case SmartLevel.info:
        return Icons.info;
    }
  }

  static String defaultMessage(SmartLevel level) {
    switch (level) {
      case SmartLevel.success:
        return "Operation completed successfully.";
      case SmartLevel.warning:
        return "Please check your input or settings.";
      case SmartLevel.error:
        return "Something went wrong. Please try again.";
      case SmartLevel.info:
        return "Here is some helpful information.";
    }
  }
}

/// Layout options for SmartCard.
enum SmartCardLayout { card, tile, compact }
