import 'package:flutter/material.dart';
import 'package:salon_app/core/constants/image_type_const.dart';
import 'package:salon_app/core/themes/colors.dart';
import 'package:salon_app/data/specialist_list_data.dart';
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
        // Center(
        //   child: GestureDetector(
        //     onTap: () {
        //       navigateToScreen(context, const AllSpecialists());
        //     },
        //     behavior: HitTestBehavior.opaque,
        //     child: Text(
        //       trans(context, key: 'view_more'),
        //       style: StyleHelper.titleSmall(context)
        //           ?.copyWith(color: ColorHelper.primaryToWhite(context)),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  /// Builds the list of specialists.
  Widget _buildListWidget(List<dynamic> list) {
    return SizedBox(
      height: 700,
      child: GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3, // Number of columns
    crossAxisSpacing: 10, // Spacing between columns
    mainAxisSpacing: 40, // Spacing between rows
    childAspectRatio: 0.8, // Adjust aspect ratio to fit content
  ),
  itemCount: list.length,
  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
  itemBuilder: (context, index) {
    return GestureDetector(
      onTap: () {
        // Implement navigation to specialist details page
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: ImageWidget(
                    image: list[index]['profile_photo'],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 70,
                    borderRadius: BorderRadius.circular(20),
                    type: ImageType.asset,
                  ),
                ),
              ),
              spacing(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  list[index]['first_name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      list[index]["pesiant"],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  spacing(width: 8),
                  Text(
                    list[index]["Rating"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Icon(
                    Icons.star,
                    size: 14,
                    color: AppColors.secondary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  },
),

    );
  }
}
