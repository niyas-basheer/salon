import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/data/reviews_data.dart';
import 'package:salon_app/presentation/salon/widgets/rating_card.dart';
import 'package:salon_app/presentation/widgets/custom_button.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// Widget to display reviews and ratings for a salon.
class RatingReviewsWidget extends StatelessWidget {
  /// Constructs a [RatingReviewsWidget].
  const RatingReviewsWidget({super.key, this.salonData});

  /// Data representing the salon.
  final dynamic salonData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '${salonData['rating']}',
                    style: StyleHelper.displayMedium(context)
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  spacing(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RatingStars(
                          value: salonData['rating'],
                          starCount: 5,
                          starSize: 20,
                          maxValue: 5,
                          starSpacing: 7,
                          maxValueVisibility: false,
                          valueLabelVisibility: false,
                          animationDuration: const Duration(milliseconds: 1000),
                          starOffColor: ColorHelper.grey40Lite(context),
                          starColor: Colors.orangeAccent,
                        ),
                        spacing(height: 10),
                        Row(
                          children: [
                            spacing(width: 5),
                            Text(
                              '${trans(context, key: 'based_on')} ${salonData['reviews']} ${trans(context, key: 'ratings')}',
                              style: StyleHelper.titleSmall(context),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              spacing(height: 15),
              const Divider(),
            ],
          ),
        ),
        spacing(height: 15),
        listWidget(ReviewsData.list),
        Center(
          child: CustomButton(
            title: trans(context, key: 'load_more'),
            textColor: Theme.of(context).primaryColor,
            color: Colors.transparent,
            onTap: () {},
          ),
        ),
      ],
    );
  }

  /// Builds the list of review cards.
  Widget listWidget(List<dynamic> list) {
    return ListView.builder(
      itemCount: list.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      itemBuilder: (context, index) {
        return RatingCard(data: list[index]);
      },
    );
  }
}
