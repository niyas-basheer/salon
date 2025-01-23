import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:salon_app/core/constants/assets_const.dart';
import 'package:salon_app/core/constants/image_type_const.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/widgets/image_widget.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// A widget to display a rating card.
class RatingCard extends StatelessWidget {
  /// Constructs a [RatingCard] widget.
  const RatingCard({super.key, this.data});

  /// Data representing the rating card.
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildUserImage(),
          spacing(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildUserNameAndTime(context),
                spacing(height: 5),
                _buildRatingStars(context),
                spacing(height: 10),
                Text(
                  data['review'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: StyleHelper.titleSmall(context),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Builds the user image widget.
  Widget _buildUserImage() {
    return ImageWidget(
      image: data['image'],
      fit: BoxFit.cover,
      width: 40,
      height: 40,
      borderRadius: BorderRadius.circular(100),
      placeholder: AssetsConst.avatarPlaceholder2,
      type: ImageType.network,
    );
  }

  /// Builds the user name and time widget.
  Widget _buildUserNameAndTime(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            data['name'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: StyleHelper.titleMedium(context),
          ),
        ),
        Text(
          timeAgoFormat(data['created_on']),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: StyleHelper.titleSmall(context),
        ),
      ],
    );
  }

  /// Builds the rating stars widget.
  Widget _buildRatingStars(BuildContext context) {
    return RatingStars(
      value: data['rating'],
      starCount: 5,
      starSize: 12,
      maxValue: 5,
      starSpacing: 2,
      maxValueVisibility: false,
      valueLabelVisibility: false,
      animationDuration: const Duration(milliseconds: 1000),
      valueLabelPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
      valueLabelMargin: const EdgeInsets.only(right: 8),
      starOffColor: ColorHelper.grey40Lite(context),
      starColor: Colors.orangeAccent,
    );
  }
}
