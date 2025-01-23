import 'package:flutter/material.dart';
import 'package:salon_app/core/constants/image_type_const.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/data/salon_gallery_data.dart';
import 'package:salon_app/presentation/common/gallery_view.dart';
import 'package:salon_app/presentation/widgets/image_widget.dart';

/// Widget to display a grid of salon images.
class SalonGallery extends StatelessWidget {
  /// Constructs a [SalonGallery] widget.
  const SalonGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: _buildGalleryWidget(context, SalonGalleryData.list),
    );
  }

  /// Builds the grid of salon images.
  Widget _buildGalleryWidget(BuildContext context, List<dynamic> list) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridView.builder(
        itemCount: list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              navigateToScreen(
                context,
                GalleryView(
                  images: List<String>.from(list.map((e) => e['image'])),
                  currentIndex: index,
                ),
              );
            },
            behavior: HitTestBehavior.opaque,
            child: _buildGalleryItem(list[index]),
          );
        },
      ),
    );
  }

  /// Builds a single item in the gallery grid.
  Widget _buildGalleryItem(Map<String, dynamic> item) {
    return ImageWidget(
      image: item['image'],
      height: 100,
      width: 120,
      type: ImageType.asset,
      fit: BoxFit.cover,
    );
  }
}
