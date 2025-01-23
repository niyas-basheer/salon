import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/themes/colors.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/my_bookings/widgets/booking_card.dart';
import 'package:salon_app/presentation/widgets/custom_button.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// Widget representing a list of bookings.
class BookingListWidget extends StatefulWidget {
  /// Constructor for the [BookingListWidget] class.
  const BookingListWidget({super.key, required this.list, required this.type});

  /// The list of bookings.
  final List<dynamic> list;

  /// The type of bookings to display, e.g., pending, completed, cancelled.
  final String type;

  @override
  State<BookingListWidget> createState() => _BookingListWidgetState();
}

class _BookingListWidgetState extends State<BookingListWidget> {
  List<dynamic> bookings = [];

  @override
  void initState() {
    bookings = widget.list
        .where((element) => element['status'] == widget.type)
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (bookings.isNotEmpty) {
      return _buildListWidget();
    } else {
      return _buildNoBookingWidget();
    }
  }

  /// Builds the list of bookings widget.
  Widget _buildListWidget() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: bookings.length,
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemBuilder: (context, index) =>
          BookingCard(data: bookings[index], type: widget.type),
    );
  }

  /// Builds the widget to display when no bookings are found.
  Widget _buildNoBookingWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryLight,
          ),
          child: const Padding(
            padding: EdgeInsets.all(12),
            child: Icon(
              LucideIcons.search,
              color: Colors.black87,
              size: 50,
            ),
          ),
        ),
        spacing(height: 25),
        Text(
          trans(context, key: 'no_bookings_found'),
          style: StyleHelper.titleLarge(context)
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        spacing(height: 15),
        Text(
          trans(context, key: 'no_salon_booked'),
          style: StyleHelper.titleSmall(context),
        ),
        spacing(height: 20),
        CustomButton(title: trans(context, key: 'explore_now'), onTap: () {}),
      ],
    );
  }
}
