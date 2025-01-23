import 'package:flutter/material.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/notifications/widgets/notification_card.dart';

/// A widget to display a group of notifications.
class NotificationGroup extends StatelessWidget {
  /// Constructs a [NotificationGroup] widget.
  const NotificationGroup({super.key, this.data});

  /// The data representing the notification group.
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildGroupItem(context),
        _buildNotificationList(context),
      ],
    );
  }

  /// Builds the group item widget.
  Widget _buildGroupItem(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorHelper.grey20Lite(context)),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          Text(trans(context, key: data['date']),
              style: StyleHelper.titleMedium(context)),
        ],
      ),
    );
  }

  /// Builds the list of notifications.
  Widget _buildNotificationList(BuildContext context) {
    return ListView.builder(
      itemCount: data['list'].length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return NotificationCard(data: data['list'][index]);
      },
    );
  }
}
