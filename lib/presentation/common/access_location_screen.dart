import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salon_app/core/constants/assets_const.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/common/select_location_screen.dart';
import 'package:salon_app/presentation/dashboard.dart';
import 'package:salon_app/presentation/widgets/custom_button.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// A StatelessWidget representing the screen for accessing location.
class LocationAccessScreen extends StatelessWidget {
  const LocationAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                AssetsConst.location,
                width: 250,
              ),
            ),
            spacing(height: 50),
            Text(
              trans(context, key: 'enable_your_location'),
              style: StyleHelper.titleLarge(context)
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            spacing(height: 10),
            Text(
              trans(context,
                  key:
                      'enable_location_services_to_discover_nearby_salons_effortlessly'),
              textAlign: TextAlign.center,
              style: StyleHelper.titleMedium(context)
                  ?.copyWith(color: ColorHelper.titleSmallColor(context)),
            ),
            spacing(height: 40),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    title: trans(context, key: 'use_my_location'),
                    fontSize: 16,
                    yPadding: 12,
                    onTap: () {
                      navigateToScreen(context, const Dashboard(),
                          clearPreviousRoutes: true);
                    },
                  ),
                ),
              ],
            ),
            spacing(height: 10),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    title: trans(context, key: 'enter_manually'),
                    fontSize: 16,
                    color: Colors.transparent,
                    yPadding: 12,
                    textColor: ColorHelper.titleSmallColor(context),
                    onTap: () {
                      _enterManually(context);
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  /// Navigates to the screen for entering location manually.
  void _enterManually(BuildContext context) {
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
