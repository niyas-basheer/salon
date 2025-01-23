import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/checkout/widgets/booking_summery_widget.dart';
import 'package:salon_app/presentation/checkout/widgets/check_salon_detail_widget.dart';
import 'package:salon_app/presentation/checkout/widgets/selected_payment_method.dart';
import 'package:salon_app/presentation/payment/payment_success.dart';
import 'package:salon_app/presentation/widgets/action_icon_button.dart';
import 'package:salon_app/presentation/widgets/custom_button.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// A screen widget for reviewing and confirming booking details before payment.
class CheckoutScreen extends StatefulWidget {
  /// Constructor for the [CheckoutScreen] class.
  const CheckoutScreen({
    super.key,
    required this.salonData,
    required this.bookingDate,
    required this.bookingTime,
    required this.services,
    this.specialist,
  });

  /// Data related to the salon.
  final dynamic salonData;

  /// Date of the booking.
  final DateTime bookingDate;

  /// Time of the booking.
  final String bookingTime;

  /// List of services to be booked.
  final List<dynamic> services;

  /// Specialist for the booking, if any.
  final String? specialist;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    titleStyle ??= Theme.of(context)
        .textTheme
        .titleMedium
        ?.copyWith(fontWeight: FontWeight.w600);

    return Scaffold(
      appBar: _buildAppBar(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          CheckoutSalonDetailWidget(
            salonData: widget.salonData,
            bookingDate: widget.bookingDate,
            bookingTime: widget.bookingTime,
            specialist: widget.specialist,
          ),
          const SelectedPaymentMethod(),
          BookingSummeryWidget(
            salonData: widget.salonData,
            services: widget.services,
          ),
          spacing(height: 20),
        ],
      ),
    );
  }

  /// Builds the app bar for the checkout screen.
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        trans(context, key: 'review_summary'),
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

  /// Builds the bottom navigation bar for the checkout screen.
  Widget _buildBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              title: trans(context, key: 'confirm_payment'),
              elevation: 0,
              yPadding: 15,
              fontSize: 15,
              fontWeight: FontWeight.w600,
              onTap: () {
                navigateToScreen(
                  context,
                  const PaymentSuccess(),
                  clearPreviousRoutes: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
