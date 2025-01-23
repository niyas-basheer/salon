import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:salon_app/core/bloc/app_bloc_observer.dart';
import 'package:salon_app/core/storage/local_storage.dart';

/// Signature for the [appRunner] function.
///
/// The [appRunner] function represents the entry point of the application and
/// takes no arguments. It can return a [Future] that completes with `void` or
/// simply return `void`.
typedef AppRunner = FutureOr<void> Function();

/// The `Injector` class provides a mechanism to initialize dependencies and
/// set up the application's `Bloc` observer.
class Injector {
  static Future<void> init({required AppRunner appRunner}) async {
    await _initDependencies();

    Bloc.observer = AppBlocObserver();

    appRunner();
  }

  static Future<void> _initDependencies() async {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    // Save hive data to app support path
    Directory directory = await getApplicationSupportDirectory();
    Hive.init(directory.path);

    // Local Storage
    final storage = await HiveStorage.init();
    GetIt.I.registerLazySingleton<LocalStorage>(() => storage);

    await GetIt.I.allReady();
  }
}
