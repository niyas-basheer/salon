import 'package:flutter/material.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/presentation/salon/widgets/our_services_widget.dart';
import 'package:salon_app/presentation/widgets/sheet_app_bar.dart';

/// A widget for selecting additional services.
class SelectMoreServices extends StatefulWidget {
  /// Constructs a [SelectMoreServices] instance.
  const SelectMoreServices({super.key});

  @override
  State<SelectMoreServices> createState() => _SelectMoreServicesState();
}

class _SelectMoreServicesState extends State<SelectMoreServices> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return SizedBox(
      height: 600,
      child: Padding(
        padding: EdgeInsets.only(bottom: mediaQueryData.viewInsets.bottom),
        child: Column(
          children: [
            DialogHeader(title: trans(context, key: 'add_more_services')),
            Expanded(
              child: ListView(
                children: const [OurServicesWidget()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
