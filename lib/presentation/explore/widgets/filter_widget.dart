import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/data/amenities_data.dart';
import 'package:salon_app/data/services_list_data.dart';
import 'package:salon_app/presentation/widgets/custom_button.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// Widget for filtering salon services.
class FilterWidget extends StatefulWidget {
  /// Constructor for the [FilterWidget] class.
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  double _value = 1.0;
  final int _steps = 4;
  final double _min = 1.0;
  final double _max = 5.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _buildAppBar(context),
        bottomNavigationBar: _buildBottomNavigationBar(context),
        body: _buildFilterOptions(context),
      ),
    );
  }

  /// Builds the app bar for the filter widget.
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(trans(context, key: 'filter')),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(LucideIcons.x),
        onPressed: () {
          navigateBack(context);
        },
      ),
      actions: [
        CustomButton(
          title: trans(context, key: 'reset'),
          color: Colors.transparent,
          textColor: ColorHelper.primaryToWhite(context),
          onTap: () {},
        ),
      ],
    );
  }

  /// Builds the bottom navigation bar for the filter widget.
  Widget _buildBottomNavigationBar(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  title: trans(context, key: 'apply_filter'),
                  yPadding: 14,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Builds the filter options for the filter widget.
  Widget _buildFilterOptions(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      children: [
        _buildLocationSelection(context),
        _buildServiceType(context),
        _buildRatings(context),
        _buildAmenities(context),
      ],
    );
  }

  /// Builds the location selection section for the filter widget.
  Widget _buildLocationSelection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          trans(context, key: 'select_location'),
          style: StyleHelper.titleMedium(context)
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        spacing(height: 8),
        TextFormField(
          decoration: fieldDeco(
            prefixIcon: LucideIcons.mapPin,
            hintText: trans(context, key: 'search_for_area_street_name'),
          ),
        ),
        ListTile(
          leading: Icon(LucideIcons.locateFixed,
              color: ColorHelper.primaryToWhite(context)),
          onTap: () {},
          dense: true,
          title: Text(
            trans(context, key: 'use_current_location'),
            style: StyleHelper.titleSmall(context)?.copyWith(
              fontWeight: FontWeight.w600,
              color: ColorHelper.primaryToWhite(context),
            ),
          ),
        ),
        spacing(height: 15),
      ],
    );
  }

  /// Builds the service type selection section for the filter widget.
  Widget _buildServiceType(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          trans(context, key: 'service_type'),
          style: StyleHelper.titleMedium(context)
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        spacing(height: 8),
        // DropdownSearch<dynamic>(
        //   items: ServiceListData.list,
        //   popupProps: PopupProps.menu(
        //     itemBuilder: (context, item, isSelected) {
        //       return ListTile(
        //         title: Text(item['title']),
        //       );
        //     },
        //   ),
        //   dropdownBuilder: (context, selectedItem) => Text(
        //       '${selectedItem?['title'] ?? trans(context, key: 'select_service_type')}'),
        //   dropdownDecoratorProps: DropDownDecoratorProps(
        //     dropdownSearchDecoration:
        //         fieldDeco(hintText: trans(context, key: 'select_service_type')),
        //   ),
        // ),
        spacing(height: 20),
      ],
    );
  }

  /// Builds the ratings selection section for the filter widget.
  Widget _buildRatings(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          trans(context, key: 'ratings_cap'),
          style: StyleHelper.titleMedium(context)
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        spacing(height: 8),
        Row(
          children: [
            Expanded(
              child: Slider(
                value: _value,
                min: _min,
                max: _max,
                divisions: _steps,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
            ),
            Text(
              '${_value.toInt()} ${trans(context, key: 'star')}',
              style: StyleHelper.titleMedium(context)
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        spacing(height: 15),
      ],
    );
  }

  /// Builds the amenities selection section for the filter widget.
  Widget _buildAmenities(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          trans(context, key: 'amenities'),
          style: StyleHelper.titleMedium(context)
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        spacing(height: 8),
        Wrap(
          spacing: 10,
          runSpacing: 5,
          children: [
            for (var item in AmenitiesData.list)
              _buildAmenityButton(context, item),
          ],
        ),
      ],
    );
  }

  /// Builds an amenity button for the filter widget.
  Widget _buildAmenityButton(BuildContext context, Map<String, dynamic> item) {
    return CustomButton(
      title: item['title'],
      leftIcon: item['icon'],
      color: ColorHelper.grey20Lite(context),
      textColor: ColorHelper.titleMediumColor(context),
      onTap: () {},
    );
  }
}
