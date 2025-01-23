import 'package:flutter/material.dart';
import 'package:salon_app/core/constants/image_type_const.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/data/specialist_list_data.dart';
import 'package:salon_app/presentation/salon/widgets/all_specialists.dart';
import 'package:salon_app/presentation/widgets/image_widget.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// A widget to display a list of specialists.
class OurSpecialist extends StatelessWidget {
  const OurSpecialist({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildListWidget(SpecialListData.list),
        spacing(height: 20),
        Center(
          child: GestureDetector(
            onTap: () {
              navigateToScreen(context, const AllSpecialists());
            },
            behavior: HitTestBehavior.opaque,
            child: Text(
              trans(context, key: 'view_more'),
              style: StyleHelper.titleSmall(context)
                  ?.copyWith(color: ColorHelper.primaryToWhite(context)),
            ),
          ),
        ),
      ],
    );
  }

  /// Builds the list of specialists.
  Widget _buildListWidget(List<dynamic> list) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemBuilder: (context, index) {
          return SizedBox(
            width: 80,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  ImageWidget(
                    image: list[index]['profile_photo'],
                    fit: BoxFit.cover,
                    width: 70,
                    height: 70,
                    borderRadius: BorderRadius.circular(100),
                    type: ImageType.asset,
                  ),
                  spacing(height: 5),
                  Text(
                    list[index]['first_name'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
