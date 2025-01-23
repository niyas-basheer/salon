import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salon_app/core/localization/app_localization.dart';
import 'package:salon_app/core/themes/app_themes.dart';
import 'package:salon_app/core/themes/colors.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:timeago/timeago.dart' as timeago;

/// Generates input decoration for text input fields.
InputDecoration fieldDeco({
  String? label,
  String? hintText,
  IconData? prefixIcon,
  Widget? prefixWidget,
  Color? prefixIconColor,
  Widget? suffix,
  bool isFilled = false,
  double? yPadding,
  String? helperText,
  BorderRadius? borderRadius,
  Color? fillColor,
}) {
  return InputDecoration(
    filled: isFilled,
    fillColor: fillColor ?? AppColors.white,
    border: isFilled ? InputBorder.none : null,
    contentPadding:
    EdgeInsets.symmetric(horizontal: 20, vertical: yPadding ?? 15),
    labelText: label,
    hintText: hintText,
    counterText: '',
    labelStyle: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
    ),
    helperText: helperText,
    helperMaxLines: 3,
    hintStyle: const TextStyle(
      fontSize: 14.0,
    ),
    prefixIcon: prefixWidget ??
        (prefixIcon != null
            ? Icon(
          prefixIcon,
          color: prefixIconColor ?? AppColors.grey60,
          size: 20,
        )
            : null),
    suffixIcon: suffix,
    enabledBorder: fieldEnableBorder.copyWith(borderRadius: borderRadius),
    focusedBorder: focusedLineBorder.copyWith(borderRadius: borderRadius),
    disabledBorder: fieldDisabledBorder.copyWith(borderRadius: borderRadius),
    errorBorder: fieldErrorBorder.copyWith(borderRadius: borderRadius),
    focusedErrorBorder:
    focusedErrorBorder.copyWith(borderRadius: borderRadius),
    floatingLabelStyle: const TextStyle(
      fontSize: 18.0,
    ),
  );
}

/// Retrieves the common box border based on the theme.
Border getBoxBorder(BuildContext context) {
  return isDarkTheme(context)
      ? Border.all(color: Colors.white10)
      : Border.all(color: Colors.grey.shade300);
}

/// Formats a DateTime object to a specific format.
String formatDateTime({required String date}) {
  return DateFormat('EEEE dd, yyyy').format(DateTime.parse(date));
}

/// Converts a DateTime string to a time ago format.
String timeAgoFormat(String dateTime) {
  return timeago.format(DateTime.parse(dateTime), locale: 'en_US');
}

/// Formats a DateTime string to a time format.
String getTimeFormat(String dateTime) {
  final timeFormat = DateFormat.jm();
  return timeFormat.format(DateTime.parse(dateTime));
}

/// Displays a date picker dialog and returns the selected date.
Future<DateTime?> selectDate(BuildContext context,
    {DateTime? initialDate}) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: DateTime(1901, 1),
    lastDate: DateTime.now(),
  );

  return picked ?? DateTime.now();
}

/// Translates the provided key using the app's localization.
String trans(BuildContext context, {required String key}) {
  return AppLocalizations.of(context)?.translate(key) ?? key;
}
