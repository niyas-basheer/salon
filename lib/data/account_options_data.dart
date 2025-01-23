import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AccountOptionsData {
  AccountOptionsData._();

  static const List<dynamic> list = [
    {
      "icon": LucideIcons.heart,
      "title": "your_favorites",
      "color": Colors.pink
    },
    {
      "icon": LucideIcons.lock,
      "title": "change_password",
      "color": Colors.brown
    },
    {
      "icon": LucideIcons.bell,
      "title": "notifications",
      "color": Colors.teal,
    },
    {
      "icon": LucideIcons.moon,
      "title": "appearance",
      "color": Colors.orange,
    },
    {
      "icon": LucideIcons.info,
      "title": "about",
      "color": Colors.green,
    },
    {
      "icon": LucideIcons.helpCircle,
      "title": "help",
      "color": Colors.purple,
    },
    {
      "icon": LucideIcons.logOut,
      "title": "logout",
      "color": Colors.red,
    },
  ];
}
