import 'package:bloc/bloc.dart';
import 'package:salon_app/core/themes/app_themes.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: _getInitialTheme())) {
    on<ThemeEvent>((event, emit) async {
      emit(ThemeState(themeData: AppThemes.getThemeData(event.appTheme)));
    });
  }

  static ThemeData _getInitialTheme() {
    return AppThemes.getThemeData(AppTheme.lightTheme);
  }
}
