import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/constants/assets_const.dart';
import 'package:salon_app/core/constants/image_type_const.dart';
import 'package:salon_app/core/themes/colors.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/salon/salon_detail_screen.dart';
import 'package:salon_app/presentation/widgets/action_icon_button.dart';
import 'package:salon_app/presentation/widgets/image_widget.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// NearSalonCard displays a card with details about a nearby salon.
class NearSalonCard extends StatelessWidget {
  /// Data for the salon.
  final dynamic data;

  /// Constructor for the NearSalonCard.
  const NearSalonCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: GestureDetector(
        onTap: () {
          navigateToScreen(context, SalonDetailScreen(data: data));
        },
        behavior: HitTestBehavior.opaque,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardTheme.color,
            borderRadius: BorderRadius.circular(15),
            border: getBoxBorder(context),
          ),
          clipBehavior: Clip.hardEdge,
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              _topSection(context),
              const Expanded(child: Divider(height: 1)),
              _buildFooter(context)
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the top section of the card.
  Widget _topSection(BuildContext context) {
    return Row(
      children: [
        ImageWidget(
          image: data['image'],
          height: 75,
          width: 85,
          fit: BoxFit.cover,
          cachedNetworkImage: true,
          borderRadius: BorderRadius.circular(12),
          placeholder: AssetsConst.iconPlaceholder,
          type: ImageType.asset,
        ),
        spacing(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${data['title'] ?? 'N/A'}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: ColorHelper.titleMediumColor(context),
                ),
              ),
              spacing(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 19,
                    color: AppColors.secondary,
                  ),
                  spacing(width: 5),
                  Text(
                    '${data['rating'] ?? 'N/A'}',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: ColorHelper.titleMediumColor(context),
                    ),
                  ),
                  spacing(width: 5),
                  Text(
                    '(${data['reviews'] ?? 'N/A'})',
                    style: TextStyle(
                      fontSize: 13,
                      color: ColorHelper.titleSmallColor(context),
                    ),
                  ),
                  spacing(width: 12),
                  Text(
                    'Starting From',
                    style: TextStyle(
                      fontSize: 13,
                      color: ColorHelper.titleMediumColor(context),
                    ),
                  ),
                  spacing(width: 5),
                  Text(
                    '${data['price'] ?? 'N/A'}',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.amber,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  /// Builds the footer section of the card.
  Widget _buildFooter(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            '${data['address'] ?? 'N/A'}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13,
              color: ColorHelper.titleSmallColor(context),
            ),
          ),
        ),
       ElevatedButton( style: ElevatedButton.styleFrom(backgroundColor: Colors.amber,elevation: 0),
                      onPressed: () { 
                        navigateToScreen(context, SalonDetailScreen(data: data));
                      },
                       child: Text('Book Now',style: TextStyle(fontSize: 12,color: Colors.white),))
      ],
    );
  }
}
