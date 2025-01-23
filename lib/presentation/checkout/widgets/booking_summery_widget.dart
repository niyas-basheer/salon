import 'package:flutter/material.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// A widget for displaying booking summary details.
class BookingSummeryWidget extends StatefulWidget {
  /// Constructor for the [BookingSummeryWidget] class.
  const BookingSummeryWidget({
    super.key,
    this.salonData,
    required this.services,
  });

  /// Data of the salon where the booking is made.
  final dynamic salonData;

  /// List of services selected for booking.
  final List<dynamic> services;

  @override
  State<BookingSummeryWidget> createState() => _BookingSummeryWidgetState();
}

class _BookingSummeryWidgetState extends State<BookingSummeryWidget> {
  double discount = 2.00;
  double tax = 1.00;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spacing(height: 20),
        Text(
          trans(context, key: 'summary'),
          style: StyleHelper.titleMedium(context)
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        spacing(height: 15),
        _buildSummaryDetails(),
      ],
    );
  }

  /// Builds the summary details container.
  Widget _buildSummaryDetails() {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(15),
          border: getBoxBorder(context)),
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _buildDetailItem(
            key:
                '${trans(context, key: 'services')} (${widget.services.length}x)',
            value: '\$${servicePrice()}',
          ),
          spacing(height: 10),
          _buildDetailItem(
              key: trans(context, key: 'discount'), value: '\$$discount'),
          spacing(height: 10),
          _buildDetailItem(key: trans(context, key: 'tax'), value: '\$$tax'),
          spacing(height: 10),
          Divider(
            color: Colors.grey.shade200,
          ),
          _buildDetailItem(
            key: trans(context, key: 'total'),
            value:
                '\$${calculateTotal(double.parse(servicePrice()), discount, tax)}',
            fontSize: StyleHelper.titleLarge(context)?.fontSize,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }

  /// Builds a single detail item row.
  Widget _buildDetailItem({
    required String key,
    required String value,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          key,
          style: StyleHelper.titleMedium(context)
              ?.copyWith(color: StyleHelper.titleSmall(context)?.color),
        ),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: StyleHelper.titleMedium(context)
                ?.copyWith(fontSize: fontSize, fontWeight: fontWeight),
          ),
        ),
      ],
    );
  }

  /// Calculates the total price of selected services.
  String servicePrice() {
    double total = 0.0;

    for (var subService in widget.services) {
      if (subService['price'] != null) {
        total += subService['price'];
      }
    }

    // Format the total as a string with two decimal places
    return total.toStringAsFixed(2);
  }

  /// Calculates the total amount to be paid after discount and tax.
  double calculateTotal(double servicePrice, double discount, double tax) {
    // Calculate total without tax
    double totalWithoutTax = servicePrice - discount;

    // Calculate total with tax
    double totalWithTax = totalWithoutTax + tax;

    return totalWithTax;
  }
}
