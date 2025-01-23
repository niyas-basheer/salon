import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:salon_app/core/bloc/theme_bloc/theme_bloc.dart';
import 'package:salon_app/core/constants/assets_const.dart';
import 'package:salon_app/core/storage/local_storage.dart';
import 'package:salon_app/core/themes/app_themes.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// Widget for customizing appearance settings.
class AppearanceScreen extends StatefulWidget {
  /// Constructor for the [AppearanceScreen] class.
  const AppearanceScreen({super.key});

  @override
  State<AppearanceScreen> createState() => _AppearanceScreenState();
}

class _AppearanceScreenState extends State<AppearanceScreen> {
  final localStorage = GetIt.I.get<LocalStorage>();

  int _selectedValue = 0;

  @override
  void initState() {
    final savedTheme = localStorage.getTheme();

    if (savedTheme == AppTheme.lightTheme.toString()) {
      _selectedValue = 0;
    } else if (savedTheme == AppTheme.darkTheme.toString()) {
      _selectedValue = 1;
    } else {
      _selectedValue = 2;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spacing(height: 20),
        Text(
          trans(context, key: 'theme_mode'),
          style: StyleHelper.bodyLarge(context)
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        spacing(height: 5),
        Text(
          trans(context, key: 'customization_according_to_your_preferences'),
          style: StyleHelper.titleSmall(context),
        ),
        spacing(height: 30),
        BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return Row(
              children: [
                _buildThemeOption(
                  value: 0,
                  label: trans(context, key: 'light'),
                  asset: AssetsConst.themeLight,
                  appTheme: AppTheme.lightTheme,
                ),
                _buildThemeOption(
                  value: 1,
                  label: trans(context, key: 'dark'),
                  asset: AssetsConst.themeDark,
                  appTheme: AppTheme.darkTheme,
                ),
                _buildThemeOption(
                    value: 2,
                    label: trans(context, key: 'system'),
                    asset: AssetsConst.themeSystem,
                    systemTheme: true),
              ],
            );
          },
        )
      ],
    );
  }

  /// Builds the theme option widget.
  Widget _buildThemeOption(
      {required int value,
      required String asset,
      required String label,
      AppTheme? appTheme,
      bool systemTheme = false}) {
    Brightness systemBrightness = MediaQuery.of(context).platformBrightness;

    // Determine system theme
    ThemeMode systemThemeMode =
        systemBrightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;

    return Expanded(
      child: GestureDetector(
        onTap: () async {
          setState(() {
            _selectedValue = value;
          });
          if (appTheme != null) {
            await localStorage.saveTheme(appTheme.toString());
            if (!mounted) return;
            context.read<ThemeBloc>().add(ThemeEvent(appTheme: appTheme));
          } else if (systemTheme) {
            await localStorage.saveTheme(AppTheme.systemTheme.toString());
            if (systemThemeMode == ThemeMode.dark) {
              if (!mounted) return;
              context
                  .read<ThemeBloc>()
                  .add(ThemeEvent(appTheme: AppTheme.darkTheme));
            } else {
              if (!mounted) return;
              context
                  .read<ThemeBloc>()
                  .add(ThemeEvent(appTheme: AppTheme.lightTheme));
            }
          }
        },
        behavior: HitTestBehavior.opaque,
        child: Column(
          children: [
            SvgPicture.asset(asset, height: 180),
            spacing(height: 10),
            Text(
              label,
              style: StyleHelper.labelLarge(context)
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            spacing(height: 5),
            IgnorePointer(
              ignoring: true,
              child: Radio<int>(
                value: value,
                groupValue: _selectedValue,
                onChanged: (newValue) {
                  setState(() {
                    _selectedValue = newValue!;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
