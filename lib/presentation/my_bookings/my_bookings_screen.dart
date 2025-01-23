import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/constants/booking_status_const.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/data/bookings_data.dart';
import 'package:salon_app/presentation/my_bookings/widgets/bookings_list_widget.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildTabView(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text(
        trans(context, key: 'my_bookings'),
        style: StyleHelper.headlineSmall(context)
            ?.copyWith(fontWeight: FontWeight.w500),
      ),
      surfaceTintColor: Colors.transparent,
      actions: [
        IconButton(
          icon: const Icon(LucideIcons.search),
          onPressed: () {},
        ),
        spacing(width: 12),
      ],
      bottom: TabBar(tabs: [
        Tab(
          child: Text(trans(context, key: 'upcoming')),
        ),
        Tab(
          child: Text(trans(context, key: 'completed')),
        ),
        Tab(
          child: Text(trans(context, key: 'cancelled')),
        )
      ]),
    );
  }

  Widget _buildTabView() {
    return const TabBarView(physics: NeverScrollableScrollPhysics(), children: [
      BookingListWidget(
          list: BookingsData.list, type: BookingStatusConst.pending),
      BookingListWidget(
          list: BookingsData.list, type: BookingStatusConst.completed),
      BookingListWidget(list: [], type: BookingStatusConst.cancelled),
    ]);
  }
}
