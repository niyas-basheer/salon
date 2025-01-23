import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/data/address_data.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// A StatefulWidget representing the screen for selecting a location.
class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _buildAppBar(context),
        body: Column(
          children: [_buildSearchBar(), _buildListBuilder(AddressData.list)],
        ),
      ),
    );
  }

  /// Builds the app bar for the select location screen.
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        trans(context, key: trans(context, key: 'select_a_location')),
        style: StyleHelper.titleLarge(context)
            ?.copyWith(fontWeight: FontWeight.w500),
      ),
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      leading: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            icon: const Icon(LucideIcons.x),
            onPressed: () {
              navigateBack(context);
            },
          ),
        ),
      ),
    );
  }

  /// Builds the search bar widget for the select location screen.
  Widget _buildSearchBar() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(LucideIcons.search),
                  hintText: trans(context, key: 'search_your_address'),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the list view builder for displaying addresses.
  Widget _buildListBuilder(List<dynamic> list) {
    return Expanded(
      child: ListView.builder(
        itemCount: list.length,
        padding: const EdgeInsets.all(15),
        itemBuilder: (context, index) {
          return _buildAddressItem(list[index]);
        },
      ),
    );
  }

  /// Builds an address item widget for the list view.
  Widget _buildAddressItem(dynamic data) {
    return GestureDetector(
      onTap: () {
        navigateBack(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(15),
          border: getBoxBorder(context),
        ),
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          children: [
            Icon(
              LucideIcons.mapPin,
              color: ColorHelper.primaryToWhite(context),
            ),
            spacing(width: 10),
            Expanded(
              child: Text(
                '${data['location']}',
                style: StyleHelper.titleMedium(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
