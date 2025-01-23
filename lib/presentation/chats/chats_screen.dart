import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/data/chats_data.dart';
import 'package:salon_app/presentation/chats/widgets/chat_card.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// Screen to display chats.
class ChatsScreen extends StatefulWidget {
  /// Constructs a [ChatsScreen].
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _listWidget(ChatsList.list),
    );
  }

  /// Builds the app bar.
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text(
        trans(context, key: 'chats'),
        style: StyleHelper.headlineSmall(context)
            ?.copyWith(fontWeight: FontWeight.w500),
      ),
      surfaceTintColor: Colors.transparent,
      actions: [
        IconButton(
          icon: const Icon(LucideIcons.search),
          onPressed: () {},
        ),
        spacing(width: 12),
      ],
    );
  }

  /// Builds the list of chat cards.
  Widget _listWidget(List<dynamic> list) {
    return ListView.builder(
      itemCount: list.length,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      itemBuilder: (context, index) {
        return ChatCard(data: list[index]);
      },
    );
  }
}
