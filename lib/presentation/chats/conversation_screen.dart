import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/themes/colors.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/data/chats_data.dart';
import 'package:salon_app/presentation/chats/widgets/chat_bubble.dart';
import 'package:salon_app/presentation/chats/widgets/conversation_app_bar.dart';
import 'package:salon_app/presentation/widgets/action_icon_button.dart';

/// Widget representing the conversation screen.
class ConversationScreen extends StatefulWidget {
  /// Constructs a [ConversationScreen].
  const ConversationScreen({super.key, this.data});

  /// Data for the conversation.
  final dynamic data;

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final TextEditingController _chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  void dispose() {
    _chatController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConversationAppBar(data: widget.data),
      body: Column(
        children: [
          Expanded(child: _buildConversationWidget(ConversationData.list)),
          _buildChatInput(),
        ],
      ),
    );
  }

  /// Builds the conversation widget.
  Widget _buildConversationWidget(List<dynamic> list) {
    return ListView.builder(
      itemCount: list.length,
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      itemBuilder: (context, index) {
        return ChatBubble(data: list[index]);
      },
    );
  }

  /// Builds the chat input widget.
  Widget _buildChatInput() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(LucideIcons.paperclip),
            ),
            Expanded(
              child: TextFormField(
                controller: _chatController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  hintText: trans(context, key: 'ask_anything'),
                  border: InputBorder.none,
                ),
              ),
            ),
            Visibility(
              visible: _chatController.text.isNotEmpty,
              replacement: IconButton(
                onPressed: () {},
                icon: const Icon(LucideIcons.mic),
              ),
              child: ActionIconButton(
                icon: LucideIcons.send,
                backgroundColor: AppColors.primaryLight,
                iconColor: Colors.black87,
                onPressed: () {},
              ).animate().scale(duration: const Duration(milliseconds: 100)),
            ),
          ],
        ),
      ),
    );
  }
}
