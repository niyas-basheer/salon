// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:salon_app/presentation/home/widgets/banner_slider.dart';
import 'package:salon_app/presentation/home/widgets/filter.dart';
import 'package:salon_app/presentation/home/widgets/home_app_bar.dart';
import 'package:salon_app/presentation/home/widgets/home_searchbar.dart';
import 'package:salon_app/presentation/home/widgets/home_toggle_bar.dart';
import 'package:salon_app/presentation/home/widgets/salon_near_me.dart';
import 'package:salon_app/presentation/home/widgets/services_widget.dart';
import 'package:salon_app/presentation/home/widgets/services_widget_horizontal.dart';
import 'package:salon_app/presentation/home/widgets/servies_container.dart';
import 'package:salon_app/presentation/home/widgets/servies_container_big.dart';
import 'package:salon_app/presentation/home/widgets/top_specialist.dart';
import 'package:salon_app/presentation/home/widgets/top_specialist_athome.dart';

/// The home page of the application.
class HomePage extends StatefulWidget {
  /// Constructs the [HomePage] widget.
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSpotbelt = true;
 
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
                CustomToggleBar(
                isSpotbelt: isSpotbelt,
                onToggle: (value) {
                  setState(() {
                    isSpotbelt = value;
                  });
                },
              ),
               if (isSpotbelt==true) Column(
                children: [
                  BannerSlider(),
                servies_container(),
                ServicesWidget(),
                SalonsNearMe(),
                TopSpecialist(),
                ],
                ) else Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
               
                  filter(text: 'Explore Services At Home',),
                  ServicesWidgetHorizontal(), 
                  SizedBox(height: 20,), 
                  servies_container_Big(),
              _buildPackageCard(),
               filter(text: 'Specialists',),
               TopSpecialistAtHome() 
                ]),
              
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/img/Glam it up!.png"),
                      SizedBox(height: 30),
                      Image.asset("assets/img/Crafted with ❤ for beauty, brilliance, and you..png"),
                    ],
                  ),
                ),
                 Image.asset("assets/img/Group 421.png"),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

 Widget _buildPackageCard() {
  List<Map<String, String>> packages = [
    {
      'title': 'New Style',
      'subtitle': 'Premium Haircut Package',
      'price': '₹3999 • 2hrs',
      'details': 'Includes shampoo, deep conditioning...'
    },
    {
      'title': 'Grooming Special',
      'subtitle': 'Luxury Beard & Haircut',
      'price': '₹2999 • 1.5hrs',
      'details': 'Includes beard styling, facial massage...'
    },
    {
      'title': 'Relaxation Package',
      'subtitle': 'Hair Spa & Massage',
      'price': '₹4999 • 2.5hrs',
      'details': 'Includes scalp massage, hydrating spa...'
    },
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Exclusive Home Packages',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        height: 130, // Adjust height based on card content
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: packages.length,
          itemBuilder: (context, index) {
            return Container(
              width: 330, // Adjust width for better spacing
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    packages[index]['title']!,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(
                    packages[index]['subtitle']!,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            packages[index]['price']!,
                            style: const TextStyle(color: Colors.orange),
                          ),
                          Text(
                            packages[index]['details']!,
                            style: const TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                      const Icon(Icons.add_circle_outline, color: Colors.orange),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}
