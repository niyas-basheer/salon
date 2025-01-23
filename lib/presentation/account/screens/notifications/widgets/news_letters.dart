import 'package:flutter/material.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// Widget for handling newsletter notifications.
class NewsLetters extends StatefulWidget {
  /// Constructor for the [NewsLetters] class.
  const NewsLetters({super.key});

  @override
  State<NewsLetters> createState() => _NewsLettersState();
}

class _NewsLettersState extends State<NewsLetters> {
  bool email = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          trans(context, key: 'newsletters'),
          style: StyleHelper.bodyLarge(context)
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        spacing(height: 5),
        Text(
          trans(context, key: 'receive_newsletter_to_stay_up_to_date'),
          style: StyleHelper.titleSmall(context),
        ),
        Row(
          children: [
            Expanded(
              child: Text(trans(context, key: 'email'), style: StyleHelper.labelLarge(context)),
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
