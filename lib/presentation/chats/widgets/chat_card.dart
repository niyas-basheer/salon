import 'package:flutter/material.dart';
import 'package:salon_app/core/constants/assets_const.dart';
import 'package:salon_app/core/constants/image_type_const.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/chats/conversation_screen.dart';
import 'package:salon_app/presentation/widgets/image_widget.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// Widget to display a chat card.
class ChatCard extends StatelessWidget {
  /// Constructs a [ChatCard].
  const ChatCard({super.key, this.data});

  /// Data representing the chat card.
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateToScreen(context, ConversationScreen(data: data));
      },
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserAvatar(data['image']),
            spacing(width: 15),
            Expanded(
              child: _buildChatDetails(context, data),
            )
          ],
        ),
      ),
    );
  }

  /// Builds the user avatar.
  Widget _buildUserAvatar(String imageUrl) {
    return ImageWidget(
      image: imageUrl,
      fit: BoxFit.cover,
      width: 50,
      height: 50,
      borderRadius: BorderRadius.circular(100),
      placeholder: AssetsConst.avatarPlaceholder2,
      type: ImageType.asset,
    );
  }

  /// Builds the chat details.
  Widget _buildChatDetails(BuildContext context, dynamic data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildUserNameAndTime(context, data),
        spacing(height: 5),
        _buildMessage(context, data),
      ],
    );
  }

  /// Builds the user name and time.
  Widget _buildUserNameAndTime(BuildContext context, dynamic data) {
    return Row(
      children: [
        Expanded(
          child: Text(
            data['name'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: StyleHelper.titleMedium(context)
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Text(
          getTimeFormat(data['last_message']),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: StyleHelper.titleSmall(context),
        ),
      ],
    );
  }

  /// Builds the message.
  Widget _buildMessage(BuildContext context, dynamic data) {
    return Row(
      children: [
        Expanded(
          child: Text(
            '${data['message']}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: StyleHelper.titleSmall(context)?.copyWith(
              color: data['unread_messages'] != 0
                  ? StyleHelper.titleMedium(context)?.color
                  : null,
              fontWeight: data['unread_messages'] != 0 ? FontWeight.w600 : null,
            ),
          ),
        ),
        if (data['unread_messages'] != 0) ...[
          spacing(width: 10),
          _buildUnreadMessagesIndicator(context, data['unread_messages']),
        ],
      ],
    );
  }

  /// Builds the unread messages indicator.
  Widget _buildUnreadMessagesIndicator(
      BuildContext context, int unreadMessages) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
      height: 20,
      width: 20,
      child: Center(
        child: Text(
          '$unreadMessages',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
