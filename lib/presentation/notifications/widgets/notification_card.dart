import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// A widget to display a notification card.
class NotificationCard extends StatelessWidget {
  /// Constructs a [NotificationCard] widget.
  const NotificationCard({super.key, this.data});

  /// The data representing the notification.
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: getNotificationBgColor(),
            child: Icon(
              getNotificationIcon(),
              size: 20,
              color: Colors.black87,
            ),
          ),
          spacing(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['title'],
                  style: StyleHelper.titleMedium(context),
                ),
                spacing(height: 5),
                Text(
                  timeAgoFormat(data['time']),
                  style: StyleHelper.titleSmall(context),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Gets the icon for the notification based on its status.
  IconData getNotificationIcon() {
    switch (data['status']) {
      case 'completed':
        return LucideIcons.check;
      case 'cancelled':
        return LucideIcons.alertTriangle;
      case 'processing':
        return LucideIcons.clock;
      default:
        return LucideIcons.bell;
    }
  }

  /// Gets the background color for the notification based on its status.
  Color getNotificationBgColor() {
    switch (data['status']) {
      case 'completed':
        return Colors.green.shade100;
      case 'cancelled':
        return Colors.red.shade100;
      case 'processing':
        return Colors.blue.shade100;
      default:
        return Colors.green.shade100;
    }
  }
}
