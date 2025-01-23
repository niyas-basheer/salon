import 'package:flutter/material.dart';
import 'package:salon_app/core/constants/image_type_const.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/widgets/image_widget.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// [OnBoardingContent] displays the content of each onboarding screen.
class OnBoardingContent extends StatelessWidget {
  /// Data for the onboarding screen.
  final dynamic data;

  /// Constructor for the [OnBoardingContent].
  const OnBoardingContent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ImageWidget(
                height: 400,
                width: double.infinity,
                image: data['image'],
                type: ImageType.asset,
                borderRadius: BorderRadius.circular(20),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  spacing(height: 20),
                  Text(
                    trans(context, key: data['title']),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: StyleHelper.titleLarge(context)?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  spacing(height: 10),
                  Text(
                    trans(context, key: data['description']),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: StyleHelper.titleMedium(context)?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: ColorHelper.titleSmallColor(context),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
