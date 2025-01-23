import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salon_app/app.dart';
import 'package:salon_app/core/utils/injector.dart';

/// The main entry point for the Flutter application.
///
/// The `main` function is the starting point of the Flutter application. It initializes
/// the necessary bindings, sets preferred orientations, and runs the `MyApp` widget.
/// The `main` function is typically defined in the `main.dart` file of a Flutter project.
Future<void> main() async {
  // Ensures that the necessary bindings for the Flutter application are initialized.
  WidgetsFlutterBinding.ensureInitialized();

  // Sets the preferred orientations for the application.
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Initialize the dependencies using the `Injector` class.
  await Injector.init(
    appRunner: () => runApp(const App())
  );
}
