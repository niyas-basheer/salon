import 'package:flutter/material.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/data/salons_data.dart';
import 'package:salon_app/presentation/home/widgets/near_salon_card.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// A widget to display a list of salons near the user's location.
class SalonsNearMe extends StatelessWidget {
  /// Constructs a [SalonsNearMe] widget.
  const SalonsNearMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              trans(context, key: 'Top salons'),
              style: StyleHelper.titleMedium(context)
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          spacing(height: 15),
          _buildListWidget(context, SalonsData.list),
        ],
      ),
    );
  }

  /// Builds the list of salons near the user's location.
  Widget _buildListWidget(BuildContext context, List<dynamic> list) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: NearSalonCard(data: list[index]),
          );
        },
      ),
    );
  }
}
