import 'package:flutter/material.dart';
import 'package:salon_app/core/constants/image_type_const.dart';
import 'package:salon_app/core/themes/colors.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/data/specialist_list_data.dart';
import 'package:salon_app/presentation/widgets/image_widget.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// TopSpecialist displays a list of top specialists.
class TopSpecialistAtHome extends StatelessWidget {
  /// Constructor for the TopSpecialist widget.
  const TopSpecialistAtHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildListWidget(context, SpecialListData.list),
        ],
      ),
    );
  }

  Widget _buildListWidget(BuildContext context, List<dynamic> list) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Implement navigation to specialist details page
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                width: 115,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: ImageWidget(
                            image: list[index]['profile_photo'],
                            fit: BoxFit.cover,
                            width: 135,
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
            ),
          );
        },
      ),
      
    );
    
  }
}
