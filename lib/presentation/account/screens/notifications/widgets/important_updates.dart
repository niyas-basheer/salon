import 'package:flutter/material.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// Widget for handling important updates notifications.
class ImportantUpdates extends StatefulWidget {
  /// Constructor for the [ImportantUpdates] class.
  const ImportantUpdates({super.key});

  @override
  State<ImportantUpdates> createState() => _ImportantUpdatesState();
}

class _ImportantUpdatesState extends State<ImportantUpdates> {
  bool email = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          trans(context, key: 'important_updates'),
          style: StyleHelper.bodyLarge(context)
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        spacing(height: 5),
        Text(
          trans(context,
              key: 'receive_important_updates_related_to_your_account'),
          style: StyleHelper.titleSmall(context),
        ),
        Row(
          children: [
            Expanded(
              child: Text(trans(context, key: 'email'),
                  style: StyleHelper.labelLarge(context)),
            ),
            Switch(
              value: email,
              onChanged: (e) {
                setState(() {
                  email = e;
                });
              },
            )
          ],
        ),
      ],
    );
  }
}
