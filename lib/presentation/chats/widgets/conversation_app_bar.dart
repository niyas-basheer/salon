import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/constants/assets_const.dart';
import 'package:salon_app/core/constants/image_type_const.dart';
import 'package:salon_app/core/themes/colors.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/widgets/image_widget.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// AppBar for a conversation screen.
class ConversationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  /// Constructs a [ConversationAppBar].
  const ConversationAppBar({super.key, this.data});

  /// Data representing the conversation.
  final dynamic data;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          _buildProfileImage(),
          spacing(width: 10),
          Expanded(child: _buildUserInfo(context)),
        ],
      ),
      surfaceTintColor: Colors.transparent,
      actions: [
        IconButton(
          icon: const Icon(LucideIcons.phone),
          onPressed: () {},
        ),
        _buildPopupMenuButton(context),
        spacing(width: 12),
      ],
    );
  }

  /// Builds the user profile image.
  Widget _buildProfileImage() {
    return ImageWidget(
      image: data['image'],
      fit: BoxFit.cover,
      width: 42,
      height: 42,
      borderRadius: BorderRadius.circular(100),
      placeholder: AssetsConst.avatarPlaceholder2,
      type: ImageType.asset,
    );
  }

  /// Builds user information section.
  Widget _buildUserInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data['name'],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: StyleHelper.titleMedium(context)
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        spacing(height: 2),
        Row(
          children: [
            const Icon(Icons.circle, size: 10, color: AppColors.tealGreen),
            spacing(width: 5),
            Text(
              trans(context, key: 'online'),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.tealGreen,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        )
      ],
    );
  }

  /// Builds the popup menu button.
  Widget _buildPopupMenuButton(BuildContext context) {
    return PopupMenuButton<int>(
      onSelected: (int result) {},
      icon: const Icon(LucideIcons.moreVertical),
      itemBuilder: (BuildContext context) => [
        _buildMenuItem(
          context,
          value: 1,
          icon: LucideIcons.volume2,
          title: trans(context, key: 'mute'),
          trailingIcon: LucideIcons.chevronRight,
        ),
        _buildMenuItem(
          context,
          value: 2,
          icon: LucideIcons.search,
          title: trans(context, key: 'search'),
        ),
        _buildMenuItem(
          context,
          value: 3,
          icon: LucideIcons.ban,
          title: trans(context, key: 'block'),
        ),
        _buildMenuItem(
          context,
          value: 4,
          icon: LucideIcons.alertCircle,
          title: trans(context, key: 'report'),
        ),
      ],
    );
  }

  /// Builds a popup menu item.
  PopupMenuItem<int> _buildMenuItem(
    BuildContext context, {
    required int value,
    required IconData icon,
    required String title,
    IconData? trailingIcon,
  }) {
    return PopupMenuItem<int>(
      value: value,
      child: ListTile(
        leading: Icon(icon, color: ColorHelper.titleSmallColor(context)),
        title: Text(title, style: StyleHelper.titleMedium(context)),
        trailing: trailingIcon != null
            ? Icon(trailingIcon, color: ColorHelper.titleSmallColor(context))
            : null,
      ),
    );
  }
}
