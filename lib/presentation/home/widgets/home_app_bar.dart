import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/common/select_location_screen.dart';
import 'package:salon_app/presentation/notifications/notifications_screen.dart';
import 'package:salon_app/presentation/widgets/action_icon_button.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// A StatelessWidget that represents the app bar used in the home screen.
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                     children: [
                       Image.asset('assets/img/icon_logo.png'),
                       Text('Spotbelt',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
                     ],
                   ), 
                  
                  spacing(height: 5),
                  _buildSelectedAddress(context),
                ],
              ),
            ),
            spacing(width: 30),
            
            ActionIconButton(
              icon: LucideIcons.bell,
              badgeLabel: '10',
              onPressed: () {
                navigateToScreen(context, const NotificationScreen());
              },
            ),
            spacing(width: 10),
            ActionIconButton(
              icon: LucideIcons.heart,
              onPressed: () {
                navigateToScreen(context, const NotificationScreen());
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the widget for displaying the selected address.
  Widget _buildSelectedAddress(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _changeLocation(context);
      },
      child: Row(
        children: [
          spacing(width: 5),
          Icon(
            LucideIcons.mapPin,
            size: 20,
            color: ColorHelper.primaryToWhite(context),
          ),
          spacing(width: 5),
          Flexible(
            child: Text(
                    trans(context, key: 'BTM Layout, Bangalore'),
                    style: StyleHelper.titleSmall(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
          ),
          spacing(width: 5),
          const Icon(
            LucideIcons.chevronDown,
            size: 20,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  /// Displays a modal bottom sheet for changing the location.
  void _changeLocation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      builder: (context) => const SelectLocationScreen(),
    );
  }
}
