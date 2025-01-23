import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/widgets/action_icon_button.dart';

class AccountScreenWrapper extends StatelessWidget {
  const AccountScreenWrapper({super.key, this.pageInfo, required this.content});

  final dynamic pageInfo;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: [content],
        ));
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        trans(context, key: pageInfo['title']),
        style: StyleHelper.titleLarge(context)
            ?.copyWith(fontWeight: FontWeight.w500),
      ),
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      leading: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: ActionIconButton(
            icon: LucideIcons.arrowLeft,
            onPressed: () {
              navigateBack(context);
            },
          ),
        ),
      ),
    );
  }
}
