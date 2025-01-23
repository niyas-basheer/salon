import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/constants/image_type_const.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/data/specialist_list_data.dart';
import 'package:salon_app/presentation/widgets/action_icon_button.dart';
import 'package:salon_app/presentation/widgets/image_widget.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// Widget for displaying all specialists.
class AllSpecialists extends StatefulWidget {
  /// Constructor for the [AllSpecialists] class.
  const AllSpecialists({super.key});

  @override
  State<AllSpecialists> createState() => _AllSpecialistsState();
}

class _AllSpecialistsState extends State<AllSpecialists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildGridWidget(SpecialListData.list),
    );
  }

  /// Builds the app bar for the AllSpecialists screen.
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        trans(context, key: 'our_specialists'),
        style: StyleHelper.titleLarge(context)
            ?.copyWith(fontWeight: FontWeight.w500),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: ActionIconButton(
          icon: LucideIcons.arrowLeft,
          onPressed: () {
            navigateBack(context);
          },
        ),
      ),
    );
  }

  /// Builds the grid widget to display all specialists.
  Widget _buildGridWidget(List<dynamic> list) {
    return GridView.builder(
      itemCount: list.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      itemBuilder: (BuildContext context, int index) {
        return _buildSpecialistItem(list[index]);
      },
    );
  }

  /// Builds each specialist item in the grid.
  Widget _buildSpecialistItem(Map<String, dynamic> specialist) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageWidget(
          image: specialist['profile_photo'],
          height: 100,
          width: 120,
          borderRadius: BorderRadius.circular(20),
          type: ImageType.asset,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 10),
        Text(
          '${specialist['first_name']} ${specialist['last_name']}',
          style: StyleHelper.titleMedium(context),
        ),
        spacing(height: 2),
        Text(
          '${specialist['role_type']}',
          style: StyleHelper.titleSmall(context),
        ),
      ],
    );
  }
}
