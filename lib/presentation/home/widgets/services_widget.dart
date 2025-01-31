import 'package:flutter/material.dart';
import 'package:salon_app/core/constants/image_type_const.dart';
import 'package:salon_app/core/themes/colors.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/data/services_list_data.dart';
import 'package:salon_app/presentation/home/services.dart';
import 'package:salon_app/presentation/widgets/image_widget.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// ServicesWidget displays a grid of services.
class ServicesWidget extends StatelessWidget {
  /// Constructor for the ServicesWidget.
  const ServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                trans(context, key: 'Popular Services'),
                style: StyleHelper.titleMedium(context)
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              
            ],
          ),
          spacing(height: 8),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisExtent: 110,
            ),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ServiceListData.list.length,
            itemBuilder: (context, index) {
              final service = ServiceListData.list[index];
              return GestureDetector(
                onTap: () { 
                  navigateToScreen(context, ServicesScreen(text:service['title'] ,));
                },
                behavior: HitTestBehavior.opaque,
                child: ServiceGridItem(
                  icon: service['icon'],
                  title: service['title'],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

/// ServiceGridItem displays an individual service in the grid.
class ServiceGridItem extends StatelessWidget {
  /// Icon for the service.
  final String icon;

  /// Title of the service.
  final String title;

  /// Constructor for the ServiceGridItem.
  const ServiceGridItem({
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
          margin: const EdgeInsets.all(2),
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
        Flexible(
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
