import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/styles.dart';

/// This widget displays a timeline of dates and allows the user to pick a date from an infinite range.
class BookingDatePicker extends StatefulWidget {
  /// Constructor for the [BookingDatePicker] class.
  ///
  /// The [key] parameter is optional and is used to uniquely identify the widget.
  /// The [onChanged] parameter is a callback function that is called when the selected date changes.
  const BookingDatePicker({super.key, required this.onChanged});

  /// Callback function called when the selected date changes.
  final ValueChanged<DateTime> onChanged;

  @override
  State<BookingDatePicker> createState() => _BookingDatePickerState();
}

class _BookingDatePickerState extends State<BookingDatePicker> {
  /// Controller for the infinite date timeline.
  late final EasyInfiniteDateTimelineController _controller;

  /// The focus date for the timeline.
  late DateTime _focusDate;

  @override
  void initState() {
    super.initState();
    _controller = EasyInfiniteDateTimelineController();
    _focusDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            trans(context, key: 'date'),
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        EasyInfiniteDateTimeLine(
          controller: _controller,
          itemBuilder: (context, date, isSelected, onTap) {
            return InkResponse(
                onTap: onTap, child: _buildDateItem(context, date, isSelected));
          },
          timeLineProps: const EasyTimeLineProps(hPadding: 15),
          headerBuilder: _buildHeader,
          dayProps: const EasyDayProps(width: 105, height: 65),
          firstDate: DateTime.now(),
          focusDate: _focusDate,
          lastDate: DateTime(2049, 12, 31),
          onDateChange: _onDateChange,
        ),
      ],
    );
  }

  /// Builds a date item widget for the timeline.
  Widget _buildDateItem(
    BuildContext context,
    DateTime date,
    bool isSelected,
  ) {
    final formattedFullDate = _formattedDate(date);
    final formattedNowDate = _formattedDate(DateTime.now());
    final today = formattedFullDate == formattedNowDate;

    final getDay = _getDay(date);

    final getDate = _getDate(date);

    final getMonth = _getMonth(date);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        border: Border.all(
          color: today
              ? Theme.of(context).primaryColor
              : Colors.grey.withOpacity(0.3),
        ),
        color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            getDay.toUpperCase(),
            style: StyleHelper.titleSmall(context)?.copyWith(
              color: isSelected ? Colors.white.withOpacity(0.8) : null,
            ),
          ),
          Text(
            '$getDate $getMonth',
            style: StyleHelper.titleMedium(context)?.copyWith(
              color: isSelected ? Colors.white : null,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the header widget for the timeline.
  Widget _buildHeader(BuildContext context, DateTime date) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 5),
      child: Row(
        children: [
          IconButton(
            onPressed: () => _updateFocusDate(-1),
            icon: const Icon(Icons.chevron_left),
          ),
          Expanded(
            child: Center(
              child: Text(
                DateFormat('EEEE dd, yyyy').format(date),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          IconButton(
            onPressed: () => _updateFocusDate(1),
            icon: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }

  /// Callback function called when the selected date changes.
  void _onDateChange(DateTime selectedDate) {
    setState(() {
      _focusDate = selectedDate;
      widget.onChanged(selectedDate);
    });
  }

  /// Updates the focus date by a specified number of months.
  void _updateFocusDate(int months) {
    setState(() {
      final now = _focusDate;
      final nextMonth = DateTime(now.year, now.month + months, now.day);
      _focusDate =
          nextMonth.isAfter(DateTime.now()) ? nextMonth : DateTime.now();
      _controller.animateToDate(_focusDate);
    });
  }

  /// Formats the given [date] to a string in 'yyyy-MM-dd' format.
  String _formattedDate(DateTime date) => DateFormat('yyyy-MM-dd').format(date);

  String _getDay(DateTime date) => DateFormat('EEE').format(date);

  String _getDate(DateTime date) => DateFormat('d').format(date);

  String _getMonth(DateTime date) => DateFormat('MMM').format(date);
}
