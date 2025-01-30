import 'package:flutter/material.dart';
import 'package:salon_app/core/constants/image_type_const.dart';
import 'package:salon_app/core/themes/colors.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/data/services_list_data.dart';
import 'package:salon_app/presentation/widgets/image_widget.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// ServicesWidget displays a grid of services.
class ServicesWidgetHorizontal extends StatelessWidget {
  /// Constructor for the ServicesWidget.
  const ServicesWidgetHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          spacing(height: 8),
         SizedBox(
            height: 120, // Adjust height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ServiceListData.list.length,
              itemBuilder: (context, index) {
                final service = ServiceListData.list[index];
                return GestureDetector(
                  onTap: () {
                    // Implement action when a service item is tapped
                  },
                  behavior: HitTestBehavior.opaque,
                  child: ServiceListItem(
                    icon: service['icon'],
                    title: service['title'],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

/// ServiceGridItem displays an individual service in the grid.
/// ServiceListItem displays an individual service in the horizontal list.
class ServiceListItem extends StatelessWidget {
  /// Icon for the service.
  final String icon;

  /// Title of the service.
  final String title;

  /// Constructor for the ServiceListItem.
  const ServiceListItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primary80, AppColors.primary],
              stops: [0, 1],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Center(
            child: ImageWidget(
              image: icon,
              height: 35,
              width: 35,
              imageColor: Colors.white,
              type: ImageType.asset,
            ),
          ),
        ),
        spacing(height: 5),
        SizedBox(
          width: 80, // Ensures text does not overflow
          child: Text(
            title,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: StyleHelper.labelLarge(context),
          ),
        ),
      ],
    );
  }
}

