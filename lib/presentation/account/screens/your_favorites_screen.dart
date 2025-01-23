import 'package:flutter/material.dart';
import 'package:salon_app/data/salons_data.dart';
import 'package:salon_app/presentation/explore/widgets/salon_card.dart';

/// A screen that displays a list of favorite salons.
class MyFavoritesScreen extends StatefulWidget {
  const MyFavoritesScreen({super.key});

  @override
  State<MyFavoritesScreen> createState() => _MyFavoritesScreenState();
}

class _MyFavoritesScreenState extends State<MyFavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: SalonsData.list.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SalonCard(data: SalonsData.list[index], isFav: true),
      ),
    );
  }
}
