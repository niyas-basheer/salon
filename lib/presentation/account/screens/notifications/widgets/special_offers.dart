import 'package:flutter/material.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// Widget for handling special offers notifications.
class SpecialOffers extends StatefulWidget {
  /// Constructor for the [SpecialOffers] class.
  const SpecialOffers({super.key});

  @override
  State<SpecialOffers> createState() => _SpecialOffersState();
}

class _SpecialOffersState extends State<SpecialOffers> {
  bool push = true;
  bool email = true;
  bool sms = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          trans(context, key: 'offers_and_promos'),
          style: StyleHelper.bodyLarge(context)
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        spacing(height: 5),
        Text(
          trans(context, key: 'receives_updates_about_coupons'),
          style: StyleHelper.titleSmall(context),
        ),
        Row(
          children: [
            Expanded(
              child: Text(trans(context, key: 'push'), style: StyleHelper.labelLarge(context)),
            ),
            Switch(
              value: push,
              onChanged: (e) {
                setState(() {
                  push = e;
                });
              },
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text(trans(context, key: 'push'), style: StyleHelper.labelLarge(context)),
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
        Row(
          children: [
            Expanded(
              child: Text(trans(context, key: 'sms'), style: StyleHelper.labelLarge(context)),
            ),
            Switch(
              value: sms,
              onChanged: (e) {
                setState(() {
                  sms = e;
                });
              },
            )
          ],
        ),
      ],
    );
  }
}
