import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/bloc/theme_bloc/theme_bloc.dart';
import 'package:salon_app/core/themes/colors.dart';
import 'package:salon_app/core/constants/font_const.dart';
import 'package:salon_app/presentation/account/account_screen.dart';
import 'package:salon_app/presentation/explore/explore_page.dart';
import 'package:salon_app/presentation/home/home_page.dart';
import 'package:salon_app/presentation/my_bookings/my_bookings_screen.dart';

/// A StatefulWidget that represents the dashboard of the application.
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  // List of widgets to display in the dashboard.
  final List<Widget> widgetsList = [
    const HomePage(),
     ExplorePage(),
    const MyBookingsScreen(),
    //const ChatsScreen(),
    const AccountScreen(),
  ];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsList[controller.index],
      bottomNavigationBar: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: TabBar(
              controller: controller,
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.grey80,
              labelStyle: const TextStyle(
                fontFamily: FontConstants.manrope,
                fontWeight: FontWeight.w500,
              ),
              onTap: (index) {
                setState(() {});
              },
              tabs: [
                tabItem(icon: LucideIcons.home),
                tabItem(icon: LucideIcons.search),
                tabItem(icon: LucideIcons.calendarDays),
                // tabItem(icon: LucideIcons.messageCircle),
                tabItem(icon: LucideIcons.user),
              ],
            ),
          );
        },
      ),
    );
  }

  /// Constructs a tab item widget with the given icon.
  Widget tabItem({required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Tab(
        icon: Center(
          child: Icon(icon),
        ),
      ),
    );
  }
}
