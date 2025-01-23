import 'package:flutter/material.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/styles.dart';

/// Widget representing a chat bubble in the conversation screen.
class ChatBubble extends StatelessWidget {
  /// Constructs a [ChatBubble].
  const ChatBubble({super.key, this.data});

  /// Data representing the chat message.
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    final bool isIncoming = data['incomingMessage'] ?? false;
    final ThemeData theme = Theme.of(context);
    final Color bubbleColor =
        isIncoming ? ColorHelper.grey20Lite(context) : theme.primaryColor;
    final Color? textColor = isIncoming ? null : Colors.white;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Align(
        alignment: isIncoming ? Alignment.topLeft : Alignment.topRight,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
          child: Column(
            crossAxisAlignment:
                isIncoming ? CrossAxisAlignment.start : CrossAxisAlignment.end,
            children: [
              Card(
                elevation: 0,
                color: bubbleColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20),
                    topRight: const Radius.circular(20),
                    bottomLeft: Radius.circular(isIncoming ? 0 : 20),
                    bottomRight: Radius.circular(isIncoming ? 20 : 0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    '${data['message']}',
                    style: StyleHelper.titleMedium(context)?.copyWith(
                      color: textColor,
                    ),
                  ),
                ),
              ),
              Text(
                getTimeFormat(data['last_message']),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: StyleHelper.labelMedium(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
