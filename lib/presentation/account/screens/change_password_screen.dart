import 'package:flutter/material.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/widgets/custom_button.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// Widget for changing the password.
class ChangePassword extends StatefulWidget {
  /// Constructor for the [ChangePassword] class.
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spacing(height: 20),
        Text(
          trans(context, key: 'your_new_password_must_be_different'),
          style: StyleHelper.titleSmall(context),
        ),
        spacing(height: 50),
        TextFormField(
          obscureText: true,
          decoration: fieldDeco(
              label: trans(context, key: 'password'),
              helperText: trans(context, key: 'must_be_at_least_8_characters')),
        ),
        spacing(height: 20),
        TextFormField(
          obscureText: true,
          decoration: fieldDeco(
              label: trans(context, key: 'confirm_password'),
              helperText: trans(context, key: 'both_passwords_must_match')),
        ),
        spacing(height: 60),
        Row(
          children: [
            Expanded(
                child: CustomButton(
                    title: trans(context, key: 'reset_password'),
                    onTap: () {
                      navigateBack(context);
                    },
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    yPadding: 15)),
          ],
        ),
        spacing(height: 50),
      ],
    );
  }
}
