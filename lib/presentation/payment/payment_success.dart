import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:salon_app/core/constants/assets_const.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/dashboard.dart';
import 'package:salon_app/presentation/widgets/custom_button.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// A screen widget displayed when a payment is successfully completed.
class PaymentSuccess extends StatefulWidget {
  /// Constructor for the [PaymentSuccess] class.
  const PaymentSuccess({super.key});

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSuccessAnimation(),
            spacing(height: 10),
            Text(
              trans(context, key: 'payment_successful'),
              textAlign: TextAlign.center,
              style: StyleHelper.headlineMedium(context)
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            spacing(height: 10),
            Text(
              trans(context,
                  key: 'your_booking_has_been_successfully_completed'),
              textAlign: TextAlign.center,
              style: StyleHelper.titleMedium(context)
                  ?.copyWith(color: ColorHelper.titleSmallColor(context)),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the Lottie animation for success.
  Widget _buildSuccessAnimation() {
    return Center(
      child: Transform.scale(
        scale: 1.8,
        child: Lottie.asset(
          AssetsConst.doneLottie,
          height: 180,
          repeat: false,
        ),
      ),
    );
  }

  /// Builds the bottom navigation bar action buttons.
  Widget _buildBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildButton(trans(context, key: 'download_receipt'), () {}),
          spacing(height: 10),
          _buildButton(trans(context, key: 'go_to_home'), () {
            navigateToScreen(context, const Dashboard(),
                clearPreviousRoutes: true);
          }, lined: true),
        ],
      ),
    );
  }

  /// Builds a custom button with the specified title and onTap callback.
  Widget _buildButton(String title, VoidCallback onTap, {bool lined = false}) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            title: title,
            elevation: 0,
            yPadding: 15,
            fontSize: 15,
            fontWeight: FontWeight.w600,
            lined: lined,
            color: lined ? Colors.transparent : null,
            textColor: lined ? ColorHelper.primaryToWhite(context) : null,
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}
