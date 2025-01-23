import 'package:flutter/material.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/data/booking_time_data.dart';
import 'package:salon_app/presentation/widgets/custom_button.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// This widget displays a horizontal list of time slots, allowing the user to choose a specific time.
class BookingTimePicker extends StatefulWidget {
  /// Constructor for the [BookingTimePicker] class.
  ///
  /// The [key] parameter is optional and is used to uniquely identify the widget.
  /// The [onChanged] callback is invoked when the selected time changes.
  const BookingTimePicker({super.key, required this.onChanged});

  /// Callback function called when the selected time changes.
  final ValueChanged<String> onChanged;

  @override
  State<BookingTimePicker> createState() => BookingTimePickerState();
}

class BookingTimePickerState extends State<BookingTimePicker> {
  /// The currently selected time slot.
  int? selectedTime = 1;

  @override
  void initState() {
    widget.onChanged(BookingTimeData.list.first['time']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Time',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        spacing(height: 10),
        buildServiceList(data: BookingTimeData.list)
      ],
    );
  }

  /// Builds the list of available time slots.
  Widget buildServiceList({required List<dynamic> data}) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemBuilder: (context, index) {
          bool selected = data[index]['id'] == selectedTime;
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: CustomButton(
                title: '${data[index]['time']}',
                lined: true,
                fontSize: StyleHelper.titleMedium(context)?.fontSize,
                color: selected
                    ? Theme.of(context).primaryColor
                    : Colors.transparent,
                elevation: 0,
                textColor: selected
                    ? Colors.white
                    : StyleHelper.titleLarge(context)?.color,
                onTap: () {
                  setState(() {
                    selectedTime = data[index]['id'];
                    widget.onChanged(data[index]['time']);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
