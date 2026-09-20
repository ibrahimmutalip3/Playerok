import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/chat_preview.dart';
import '../models/chat_message.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/message_bubble.dart';

class ChatDetailScreen extends StatelessWidget {
  final ChatPreview chat;

  const ChatDetailScreen({
    super.key,
    required this.chat,
  });

  List<ChatMessage> get _messages {
    switch (chat.kind) {
      case ChatKind.support:
        return MockData.supportMessages;
      case ChatKind.system:
        return MockData.playerokMessages;
      case ChatKind.deal:
        return MockData.dealMessages;
    }
  }

  Color get _avatarColor {
    switch (chat.kind) {
      case ChatKind.support:
        return AppColors.primary;
      case ChatKind.system:
        return const Color(0xFF2B323A);
      case ChatKind.deal:
        return const Color(0xFF4C8DFF);
    }
  }

  @override
  Widget build(BuildContext context) {
    final messages = _messages;
    final bool isReadOnly = chat.kind == ChatKind.system;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: _avatarColor.withValues(alpha: 0.14),
              child: Text(
                chat.avatarLabel,
                style: TextStyle(
                  color: _avatarColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          chat.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.h3,
                        ),
                      ),
                      if (chat.kind == ChatKind.support || chat.kind == ChatKind.system)
                        const Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: Icon(Icons.verified_rounded, size: 14, color: AppColors.primary),
                        ),
                    ],
                  ),
                  Text(
                    chat.isOnline ? 'В сети' : 'Официальный аккаунт',
                    style: AppTextStyles.caption.copyWith(
                      color: chat.isOnline ? AppColors.online : AppColors.textTertiary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          if (chat.kind == ChatKind.deal)
            IconButton(
              icon: const Icon(Icons.receipt_long_outlined),
              onPressed: () {},
            ),
          IconButton(
            icon: const Icon(Icons.more_vert_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return MessageBubble(message: messages[index]);
              },
            ),
          ),
          if (!isReadOnly) _buildInputBar(context),
          if (isReadOnly) _buildReadOnlyNotice(context),
        ],
      ),
    );
  }

  Widget _buildReadOnlyNotice(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.border)),
        ),
        child: Row(
          children: [
            const Icon(Icons.info_outline_rounded, size: 18, color: AppColors.textTertiary),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Это системные уведомления, ответить в этом чате нельзя',
                style: AppTextStyles.caption,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputBar(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
        decoration: const BoxDecoration(
          color: AppColors.background,
          border: Border(top: BorderSide(color: AppColors.border)),
        ),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.add_rounded, color: AppColors.textSecondary, size: 22),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Сообщение',
                  style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textTertiary),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.send_rounded, color: Colors.white, size: 18),
            ),
          ],
        ),
      ),
    );
  }
}
