import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/widgets/action_icon_button.dart';
import 'package:salon_app/presentation/widgets/custom_button.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// Screen for handling the forgot password functionality.
class ForgotPassword extends StatefulWidget {
  /// Constructor for the [ForgotPassword] class.
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: [
            spacing(height: 30),
            Row(
              children: [
                ActionIconButton(
                  icon: Icons.arrow_back,
                  onPressed: () {
                    navigateBack(context);
                  },
                ),
              ],
            ),
            spacing(height: 20),
            Text(
              trans(context, key: 'forgot_password_2'),
              style: StyleHelper.titleLarge(context)
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            spacing(height: 10),
            Text(
              trans(context, key: 'please_type_your_email_below_and_we_will_give_you_a_otp_code'),
              style: StyleHelper.titleSmall(context),
            ),
            spacing(height: 50),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: fieldDeco(
                  prefixIcon: LucideIcons.mail, label: trans(context, key: 'email_address')),
            ),
            spacing(height: 60),
            Row(
              children: [
                Expanded(
                    child: CustomButton(
                        title: trans(context, key: 'send_otp'),
                        onTap: () {},
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        yPadding: 15)),
              ],
            ),
            spacing(height: 25),
          ],
        ),
      ),
    );
  }
}
