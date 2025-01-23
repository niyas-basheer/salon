import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/constants/assets_const.dart';
import 'package:salon_app/core/constants/image_type_const.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/presentation/account/screens/edit_profile_screen.dart';
import 'package:salon_app/presentation/account/widgets/account_general_info.dart';
import 'package:salon_app/presentation/account/widgets/account_options.dart';
import 'package:salon_app/presentation/account/widgets/select_language_widget.dart';
import 'package:salon_app/presentation/widgets/custom_button.dart';
import 'package:salon_app/presentation/widgets/image_widget.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// Widget representing the account screen.
class AccountScreen extends StatefulWidget {
  /// Constructor for the [AccountScreen] widget.
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          spacing(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: SelectLanguageWidget(),
          ),
          spacing(height: 5),
          _buildUserAvatarWidget(),
          spacing(height: 30),
          const AccountGeneralInfo(),
          spacing(height: 20),
          const AccountOptions(),
          spacing(height: 20),
        ],
      ),
    );
  }

  /// Builds the user avatar widget.
  Widget _buildUserAvatarWidget() {
    return Column(
      children: [
        ImageWidget(
          height: 120,
          width: 120,
          image: AssetsConst.avatarPlaceholder,
          borderRadius: BorderRadius.circular(200),
          fit: BoxFit.cover,
          type: ImageType.asset,
        ),
        spacing(height: 20),
        const Text(
          'Emily Robinson',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        spacing(height: 10),
        CustomButton(
          title: trans(context, key: 'edit'),
          leftIcon: LucideIcons.edit,
          iconSize: 16,
          onTap: () {
            navigateToScreen(context, const EditProfileScreen());
          },
        ),
      ],
    );
  }
}
