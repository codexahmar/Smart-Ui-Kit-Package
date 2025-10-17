// Updated: lib/utils/smart_theme.dart
import 'package:flutter/material.dart';

/// Levels for consistent UI feedback.
enum SmartLevel { info, success, warning, error }

class SmartTheme {
  static Color backgroundColor(SmartLevel level, Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    switch (level) {
      case SmartLevel.success:
        return isDark ? Colors.green.shade700 : Colors.green.shade100;
      case SmartLevel.warning:
        return isDark ? Colors.orange.shade700 : Colors.orange.shade100;
      case SmartLevel.error:
        return isDark ? Colors.red.shade700 : Colors.red.shade100;
      case SmartLevel.info:
      default:
        return isDark ? Colors.blueGrey.shade700 : Colors.blue.shade50;
    }
  }

  static Color textColor(SmartLevel level, Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    return isDark ? Colors.white : Colors.black87;
  }

  static Color iconColor(SmartLevel level) {
    switch (level) {
      case SmartLevel.success:
        return Colors.green;
      case SmartLevel.warning:
        return Colors.orange;
      case SmartLevel.error:
        return Colors.red;
      case SmartLevel.info:
      default:
        return Colors.blue;
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
      default:
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
      default:
        return "Here is some helpful information.";
    }
  }
}

/// Layout options for SmartCard.
enum SmartCardLayout { card, tile, compact }
