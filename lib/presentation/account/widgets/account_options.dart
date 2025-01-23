import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/data/account_options_data.dart';
import 'package:salon_app/presentation/account/account_screen_wrapper.dart';
import 'package:salon_app/presentation/account/screens/appearance_screen.dart';
import 'package:salon_app/presentation/account/screens/change_password_screen.dart';
import 'package:salon_app/presentation/account/screens/notifications/notifications_screen.dart';
import 'package:salon_app/presentation/common/web_view_screen.dart';
import 'package:salon_app/presentation/account/screens/your_favorites_screen.dart';
import 'package:salon_app/presentation/auth/login_screen.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// Widget for displaying account options.
class AccountOptions extends StatelessWidget {
  const AccountOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(20),
          border: getBoxBorder(context),
        ),
        child: Column(
          children: [
            spacing(height: 5),
            ListView.builder(
              itemCount: AccountOptionsData.list.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item = AccountOptionsData.list[index];
                return AccountOptionItem(
                  icon: item['icon'],
                  title: trans(context, key: item['title']),
                  color: item['color'],
                  showDivider: index != AccountOptionsData.list.length - 1,
                  onTap: () => onTapOption(context, item),
                );
              },
            ),
            spacing(height: 5),
          ],
        ),
      ),
    );
  }

  void onTapOption(BuildContext context, dynamic item) {
    switch (item['title']) {
      case 'your_favorites':
        return onTapFavorites(context, item);
      case 'change_password':
        return onTapChangePassword(context, item);
      case 'notifications':
        return onTapNotification(context, item);
      case 'appearance':
        return onTapAppearance(context, item);
      case 'about':
        return onTapAbout(context, item);
      case 'help':
        return onTapHelp(context, item);
      case 'logout':
        return onTapLogout(context);
    }
  }

  void onTapChangePassword(BuildContext context, dynamic item) {
    navigateToScreen(
      context,
      AccountScreenWrapper(
        pageInfo: item,
        content: const ChangePassword(),
      ),
    );
  }

  void onTapNotification(BuildContext context, dynamic item) {
    navigateToScreen(
      context,
      AccountScreenWrapper(
        pageInfo: item,
        content: const NotificationsScreen(),
      ),
    );
  }

  void onTapAppearance(BuildContext context, dynamic item) {
    navigateToScreen(
      context,
      AccountScreenWrapper(
        pageInfo: item,
        content: const AppearanceScreen(),
      ),
    );
  }

  void onTapFavorites(BuildContext context, dynamic item) {
    navigateToScreen(
      context,
      AccountScreenWrapper(
        pageInfo: item,
        content: const MyFavoritesScreen(),
      ),
    );
  }

  void onTapAbout(BuildContext context, item) {
    navigateToScreen(context,
        WebViewScreen(pageTitle: item['title'], url: 'https://flutter.dev'));
  }

  void onTapHelp(BuildContext context, item) {
    navigateToScreen(context,
        WebViewScreen(pageTitle: item['title'], url: 'https://google.com'));
  }

  void onTapLogout(BuildContext context) {
    navigateToScreen(context, const LoginPage(), clearPreviousRoutes: true);
  }
}

/// Widget for displaying each account option item.
class AccountOptionItem extends StatelessWidget {
  const AccountOptionItem({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    required this.showDivider,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final Color color;
  final bool showDivider;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(7),
                  child: Icon(
                    icon,
                    color: ColorHelper.titleMediumColor(context),
                    size: 22,
                  ),
                ),
                spacing(width: 15),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorHelper.titleMediumColor(context),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(
                  LucideIcons.chevronRight,
                  color: ColorHelper.titleMediumColor(context),
                  size: 21,
                )
              ],
            ),
          ),
        ),
        if (showDivider) const Divider(height: 1, thickness: 0.5),
      ],
    );
  }
}
