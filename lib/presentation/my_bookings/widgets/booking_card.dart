import 'package:flutter/material.dart';
import 'package:salon_app/core/constants/assets_const.dart';
import 'package:salon_app/core/constants/booking_status_const.dart';
import 'package:salon_app/core/constants/image_type_const.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/widgets/custom_button.dart';
import 'package:salon_app/presentation/widgets/image_widget.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// Widget representing a booking card.
class BookingCard extends StatelessWidget {
  /// Constructor for the [BookingCard] class.
  const BookingCard({super.key, this.data, required this.type});

  /// The booking data.
  final dynamic data;

  /// The type of booking card, e.g., pending, completed, cancelled.
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(15),
        border: getBoxBorder(context),
      ),
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDateTimeInfo(context),
            const Divider(height: 1),
            spacing(height: 12),
            _buildSalonInfo(context),
            spacing(height: 12),
            const Divider(height: 1),
            if (type != BookingStatusConst.cancelled) ...[
              spacing(height: 12),
              _buildActionButtons(context),
               if (type == BookingStatusConst.completed) ...[
          spacing(height: 10),
          TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: '    Write Reviw',

              ),
          )
          
        ], 
            ]
          ],
        ),
      ),
    );
  }

  /// Builds the date and time information section of the booking card.
  Widget _buildDateTimeInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spacing(height: 5),
        Row(
          children: [
            Text(
              formatDateTime(date: data['booking_date']),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: StyleHelper.titleMedium(context)
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            Spacer(), 
             Text( 
              '${data['booking_time']}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: StyleHelper.titleMedium(context)
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
        spacing(height: 12),
      ],
    );
  }

  /// Builds the salon information section of the booking card.
  Widget _buildSalonInfo(BuildContext context) {
    return Row(
      children: [
        ImageWidget(
          image: data['image'],
          height: 80,
          width: 85,
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
                '${data['salon_name'] ?? 'N/A'}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: StyleHelper.titleMedium(context)
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              spacing(height: 5),
              Text(
                '${data['address'] ?? 'N/A'}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: StyleHelper.titleSmall(context),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Builds the action buttons section of the booking card.
  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        if (type == BookingStatusConst.pending) ...[
          Expanded(
            child: CustomButton(
              title: trans(context, key: 'cancel'),
              lined: true,
              textColor: Colors.red,
              color: Colors.transparent,
              onTap: () {},
            ),
          ),
          spacing(width: 10),
        ],
       
        Expanded(
          child: CustomButton(
            title: trans(context, key: 'view_e_receipt'),
            color: type == BookingStatusConst.completed?Colors.transparent:Theme.of(context).primaryColor, 
            lined: type ==BookingStatusConst.completed? true:false,
            textColor: type == BookingStatusConst.completed?Colors.grey:Colors.white, 
            onTap: () {},
          ),
         ),

         if (type == BookingStatusConst.completed) ...[
          spacing(width: 10),
          Expanded(
            child: CustomButton( 
              title: trans(context, key: 'Rebook'),
              onTap: () {},
            ),
          ),
          
        ],
      ],
    );
    
  }
}
