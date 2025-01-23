import 'package:flutter/material.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// A Flutter widget for displaying salon details during the checkout process.
class CheckoutSalonDetailWidget extends StatefulWidget {
  /// Constructor for the [CheckoutSalonDetailWidget] class.
  const CheckoutSalonDetailWidget({
    super.key,
    required this.salonData,
    required this.bookingDate,
    required this.bookingTime,
    this.specialist,
  });

  /// Salon data to be displayed.
  final dynamic salonData;

  /// Date of the booking.
  final DateTime bookingDate;

  /// Time of the booking.
  final String bookingTime;

  /// Specialist of the booking.
  final String? specialist;

  @override
  State<CheckoutSalonDetailWidget> createState() =>
      _CheckoutSalonDetailWidgetState();
}

class _CheckoutSalonDetailWidgetState extends State<CheckoutSalonDetailWidget> {
  late dynamic salon;

  @override
  void initState() {
    salon = widget.salonData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spacing(height: 5),
        Text(
          trans(context, key: 'salon_detail'),
          style: StyleHelper.titleMedium(context)
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        spacing(height: 15),
        _buildSalonDetails(),
      ],
    );
  }

  /// Builds the salon details container.
  Widget _buildSalonDetails() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(15),
        border: getBoxBorder(context),
      ),
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _buildDetailItem(
              key: trans(context, key: 'salon'), value: '${salon['title']}'),
          spacing(height: 10),
          _buildDetailItem(
              key: trans(context, key: 'address'),
              value: '${salon['address']}'),
          spacing(height: 10),
          _buildDetailItem(
              key: trans(context, key: 'phone'), value: '${salon['phone']}'),
          spacing(height: 10),
          _buildDetailItem(
              key: trans(context, key: 'booking_date'),
              value: formatDateTime(date: widget.bookingDate.toString())),
          spacing(height: 10),
          _buildDetailItem(
              key: trans(context, key: 'booking_hours'),
              value: widget.bookingTime),
          if (widget.specialist != null) ...[
            spacing(height: 10),
            _buildDetailItem(
                key: trans(context, key: 'specialist'),
                value: '${widget.specialist}'),
          ]
        ],
      ),
    );
  }

  /// Builds a single detail item row.
  Widget _buildDetailItem({required String key, required String value}) {
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
            style: StyleHelper.titleMedium(context),
          ),
        ),
      ],
    );
  }
}
