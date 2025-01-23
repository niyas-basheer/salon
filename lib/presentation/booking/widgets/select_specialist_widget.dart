import 'package:flutter/material.dart';
import 'package:salon_app/core/constants/image_type_const.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/data/specialist_list_data.dart';
import 'package:salon_app/presentation/widgets/image_widget.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// A widget for selecting a specialist.
class SelectSpecialistWidget extends StatefulWidget {
  /// Constructs a [SelectSpecialistWidget].
  const SelectSpecialistWidget({super.key, required this.onChanged});

  /// Callback function invoked when a specialist is selected.
  final ValueChanged<String> onChanged;

  @override
  State<SelectSpecialistWidget> createState() => _SelectSpecialistWidgetState();
}

class _SelectSpecialistWidgetState extends State<SelectSpecialistWidget> {
  int selectedItem = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(),
        spacing(height: 15),
        _buildSpecialistList(),
      ],
    );
  }

  /// Builds the title for the specialist selection section.
  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        trans(context, key: 'specialist'),
        style: StyleHelper.titleMedium(context)
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }

  /// Builds the list of specialists available for selection.
  Widget _buildSpecialistList() {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: SpecialListData.list.length,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        separatorBuilder: (context, index) => spacing(width: 10),
        itemBuilder: (context, index) => _buildSpecialistItem(index),
      ),
    );
  }

  /// Builds a single specialist item in the list.
  Widget _buildSpecialistItem(int index) {
    final specialist = SpecialListData.list[index];
    final selected = selectedItem == specialist['id'];

    return SizedBox(
      width: 100,
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedItem = specialist['id'];
            widget.onChanged(
                '${SpecialListData.list[index]['first_name']} ${SpecialListData.list[index]['last_name']}');
          });
        },
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              _buildSpecialistImage(specialist, selected),
              spacing(height: 5),
              _buildSpecialistInfo(specialist),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the image representation of the specialist.
  Widget _buildSpecialistImage(Map<String, dynamic> specialist, bool selected) {
    return Stack(
      children: [
        ImageWidget(
          image: specialist['profile_photo'],
          fit: BoxFit.cover,
          width: 70,
          height: 70,
          borderRadius: BorderRadius.circular(100),
          type: ImageType.asset,
        ),
        if (selected)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.check_circle,
                  color: Theme.of(context).primaryColor, size: 20),
            ),
          ),
      ],
    );
  }

  /// Builds the information section for the specialist.
  Widget _buildSpecialistInfo(Map<String, dynamic> specialist) {
    return Column(
      children: [
        Text(
          specialist['first_name'],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Text(
          specialist['role_type'],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: StyleHelper.labelSmall(context)?.copyWith(
            fontWeight: FontWeight.w400,
            color: StyleHelper.titleSmall(context)?.color,
          ),
        ),
      ],
    );
  }
}
