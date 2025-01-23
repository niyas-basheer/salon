import 'package:flutter/material.dart';
import 'package:salon_app/presentation/home/widgets/banner_slider.dart';
import 'package:salon_app/presentation/home/widgets/home_app_bar.dart';
import 'package:salon_app/presentation/home/widgets/home_searchbar.dart';
import 'package:salon_app/presentation/home/widgets/salon_near_me.dart';
import 'package:salon_app/presentation/home/widgets/services_widget.dart';
import 'package:salon_app/presentation/home/widgets/servies_container.dart';
import 'package:salon_app/presentation/home/widgets/top_specialist.dart';

/// The home page of the application.
class HomePage extends StatefulWidget {
  /// Constructs the [HomePage] widget.
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HomeAppBar(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children:  [
                HomeSearchbar(),
                BannerSlider(),
                servies_container(),
                ServicesWidget(),
                SalonsNearMe(),
                TopSpecialist(),
                SizedBox(height: 20),
                // Adjust the height according to your design
              ],
            ),
          ),
        ],
      ),
    );
  }
}
