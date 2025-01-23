import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/constants/assets_const.dart';
import 'package:salon_app/core/constants/image_type_const.dart';
import 'package:salon_app/core/themes/colors.dart';
import 'package:salon_app/presentation/widgets/image_widget.dart';

/// A widget that displays a user's profile avatar with an option to change the avatar using a camera icon.
class ProfileAvatar extends StatelessWidget {
  /// Constructs a [ProfileAvatar] widget.
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          ImageWidget(
            height: 120,
            width: 120,
            image: AssetsConst.avatarPlaceholder,
            borderRadius: BorderRadius.circular(200),
            fit: BoxFit.cover,
            type: ImageType.asset,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Card(
              margin: const EdgeInsets.all(0),
              child: IconButton(
                onPressed: () {},
                visualDensity: VisualDensity.compact,
                icon: const Icon(
                  LucideIcons.camera,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
