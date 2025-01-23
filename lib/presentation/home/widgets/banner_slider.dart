import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:salon_app/core/constants/image_type_const.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/data/home_banner_data.dart';
import 'package:salon_app/presentation/widgets/image_widget.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// BannerSlider displays a carousel slider for showcasing banners.
class BannerSlider extends StatelessWidget {
  /// Constructor for the BannerSlider widget.
  const BannerSlider({super.key});

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
              trans(context, key: '#SpecialForYou'),
              style: StyleHelper.titleMedium(context)
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          spacing(height: 15),
          CarouselSlider.builder(
            itemCount: HomeBannerData.list.length,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) {
              final imageUrl = HomeBannerData.list[index]['image'];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade800),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ImageWidget(
                    image: imageUrl,
                    type: ImageType.asset,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(20),
                    cachedNetworkImage: true,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 0.9,
              height: 180,
              enableInfiniteScroll: false,
            ),
          ),
        ],
      ),
    );
  }
}
