import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/account/widgets/profile_avatar.dart';
import 'package:salon_app/presentation/widgets/action_icon_button.dart';
import 'package:salon_app/presentation/widgets/custom_button.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// Widget for editing user profile information.
class EditProfileScreen extends StatefulWidget {
  /// Constructor for the [EditProfileScreen] widget.
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          const ProfileAvatar(),
          spacing(height: 50),
          _buildNameField(),
          spacing(height: 30),
          Row(
            children: [
              // _buildGenderField(),
              spacing(width: 10),
              _buildBirthdayField()
            ],
          ),
          spacing(height: 30),
          _buildPhoneNumberField(),
          spacing(height: 30),
          _buildEmailField(),
          spacing(height: 30),
          CustomButton(
              title: trans(context, key: 'save_changes'),
              yPadding: 15,
              onTap: () {
                navigateBack(context);
              })
        ],
      ),
    );
  }

  /// Builds the app bar for the edit profile screen.
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        trans(context, key: 'edit_profile'),
        style: StyleHelper.titleLarge(context)
            ?.copyWith(fontWeight: FontWeight.w500),
      ),
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      leading: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: ActionIconButton(
            icon: LucideIcons.arrowLeft,
            onPressed: () {
              navigateBack(context);
            },
          ),
        ),
      ),
    );
  }

  /// Builds the text form field for the name input.
  Widget _buildNameField() {
    return TextFormField(
      initialValue: 'Emily Robinson',
      decoration: fieldDeco(label: trans(context, key: 'full_name')),
    );
  }

  /// Builds the dropdown field for selecting gender.
  // Widget _buildGenderField() {
  //   return Expanded(
  //     child: DropdownSearch<String>(
  //       popupProps: PopupProps.menu(
  //           constraints:
  //               BoxConstraints.loose(const Size(double.infinity, 120))),
  //       items: const ["Male", "Female"],
  //       dropdownDecoratorProps: DropDownDecoratorProps(
  //           dropdownSearchDecoration:
  //               fieldDeco(label: trans(context, key: 'gender'))),
  //       selectedItem: 'Female',
  //     ),
  //   );
  // }

  /// Builds the text form field for selecting the birthday.
  Widget _buildBirthdayField() {
    return Expanded(
        child: GestureDetector(
      onTap: () async {
        await selectDate(context);
      },
      behavior: HitTestBehavior.opaque,
      child: IgnorePointer(
        ignoring: true,
        child: TextFormField(
          readOnly: true,
          decoration: fieldDeco(label: trans(context, key: 'birthday')),
        ),
      ),
    ));
  }

  /// Builds the text form field for entering the phone number.
  Widget _buildPhoneNumberField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      decoration: fieldDeco(
        prefixIcon: LucideIcons.phone,
        prefixWidget: const CountryCodePicker(
          onChanged: print,
          showOnlyCountryWhenClosed: false,
          alignLeft: false,
        ),
        label: trans(context, key: 'mobile_number'),
      ),
    );
  }

  /// Builds the text form field for entering the email.
  Widget _buildEmailField() {
    return TextFormField(
      initialValue: 'emily@robinson.com',
      decoration: fieldDeco(label: trans(context, key: 'email')),
    );
  }
}
