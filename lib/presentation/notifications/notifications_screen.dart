import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/data/notifications_data.dart';
import 'package:salon_app/presentation/notifications/widgets/notification_group.dart';
import 'package:salon_app/presentation/widgets/action_icon_button.dart';

/// A screen widget to display notifications.
class NotificationScreen extends StatefulWidget {
  /// Constructs a [NotificationScreen] widget.
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildNotificationGroup(NotificationsData.list),
    );
  }

  /// Builds the app bar for the notification screen.
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        trans(context, key: 'notifications'),
        style: StyleHelper.titleLarge(context)?.copyWith(fontWeight: FontWeight.w500),
      ),
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      leading: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: ActionIconButton(
            icon: LucideIcons.arrowLeft,
            onPressed: () {
              // Navigate back when the arrow button is pressed.
              navigateBack(context);
            },
          ),
        ),
      ),
    );
  }

  /// Builds the notification group widget.
  Widget _buildNotificationGroup(List<dynamic> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return NotificationGroup(data: list[index]);
      },
    );
  }
}
