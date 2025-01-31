import 'package:flutter/material.dart';
import 'package:salon_app/core/constants/assets_const.dart';
import 'package:salon_app/core/constants/image_type_const.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/presentation/account/screens/edit_profile_screen.dart';
import 'package:salon_app/presentation/account/widgets/account_options.dart';
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
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            // spacing(height: 10),
            // const Padding(
            //   padding: EdgeInsets.only(left: 15, right: 15),
            //   child: SelectLanguageWidget(),
            // ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text("Your Profile", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            spacing(height: 30),
            _buildUserAvatarWidget(),
            spacing(height: 30),
            // const AccountGeneralInfo(),
            // spacing(height: 20),
            const AccountOptions(),
            spacing(height: 150),
            Center(child: Image.asset('assets/img/Group 329.png')),
            spacing(height: 20),
            Row(
                      children: [
                        spacing(width: 20), 
            TextButton(onPressed: (){}, child: Text('About Us',style: TextStyle(color: Colors.grey, fontSize: 11),)),
            spacing(width: 30), 
            TextButton(onPressed: (){}, child: Text('Privacy Policy',style: TextStyle(color: Colors.grey, fontSize: 11))),
            spacing(width: 30), 
            TextButton(onPressed: (){}, child: Text('Terms & Conditions',style: TextStyle(color: Colors.grey, fontSize: 11))), 
                      ],
                    ),
                    spacing(height: 20),
          ],
        ),
      ),
    );
  }

  /// Builds the user avatar widget.
  Widget _buildUserAvatarWidget() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Row(
            children: [
              Stack(
                children:[
          ImageWidget(
                  height: 120,
                  width: 120,
                  image: AssetsConst.avatarPlaceholder,
                  borderRadius: BorderRadius.circular(200),
                  fit: BoxFit.cover,
                  type: ImageType.asset,
                ),
                Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 18,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                ] 
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35), 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, 
                   children: [
                  
                  const Text(
                          'Emily Robinson',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                         const Text(
                          '+91 7306882706',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        spacing(height: 10),
                        
                        CustomButton(
                          title: trans(context, key: 'edit Profile'),
                          // leftIcon: LucideIcons.edit,
                          color: const Color.fromARGB(255, 216, 216, 216),
                          textColor: Colors.black,
                          iconSize: 16,
                          onTap: () {
                navigateToScreen(context, const EditProfileScreen());
                          },
                        ),
                ],),
              )
            ],
          ),
        ),
        spacing(height: 20),
        
      ],
    );
  }
}
