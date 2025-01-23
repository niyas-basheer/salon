import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/core/bloc/theme_bloc/theme_bloc.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// A widget that displays general information about the user's account.
class AccountGeneralInfo extends StatelessWidget {
  /// Constructs an [AccountGeneralInfo] widget.
  const AccountGeneralInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardTheme.color,
              borderRadius: BorderRadius.circular(20),
              border: getBoxBorder(context),
            ),
            child: Column(
              children: [
                spacing(height: 5),
                infoWidget(context,
                    key: trans(context, key: 'email'),
                    value: 'emilyrobinson@example.com'),
                const Divider(height: 1, thickness: 0.5),
                infoWidget(context,
                    key: trans(context, key: 'date_of_birth'),
                    value: '24 Jan 2000'),
                const Divider(height: 1, thickness: 0.5),
                infoWidget(context,
                    key: trans(context, key: 'gender_2'), value: 'Female'),
                spacing(height: 5),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Builds a widget to display account information.
  Widget infoWidget(BuildContext context,
      {required String key, required String value}) {
    return Padding(
      padding: const EdgeInsets.all(13),
      child: Row(
        children: [
          Expanded(
            child: Text(
              key,
              style: TextStyle(
                fontSize: 14,
                color: ColorHelper.titleMediumColor(context),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: ColorHelper.titleSmallColor(context),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
