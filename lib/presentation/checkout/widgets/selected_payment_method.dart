import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/constants/assets_const.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/payment/payment_method.dart';
import 'package:salon_app/presentation/widgets/custom_button.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// A Flutter widget for displaying and selecting a payment method.
class SelectedPaymentMethod extends StatefulWidget {
  /// Constructor for the [SelectedPaymentMethod] class.
  const SelectedPaymentMethod({super.key});

  @override
  State<SelectedPaymentMethod> createState() => _SelectedPaymentMethodState();
}

class _SelectedPaymentMethodState extends State<SelectedPaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        spacing(height: 12),
        _buildPaymentMethodRow(),
        spacing(height: 3),
        _buildPaymentMethodDetails(),
      ],
    );
  }

  /// Builds the row containing the payment method text and change button.
  Widget _buildPaymentMethodRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(trans(context, key: 'payment_method'),
            style: StyleHelper.titleMedium(context)
                ?.copyWith(fontWeight: FontWeight.w600)),
        CustomButton(
          title: trans(context, key: 'change'),
          color: Colors.transparent,
          textColor: Theme.of(context).primaryColor,
          rightIcon: LucideIcons.chevronRight,
          xPadding: 0,
          onTap: () {
            navigateToScreen(context, const PaymentMethodScreen());
          },
        ),
      ],
    );
  }

  /// Builds the payment method details container.
  Widget _buildPaymentMethodDetails() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade400),
      ),
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Paypal',
                  style: StyleHelper.titleMedium(context)?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                spacing(height: 3),
                Text('testaccount@mymail.com',
                    style: StyleHelper.titleSmall(context)),
              ],
            ),
          ),
          Image.asset(
            AssetsConst.paypalLogo,
            height: 50,
          ),
        ],
      ),
    );
  }
}
