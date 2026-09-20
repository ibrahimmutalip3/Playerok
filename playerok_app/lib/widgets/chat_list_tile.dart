import 'package:flutter/material.dart';
import '../models/chat_preview.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class ChatListTile extends StatelessWidget {
  final ChatPreview chat;
  final VoidCallback? onTap;

  const ChatListTile({
    super.key,
    required this.chat,
    this.onTap,
  });

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
    final bool unread = chat.unreadCount > 0;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: _avatarColor.withValues(alpha: 0.14),
                  child: Text(
                    chat.avatarLabel,
                    style: TextStyle(
                      color: _avatarColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
                if (chat.isOnline)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: AppColors.online,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (chat.kind == ChatKind.support || chat.kind == ChatKind.system)
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Icon(Icons.verified_rounded, size: 15, color: AppColors.primary),
                        ),
                      Expanded(
                        child: Text(
                          chat.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        chat.time,
                        style: AppTextStyles.caption.copyWith(
                          color: unread ? AppColors.primary : AppColors.textTertiary,
                          fontWeight: unread ? FontWeight.w700 : FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          chat.lastMessage,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: unread ? AppColors.textPrimary : AppColors.textSecondary,
                            fontWeight: unread ? FontWeight.w500 : FontWeight.w400,
                          ),
                        ),
                      ),
                      if (unread)
                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.badge,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '${chat.unreadCount}',
                            style: AppTextStyles.caption.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 11,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
