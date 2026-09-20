import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/chat_preview.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/chat_list_tile.dart';
import 'chat_detail_screen.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int _filterIndex = 0;

  static const List<String> _filters = ['Все', 'Сделки', 'Поддержка'];

  List<ChatPreview> get _filteredChats {
    if (_filterIndex == 1) {
      return MockData.chats.where((c) => c.kind == ChatKind.deal).toList();
    }
    if (_filterIndex == 2) {
      return MockData.chats.where((c) => c.kind == ChatKind.support).toList();
    }
    return MockData.chats;
  }

  void _openChat(BuildContext context, ChatPreview chat) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => ChatDetailScreen(chat: chat)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final chats = _filteredChats;

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Row(
              children: [
                Text('Чаты', style: AppTextStyles.h1),
                const Spacer(),
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.edit_note_rounded, color: AppColors.textPrimary, size: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
            child: Row(
              children: List.generate(_filters.length, (index) {
                final selected = index == _filterIndex;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () => setState(() => _filterIndex = index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: selected ? AppColors.primary : AppColors.surface,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: selected ? AppColors.primary : AppColors.border,
                        ),
                      ),
                      child: Text(
                        _filters[index],
                        style: AppTextStyles.bodySmall.copyWith(
                          color: selected ? Colors.white : AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: chats.isEmpty
                ? _buildEmptyState()
                : ListView.separated(
                    padding: const EdgeInsets.only(bottom: 16),
                    itemCount: chats.length,
                    separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.only(left: 72),
                      child: Divider(height: 1),
                    ),
                    itemBuilder: (context, index) {
                      final chat = chats[index];
                      return ChatListTile(
                        chat: chat,
                        onTap: () => _openChat(context, chat),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.chat_bubble_outline_rounded, size: 48, color: AppColors.textTertiary),
            const SizedBox(height: 12),
            Text(
              'Здесь пока нет чатов',
              style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}
