import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/bloc/salon/our_services_bloc/our_services_bloc.dart';
import 'package:salon_app/core/constants/assets_const.dart';
import 'package:salon_app/core/constants/image_type_const.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/widgets/image_widget.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// This card includes an image, service name, price, timing, and a remove button.
class BookingServiceCard extends StatelessWidget {
  /// Constructor for the [BookingServiceCard] class.
  ///
  /// The [key] parameter is optional and is used to uniquely identify the widget.
  /// The [data] parameter holds dynamic data representing the service information.
  const BookingServiceCard({super.key, this.data});

  /// Dynamic data representing the service information.
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    /// Builds the widget hierarchy for the [BookingServiceCard].
    ///
    /// Returns a [Container] containing the card with specified decoration,
    /// a row of child widgets, and an [IconButton] for removing the service.
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ImageWidget(
              image: data['image'],
              height: 50,
              width: 55,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(12),
              type: ImageType.asset,
              placeholder: AssetsConst.servicePlaceholder,
            ),
            spacing(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${data['name'] ?? 'N/A'}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: StyleHelper.titleMedium(context)
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  spacing(height: 5),
                  Row(
                    children: [
                      Text(
                        '\$${data['price'] ?? 'N/A'}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: StyleHelper.titleMedium(context)?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: ColorHelper.primaryToWhite(context),
                        ),
                      ),
                      spacing(width: 5),
                      Text(
                        '• ${data['timing'] ?? 'N/A'}',
                        style: StyleHelper.titleMedium(context)
                            ?.copyWith(color: Theme.of(context).dividerColor),
                      ),
                      spacing(width: 10),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                // Dispatching remove service event when the remove button is pressed
                context
                    .read<OurServicesBloc>()
                    .add(SelectSubServiceEvent(data: data));
              },
              icon: const Icon(
                LucideIcons.minusCircle,
                size: 30,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
