import 'package:flutter/material.dart';

/// A common navigation method for navigating to a new screen with additional options.
///
/// The `navigateToScreen` method provides a convenient way to navigate from one
/// screen to another within a Flutter application. It takes the `BuildContext`
/// of the current screen, a `Widget` representing the target screen, and optional
/// parameters for replacing the current route, making the target route opaque,
/// and clearing previous routes.
///
/// Example usage:
/// ```
/// navigateToScreen(context, MyScreen(), replace: true, opaque: true, clearPreviousRoutes: true);
/// ```
void navigateToScreen(BuildContext context, Widget screen,
    {bool replace = false,
    bool opaque = false,
    bool clearPreviousRoutes = false,
    bool fullscreenDialog = false}) {
  if (replace) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  } else if (opaque) {
    Navigator.push(
      context,
      PageRouteBuilder(
        opaque: true,
        pageBuilder: (BuildContext context, _, __) => screen,
      ),
    );
  } else if (clearPreviousRoutes) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => screen),
      (route) => false,
    );
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => screen, fullscreenDialog: fullscreenDialog),
    );
  }
}

/// A common method for navigating back or popping the current route.
///
/// The `navigateBack` method provides a convenient way to navigate back or
/// pop the current route in a Flutter application. It takes the `BuildContext`
/// of the current screen as a parameter and uses the `Navigator.pop` method
/// to navigate back to the previous screen or close the current screen if there
/// are no more routes in the navigation stack.
///
/// Example usage:
/// ```
/// navigateBack(context);
/// ```
void navigateBack(BuildContext context) {
  Navigator.pop(context);
}
