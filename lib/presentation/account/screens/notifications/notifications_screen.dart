import 'package:flutter/material.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/account/screens/notifications/widgets/enable_all.dart';
import 'package:salon_app/presentation/account/screens/notifications/widgets/important_updates.dart';
import 'package:salon_app/presentation/account/screens/notifications/widgets/news_letters.dart';
import 'package:salon_app/presentation/account/screens/notifications/widgets/special_offers.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// Screen for managing notifications preferences.
class NotificationsScreen extends StatefulWidget {
  /// Constructor for the [NotificationsScreen] class.
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool activeAll = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spacing(height: 20),
        Text(
          trans(context,
              key: 'define_what_alerts_and_notifications_you_want_to_see'),
          style: StyleHelper.titleSmall(context),
        ),
        spacing(height: 20),
        const EnableAll(),
        thickDivider(),
        const NewsLetters(),
        thickDivider(),
        const SpecialOffers(),
        thickDivider(),
        const ImportantUpdates(),
        spacing(height: 50),
      ],
    );
  }

  /// Widget for thick divider.
  Widget thickDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Divider(
        thickness: 3,
        color: ColorHelper.titleSmallColor(context).withOpacity(0.2),
      ),
    );
  }
}
