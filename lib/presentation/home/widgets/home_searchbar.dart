import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/presentation/explore/widgets/filter_widget.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// HomeSearchbar displays a search bar with a filter icon for the home screen.
class HomeSearchbar extends StatelessWidget {
  /// Constructor for the HomeSearchbar widget.
  const HomeSearchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: fieldDeco(
                  prefixIcon: LucideIcons.search,
                  hintText: trans(context, key: 'search_for_salon')),
            ),
          ),
          spacing(width: 5),
          
        ],
      ),
    );
  }
}
