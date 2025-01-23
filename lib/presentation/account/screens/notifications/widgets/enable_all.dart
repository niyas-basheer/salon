import 'package:flutter/material.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// Widget for enabling all notifications.
class EnableAll extends StatefulWidget {
  /// Constructor for the [EnableAll] class.
  const EnableAll({super.key});

  @override
  State<EnableAll> createState() => _EnableAllState();
}

class _EnableAllState extends State<EnableAll> {
  bool activeAll = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                trans(context, key: 'enable_all'),
                style: StyleHelper.bodyLarge(context)?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              spacing(height: 5),
              Text(
                trans(context, key: 'activate_all_notifications'),
                style: StyleHelper.titleSmall(context),
              ),
            ],
          ),
        ),
        Switch(
          value: activeAll,
          onChanged: (e) {
            setState(() {
              activeAll = e;
            });
          },
        )
      ],
    );
  }
}
