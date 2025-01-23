import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:salon_app/core/bloc/language_bloc/language_bloc.dart';
import 'package:salon_app/core/bloc/theme_bloc/theme_bloc.dart';
import 'package:salon_app/core/storage/local_storage.dart';
import 'package:salon_app/core/themes/app_themes.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/presentation/onboarding/onboarding_screen.dart';

/// SplashScreen widget is displayed when the app is launched.
class SplashScreen extends StatefulWidget {
  /// Constructor for the SplashScreen widget.
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _localStorage = GetIt.I.get<LocalStorage>();

  @override
  void initState() {
    super.initState();
    _initializeThemeAndNavigate();
  }

  /// Initializes the theme and navigates to the Dashboard screen.
  Future<void> _initializeThemeAndNavigate() async {
    final savedTheme = _localStorage.getTheme();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      AppTheme theme;
      if (savedTheme == AppTheme.darkTheme.toString()) {
        theme = AppTheme.darkTheme;
      } else if (savedTheme == AppTheme.lightTheme.toString()) {
        theme = AppTheme.lightTheme;
      } else {
        Brightness systemBrightness = MediaQuery.of(context).platformBrightness;

        theme = systemBrightness == Brightness.dark
            ? AppTheme.darkTheme
            : AppTheme.lightTheme;
      }

      BlocProvider.of<ThemeBloc>(context).add(ThemeEvent(appTheme: theme));

      checkCurrentLocale();

      navigateToScreen(context, const OnBoardingScreen(),
          clearPreviousRoutes: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const SizedBox(),
    );
  }

  void checkCurrentLocale() {
    context.read<LanguageBloc>().add(CheckCurrentLocale());
  }
}
