import 'package:flutter/material.dart';
import 'package:salon_app/core/themes/app_themes.dart';
import 'package:salon_app/core/themes/colors.dart';

/// A helper class for working with colors.
abstract class ColorHelper {
  static Color titleMediumColor(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium?.color ?? AppColors.grey100;
  }

  static Color titleSmallColor(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall?.color ?? AppColors.grey70;
  }

  static Color primaryToWhite(BuildContext context) {
    return isDarkTheme(context) ? Colors.white : Theme.of(context).primaryColor;
  }

  static Color grey20Lite(BuildContext context) {
    return isDarkTheme(context)
        ? Theme.of(context).cardTheme.color ?? Colors.transparent
        : AppColors.grey20;
  }

  static Color grey40Lite(BuildContext context) {
    return isDarkTheme(context)
        ? Colors.white.withOpacity(0.3)
        : AppColors.grey40;
  }
}

/// A helper class for creating custom text styles.
abstract class StyleHelper {
  // Headlines
  static TextStyle? headlineLarge(BuildContext context) {
    return Theme.of(context).textTheme.headlineLarge;
  }

  static TextStyle? headlineMedium(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium;
  }

  static TextStyle? headlineSmall(BuildContext context) {
    return Theme.of(context).textTheme.headlineSmall;
  }

  // Display
  static TextStyle? displayLarge(BuildContext context) {
    return Theme.of(context).textTheme.displayLarge;
  }

  static TextStyle? displayMedium(BuildContext context) {
    return Theme.of(context).textTheme.displayMedium;
  }

  static TextStyle? displaySmall(BuildContext context) {
    return Theme.of(context).textTheme.displaySmall;
  }

  // Body
  static TextStyle? bodyLarge(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge;
  }

  static TextStyle? bodyMedium(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium;
  }

  static TextStyle? bodySmall(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall;
  }

  // Title
  static TextStyle? titleLarge(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge;
  }

  static TextStyle? titleMedium(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium;
  }

  static TextStyle? titleSmall(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall;
  }

  // Label
  static TextStyle? labelLarge(BuildContext context) {
    return Theme.of(context).textTheme.labelLarge;
  }

  static TextStyle? labelMedium(BuildContext context) {
    return Theme.of(context).textTheme.labelMedium;
  }

  static TextStyle? labelSmall(BuildContext context) {
    return Theme.of(context).textTheme.labelSmall;
  }
}

var focusedLineBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
  borderRadius: BorderRadius.circular(15),
);

var fieldEnableBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: AppColors.grey60, width: 1.2),
  borderRadius: BorderRadius.circular(15),
);

var fieldDisabledBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width: 1.2),
  borderRadius: BorderRadius.circular(15),
);

var fieldErrorBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: Colors.redAccent, width: 1.2),
  borderRadius: BorderRadius.circular(15),
);

var focusedErrorBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: Colors.redAccent, width: 1.2),
  borderRadius: BorderRadius.circular(15),
);

var fieldLabel = const TextStyle(fontSize: 14, fontWeight: FontWeight.w600);
