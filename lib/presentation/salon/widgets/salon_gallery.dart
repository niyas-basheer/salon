import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:salon_app/data/salon_gallery_data.dart';
import 'package:salon_app/presentation/explore/explore_page.dart';

/// Widget to display a grid of salon images.
class SalonGallery extends StatelessWidget {
  /// Constructs a [SalonGallery] widget.
  const SalonGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: _buildGalleryWidget(context, SalonGalleryData.list),
    );
  }
  
  // /// Builds the grid of salon images.
  Widget _buildGalleryWidget(BuildContext context, List<dynamic> list) {
    return 
  // ClipRRect(
  //     borderRadius: BorderRadius.circular(15),
  //     child: GridView.builder(
  //       itemCount: list.length,
  //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 2,
  //         mainAxisSpacing: 5,
  //         crossAxisSpacing: 5,
  //       ),
  //       shrinkWrap: true,
  //       physics: const NeverScrollableScrollPhysics(),
  //       padding: EdgeInsets.zero,
  //       itemBuilder: (BuildContext context, int index) {
  //         return GestureDetector(
  //           onTap: () {
  //             navigateToScreen(
  //               context,
  //               GalleryView(
  //                 images: List<String>.from(list.map((e) => e['image'])),
  //                 currentIndex: index,
  //               ),
  //             );
  //           },
  //           behavior: HitTestBehavior.opaque,
  //           child: _buildGalleryItem(list[index]),
  //         );
  //       },
  //     ),
  //   );
  
SizedBox(
  height: 600,
  child: MasonryGridView.builder(
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3 ), // Two columns
                itemCount: mediaItems.length,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5 ,
                itemBuilder: (context, index) {
                  final item = mediaItems[index];
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      
                      children: [
                        Image.asset(
                          item['image'] as String, 
                          fit: BoxFit.cover,
                        ),
                        if (item['isVideo'] == true)
                          const Positioned.fill(
            child: Center(
              child: Icon(
                Icons.play_circle_fill,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),
                      ],
                    ),
                  );
                },
              ),
);
  }
}
