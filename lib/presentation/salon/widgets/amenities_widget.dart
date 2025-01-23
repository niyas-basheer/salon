import 'package:flutter/material.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/data/amenities_data.dart';
import 'package:salon_app/presentation/widgets/custom_button.dart';

/// Widget to display amenities.
class AmenitiesWidget extends StatelessWidget {
  /// Constructor for the [AmenitiesWidget] class.
  const AmenitiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Wrap(
        spacing: 10,
        runSpacing: 5,
        children: [
          for (var item in AmenitiesData.list)
            _buildAmenityButton(context, item),
        ],
      ),
    );
  }

  /// Builds a button for each amenity item.
  Widget _buildAmenityButton(BuildContext context, Map<String, dynamic> item) {
    return CustomButton(
      title: item['title'],
      leftIcon: item['icon'],
      color: ColorHelper.grey20Lite(context),
      textColor: ColorHelper.titleMediumColor(context),
      onTap: null,
    );
  }
}
