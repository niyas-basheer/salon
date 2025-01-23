import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/constants/assets_const.dart';
import 'package:salon_app/core/themes/colors.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/auth/login_screen.dart';
import 'package:salon_app/presentation/auth/otp_screen.dart';
import 'package:salon_app/presentation/widgets/custom_button.dart';
import 'package:salon_app/presentation/widgets/social_button.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// The screen for user sign up.
class SignUpScreen extends StatefulWidget {
  /// Constructor for the [SignUpScreen] class.
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          children: [
            spacing(height: 30),
            Text(
              trans(context, key: 'create_an_account'),
              style: StyleHelper.titleLarge(context)
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            spacing(height: 5),
            Text(
              trans(context,
                  key:
                      'please_type_full_information_bellow_and_we_can_create_your_account'),
              style: StyleHelper.titleSmall(context),
            ),
            spacing(height: 50),
            TextFormField(
              maxLength: 10,
              keyboardType: TextInputType.name,
              decoration: fieldDeco(
                prefixIcon: LucideIcons.user,
                hintText: trans(context, key: 'full_name'),
              ),
            ),
            spacing(height: 20),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: fieldDeco(
                prefixIcon: LucideIcons.mail,
                hintText: trans(context, key: 'email'),
              ),
            ),
            spacing(height: 20),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: fieldDeco(
                prefixIcon: LucideIcons.phone,
                prefixWidget: const CountryCodePicker(
                  onChanged: print,
                  showOnlyCountryWhenClosed: false,
                  alignLeft: false,
                ),
                hintText: trans(context, key: 'mobile_number'),
              ),
            ),
            spacing(height: 20),
            TextFormField(
              maxLength: 10,
              obscureText: !showPassword,
              decoration: fieldDeco(
                  prefixIcon: LucideIcons.lock,
                  hintText: trans(context, key: 'password'),
                  suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      icon: Icon(showPassword
                          ? LucideIcons.eye
                          : LucideIcons.eyeOff))),
            ),
            spacing(height: 60),
            Row(
              children: [
                Expanded(
                    child: CustomButton(
                        title: trans(context, key: 'join_now'),
                        onTap: () {
                          navigateToScreen(context,  OtpScreen());
                        },
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        yPadding: 15)),
              ],
            ),
            spacing(height: 25),
            Row(
              children: [
                Expanded(child: Divider(color: Colors.grey.shade300)),
                spacing(width: 25),
                Text(
                  trans(context, key: 'or_sign_up_with'),
                  style: StyleHelper.titleSmall(context),
                ),
                spacing(width: 25),
                Expanded(child: Divider(color: Colors.grey.shade300)),
              ],
            ),
            spacing(height: 25),
            Row(
              children: [
                Expanded(
                  child: SocialButton(
                    icon: AssetsConst.facebook,
                    label: 'Facebook',
                    onTap: () {},
                  ),
                ),
                spacing(width: 10),
                Expanded(
                  child: SocialButton(
                    icon: AssetsConst.google,
                    label: 'Google',
                    onTap: () {},
                  ),
                ),
              ],
            ),
            spacing(height: 25),
            joinNow(),
            spacing(height: 40),
          ],
        ),
      ),
    );
  }

  /// Builds the "Already have an account? Sign In" widget.
  Widget joinNow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          trans(context, key: 'already_have_an_account'),
          style: StyleHelper.titleSmall(context),
        ),
        spacing(width: 8),
        GestureDetector(
          onTap: () {
            navigateToScreen(context, const LoginPage(), replace: true);
          },
          behavior: HitTestBehavior.opaque,
          child: Text(trans(context, key: 'sign_in'),
              style: StyleHelper.titleSmall(context)
                  ?.copyWith(color: AppColors.primary)),
        ),
      ],
    );
  }
}
