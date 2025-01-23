import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/constants/assets_const.dart';
import 'package:salon_app/core/constants/image_type_const.dart';
import 'package:salon_app/core/themes/colors.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/salon/salon_detail_screen.dart';
import 'package:salon_app/presentation/widgets/image_widget.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

class SalonCard extends StatelessWidget {
  const SalonCard({super.key, this.data, this.isFav = false});

  final dynamic data;
  final bool isFav;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Stack(
              children: [
                ImageWidget(
                    image: data['image'],
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                    cachedNetworkImage: true,
                    placeholder: AssetsConst.iconPlaceholder,
                    type: ImageType.asset),
                if (isFav)
                  Positioned(
                    top: 5,
                    left: 5,
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        padding: const EdgeInsets.all(7),
                        child: const Icon(Icons.favorite, color: Colors.red)),
                  ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
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
                          color: ColorHelper.titleMediumColor(context)),
                    ),
                    spacing(height: 8),
                    Text(
                      '${data['address'] ?? 'N/A'}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 13,
                          color: ColorHelper.titleSmallColor(context)),
                    ),
                    spacing(height: 8),
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
                              color: ColorHelper.titleMediumColor(context)),
                        ),
                        spacing(width: 5),
                        Text(
                          '(${data['reviews'] ?? 'N/A'})',
                          style: TextStyle(
                              fontSize: 13,
                              color: ColorHelper.titleSmallColor(context)),
                        ),
                        spacing(width: 12),
                        const Icon(
                          LucideIcons.tag,
                          size: 15,
                          color: AppColors.primary,
                        ),
                        spacing(width: 5),
                        Text(
                          '(${data['discount'] ?? 'N/A'})',
                          style: TextStyle(
                              fontSize: 13,
                              color: ColorHelper.titleMediumColor(context)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
