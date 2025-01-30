import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/core/bloc/app_bloc_provider.dart';
import 'package:salon_app/core/bloc/language_bloc/language_bloc.dart';
import 'package:salon_app/core/bloc/theme_bloc/theme_bloc.dart';
import 'package:salon_app/core/localization/app_localization_setup.dart';
import 'package:salon_app/presentation/auth/login_screen.dart';
import 'package:salon_app/presentation/home/widgets/home_toggle_bar.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBlocProvider(
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState themeState) {
          return BlocBuilder<LanguageBloc, LanguageState>(
            buildWhen: (previousState, currentState) =>
                previousState != currentState,
            builder: (_, localeState) {
              return MaterialApp(
                title: 'Beauty Book',
                debugShowCheckedModeBanner: false,
                theme: themeState.themeData,
                supportedLocales: AppLocalizationSetup.supportedLocales,
                localizationsDelegates:
                    AppLocalizationSetup.localizationDelegates,
                localeResolutionCallback:
                    AppLocalizationSetup.localeResolutionCallback,
                locale: localeState.locale,
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(textScaler: const TextScaler.linear(1.0)),
                    child: child!,
                  );
                },
                
                 home: const LoginPage(),
              );
            },
          );
        },
      ),
    );
  }
}
