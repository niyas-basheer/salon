import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/constants/assets_const.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/widgets/action_icon_button.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// A screen widget for selecting payment methods.
class PaymentMethodScreen extends StatefulWidget {
  /// Constructor for the [PaymentMethodScreen] class.
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  TextStyle? titleLarge;
  TextStyle? titleMedium;
  TextStyle? titleSmall;

  @override
  Widget build(BuildContext context) {
    titleLarge = StyleHelper.titleLarge(context)
        ?.copyWith(fontWeight: FontWeight.w600, fontSize: 20);

    titleMedium =
        StyleHelper.titleMedium(context)?.copyWith(fontWeight: FontWeight.w600);

    titleSmall = StyleHelper.titleSmall(context);

    return Scaffold(
      appBar: _buildAppBar(context),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          spacing(height: 5),
          Text(trans(context, key: 'pay_on_cash'), style: titleLarge),
          spacing(height: 15),
          _buildPaymentMethod(
              trans(context, key: 'cash'), LucideIcons.banknote),
          spacing(height: 25),
          Text(trans(context, key: 'credit_debit_card'), style: titleLarge),
          spacing(height: 15),
          _buildCreditDebitCards(),
          spacing(height: 25),
          Text(trans(context, key: 'more_payment_options'), style: titleLarge),
          spacing(height: 15),
          _buildMorePaymentOptions(),
        ],
      ),
    );
  }

  /// Builds a payment method item.
  Widget _buildPaymentMethod(String title, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(15),
        border: getBoxBorder(context),
      ),
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.all(5),
      child: ListTile(
        onTap: () {},
        title: SizedBox(width: 30, child: Text(title, style: titleMedium)),
        leading: Icon(icon),
        trailing: const Icon(Icons.radio_button_off),
      ),
    );
  }

  /// Builds the section for credit and debit cards.
  Widget _buildCreditDebitCards() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(15),
        border: getBoxBorder(context),
      ),
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          _buildCreditDebitCard(
              title: 'Visa',
              subtitle: '${trans(context, key: 'ending')} 2546',
              image: AssetsConst.visaLogo),
          _buildCreditDebitCard(
              title: 'MasterCard',
              subtitle: '${trans(context, key: 'ending')} 3540',
              image: AssetsConst.masterCardLogo),
          _buildCreditDebitCard(
              title: trans(context, key: 'add_new_card'),
              icon: LucideIcons.creditCard),
        ],
      ),
    );
  }

  /// Builds a credit or debit card item.
  Widget _buildCreditDebitCard(
      {required String title,
      String? subtitle,
      String? image,
      IconData? icon}) {
    return ListTile(
      onTap: () {},
      title: Text(title, style: titleMedium),
      subtitle: subtitle != null ? Text(subtitle, style: titleSmall) : null,
      leading: icon != null
          ? SizedBox(width: 30, child: Icon(icon))
          : Image.asset(image ?? '', width: 30),
      trailing: const Icon(Icons.radio_button_off),
    );
  }

  /// Builds the section for more payment options.
  Widget _buildMorePaymentOptions() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(15),
        border: getBoxBorder(context),
      ),
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          _buildPaymentOption('Paypal', AssetsConst.paypalFlatLogo),
          _buildPaymentOption('Google Pay', AssetsConst.googlePayLogo),
          _buildPaymentOption('Apple Pay', AssetsConst.applePayLogo),
        ],
      ),
    );
  }

  /// Builds a payment option item.
  Widget _buildPaymentOption(String title, String image) {
    return ListTile(
      onTap: () {},
      title: Text(title, style: titleMedium),
      leading: Image.asset(image, width: 30),
      trailing: const Icon(Icons.radio_button_off),
    );
  }

  /// Builds the app bar for the screen.
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        trans(context, key: 'payment_method'),
        style: StyleHelper.titleLarge(context)
            ?.copyWith(fontWeight: FontWeight.w500),
      ),
      centerTitle: true,
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
}
